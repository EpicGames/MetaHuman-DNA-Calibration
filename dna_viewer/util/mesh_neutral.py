import logging
from typing import List, Tuple

from maya import cmds
from maya.api.OpenMaya import MDagModifier, MFnMesh, MObject, MPoint

from ..config.mesh import Mesh as MeshConfig
from ..model.dna import DNA
from ..model.mesh import Mesh as MeshModel


class MeshNeutral:
    """
    A utility class used for creating and interacting with meshes
    """

    @staticmethod
    def get_vertex_positions_from_dna_vertex_positions(
        config: MeshConfig, data: MeshModel
    ) -> List[MPoint]:
        """
        Gets a list of points that represent the vertex positions.

        @type config: MeshConfig
        @param config: Mesh configuration from the DNA.

        @type data: MeshModel
        @param data: An object that stores values that get passed around different methods.

        @rtype: List[MPoint]
        @returns: List of maya point objects.
        """

        vertex_positions = []
        for position in data.dna_vertex_positions:
            vertex_positions.append(
                MPoint(
                    config.linear_modifier * position.x,
                    config.linear_modifier * position.y,
                    config.linear_modifier * position.z,
                )
            )
        return vertex_positions

    @staticmethod
    def prepare_mesh(config: MeshConfig, dna: DNA, data: MeshModel) -> None:
        """
        Gets a list of points that represent the vertex positions.

        @type config: MeshConfig
        @param config: Mesh configuration from the DNA.

        @type data: MeshModel
        @param data: An object that stores values that get passed around different methods.
        """

        logging.info("==============================")
        logging.info(f"building mesh with mesh_index: {config.mesh_index}")

        data.dna_vertex_positions = dna.get_vertex_positions_for_mesh_index(
            config.mesh_index
        )
        data.dna_vertex_layout_positions = (
            dna.get_vertex_layout_positions_for_mesh_index(config.mesh_index)
        )

        (
            data.polygon_faces,
            data.polygon_connects,
        ) = dna.get_polygon_faces_and_connects(config.mesh_index)

    @staticmethod
    def create_mesh_object(
        config: MeshConfig, data: MeshModel
    ) -> Tuple[MFnMesh, MObject]:
        """
        Gets a list of points that represent the vertex positions.

        @type config: MeshConfig
        @param config: Mesh configuration from the DNA.

        @type data: MeshModel
        @param data: An object that stores values that get passed around different methods.

        @rtype: Tuple[MFnMesh, MObject]
        @returns: Maya objects representing maya mesh functions and the created maya mesh object.
        """

        fn_mesh = MFnMesh()

        mesh_object = fn_mesh.create(
            MeshNeutral.get_vertex_positions_from_dna_vertex_positions(config, data),
            data.polygon_faces,
            data.polygon_connects,
        )

        return fn_mesh, mesh_object

    @staticmethod
    def rename_mesh(config: MeshConfig, dna: DNA, mesh_object: MObject) -> MDagModifier:
        """
        Renames the initial mesh object that was created to the name from the configuration.

        @type config: MeshConfig
        @param config: Mesh configuration from the DNA.

        @type mesh_object: MObject
        @param data: An object that stores values that get passed around different methods.

        @rtype: Tuple[MDagModifier]
        @returns: Maya object representing the dag modifier.
        """

        mesh_name = dna.get_mesh_name(config.mesh_index)
        logging.info(f"naming mesh to: {mesh_name}")

        dag_modifier = MDagModifier()
        dag_modifier.renameNode(mesh_object, mesh_name)
        dag_modifier.doIt()
        return dag_modifier

    @staticmethod
    def get_texture_data(
        mesh_index: int, dna: DNA
    ) -> Tuple[List[float], List[float], List[int]]:
        """
        Gets the data needed for the creation of textures.

        @type mesh_index: int
        @param mesh_index: The mesh index

        @type dna: DNA
        @param dna: Instance of DNA.

        @rtype: Tuple[List[float], List[float], List[int]] @returns: The tuple containing the list of texture
        coordinate Us, the list of texture coordinate Vs and the list of texture coordinate indices.
        """

        texture_coordinates = dna.get_vertex_texture_coordinates_for_mesh(mesh_index)
        dna_faces = dna.get_faces(mesh_index)

        coordinate_indices = []
        for layout_id in range(len(dna.get_layouts_for_mesh_index(mesh_index))):
            coordinate_indices.append(
                dna.get_texture_coordinate_index(mesh_index, layout_id)
            )

        texture_coordinate_us = []
        texture_coordinate_vs = []
        texture_coordinate_indices = []

        index_counter = 0

        for vertices_layout_index_array in dna_faces:
            for vertex_layout_index_array in vertices_layout_index_array:
                texture_coordinate = texture_coordinates[
                    coordinate_indices[vertex_layout_index_array]
                ]
                texture_coordinate_us.append(texture_coordinate.u)
                texture_coordinate_vs.append(texture_coordinate.v)
                texture_coordinate_indices.append(index_counter)
                index_counter += 1

        return texture_coordinate_us, texture_coordinate_vs, texture_coordinate_indices

    @staticmethod
    def add_texture_coordinates(
        config: MeshConfig, dna: DNA, data: MeshModel, fn_mesh: MFnMesh
    ) -> None:
        """
        Method for adding texture coordinates.

        @type config: MeshConfig
        @param config: Mesh configuration from the DNA.

        @type data: MeshModel
        @param data: An object that stores values that get passed around different methods.

        @type fn_mesh: MFnMesh
        @params fn_mesh: Object used for manipulating maya mesh objects.
        """

        logging.info("adding texture coordinates...")

        (
            texture_coordinate_us,
            texture_coordinate_vs,
            texture_coordinate_indices,
        ) = MeshNeutral.get_texture_data(config.mesh_index, dna)

        fn_mesh.setUVs(texture_coordinate_us, texture_coordinate_vs)
        fn_mesh.assignUVs(data.polygon_faces, texture_coordinate_indices)

        mesh_name = dna.get_mesh_name(config.mesh_index)

        cmds.select(mesh_name, replace=True)
        cmds.polyMergeUV(mesh_name, distance=0.01, constructionHistory=False)
