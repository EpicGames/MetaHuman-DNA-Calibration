import logging
from dataclasses import dataclass, field
from typing import List, Tuple

from maya import cmds
from maya.api.OpenMaya import MDagModifier, MFnDagNode, MFnMesh, MObject, MPoint

from ...builder.maya.util import Maya
from ...common import SKIN_WEIGHT_PRINT_RANGE
from ...dnalib.dnalib import DNA
from ...model import Point3


@dataclass
class Mesh:
    """
    A model class for holding data needed in the mesh building process

    Attributes
    ----------
    @type dna_vertex_positions: List[Point3]
    @param dna_vertex_positions: Data representing the positions of the vertices

    @type dna_vertex_layout_positions: List[int]
    @param dna_vertex_layout_positions: Data representing layout position indices of vertices

    @type polygon_faces: List[int]
    @param polygon_faces: List of lengths of vertex layout indices

    @type polygon_connects: List[int]
    @param polygon_connects: List of vertex layout position indices

    @type derived_mesh_names: List[str]
    @param derived_mesh_names: List of mesh names
    """

    dna_vertex_positions: List[Point3] = field(default_factory=list)
    dna_vertex_layout_positions: List[int] = field(default_factory=list)
    polygon_faces: List[int] = field(default_factory=list)
    polygon_connects: List[int] = field(default_factory=list)
    derived_mesh_names: List[str] = field(default_factory=list)


class MayaMesh:
    """
    A builder class used for adding joints to the scene

    Attributes
    ----------
    @type mesh_index: int
    @param mesh_index: The index of the mesh

    @type dna: DNA
    @param dna: Instance of DNA

    @type blend_shape_group_prefix: str
    @param blend_shape_group_prefix: prefix string for blend shape group

    @type blend_shape_name_postfix: str
    @param blend_shape_name_postfix: postfix string for blend shape name

    @type skin_cluster_suffix: str
    @param skin_cluster_suffix: postfix string for skin cluster name

    @type data: Mesh
    @param data: mesh data used in the mesh creation process

    @type fn_mesh: om.MFnMesh
    @param fn_mesh: OpenMaya class used for creating the mesh

    @type mesh_object: om.MObject
    @param mesh_object: the object representing the mesh

    @type dag_modifier: om.MDagModifier
    @param dag_modifier: OpenMaya class used for naming the mesh
    """

    def __init__(
        self,
        mesh_index: int,
        dna: DNA,
        blend_shape_group_prefix: str,
        blend_shape_name_postfix: str,
        skin_cluster_suffix: str,
    ) -> None:
        self.mesh_index = mesh_index
        self.data: Mesh = Mesh()
        self.fn_mesh = MFnMesh()
        self.mesh_object: MObject = None
        self.dag_modifier: MDagModifier = None
        self.dna = dna
        self.blend_shape_group_prefix = blend_shape_group_prefix
        self.blend_shape_name_postfix = blend_shape_name_postfix
        self.skin_cluster_suffix = skin_cluster_suffix

    def create_neutral_mesh(self) -> MObject:
        """
        Creates the neutral mesh using the config provided for this builder class object

        @rtype: om.MObject
        @returns: the instance of the created mesh object
        """
        self.prepare_mesh()
        self.mesh_object = self.create_mesh_object()
        self.dag_modifier = self.rename_mesh()
        self.add_texture_coordinates()
        return self.mesh_object

    def create_mesh_object(self) -> MObject:
        """
        Gets a list of points that represent the vertex positions.

        @rtype: MObject
        @returns: Maya objects representing maya mesh functions and the created maya mesh object.
        """

        mesh_object = self.fn_mesh.create(
            self.get_vertex_positions_from_dna_vertex_positions(),
            self.data.polygon_faces,
            self.data.polygon_connects,
        )

        return mesh_object

    def get_vertex_positions_from_dna_vertex_positions(self) -> List[MPoint]:
        """
        Gets a list of points that represent the vertex positions.

        @rtype: List[MPoint]
        @returns: List of maya point objects.
        """

        vertex_positions = []
        for position in self.data.dna_vertex_positions:
            vertex_positions.append(
                MPoint(
                    position.x,
                    position.y,
                    position.z,
                )
            )
        return vertex_positions

    def rename_mesh(self) -> MDagModifier:
        """
        Renames the initial mesh object that was created to the name from the configuration.

        @rtype: Tuple[MDagModifier]
        @returns: Maya object representing the dag modifier.
        """

        mesh_name = self.dna.get_mesh_name(self.mesh_index)
        dag_modifier = MDagModifier()
        dag_modifier.renameNode(self.mesh_object, mesh_name)
        dag_modifier.doIt()
        return dag_modifier

    def prepare_mesh(self) -> None:
        """
        Gets a list of points that represent the vertex positions.

        """

        logging.info("==============================")
        mesh_name = self.dna.get_mesh_name(self.mesh_index)
        logging.info(f"adding mesh: {mesh_name}")
        self.data.dna_vertex_positions = self.dna.get_vertex_positions_for_mesh_index(
            self.mesh_index
        )
        self.data.dna_vertex_layout_positions = (
            self.dna.get_vertex_layout_positions_for_mesh_index(self.mesh_index)
        )

        (
            self.data.polygon_faces,
            self.data.polygon_connects,
        ) = self.dna.get_polygon_faces_and_connects(self.mesh_index)

    def add_texture_coordinates(self) -> None:
        """
        Method for adding texture coordinates.

        """

        logging.info("adding texture coordinates...")

        (
            texture_coordinate_us,
            texture_coordinate_vs,
            texture_coordinate_indices,
        ) = self.get_texture_data()

        self.fn_mesh.setUVs(texture_coordinate_us, texture_coordinate_vs)
        self.fn_mesh.assignUVs(self.data.polygon_faces, texture_coordinate_indices)

        mesh_name = self.dna.get_mesh_name(self.mesh_index)

        cmds.select(mesh_name, replace=True)
        cmds.polyMergeUV(mesh_name, distance=0.01, constructionHistory=False)

    def get_texture_data(self) -> Tuple[List[float], List[float], List[int]]:
        """
        Gets the data needed for the creation of textures.

        @rtype: Tuple[List[float], List[float], List[int]] @returns: The tuple containing the list of texture
        coordinate Us, the list of texture coordinate Vs and the list of texture coordinate indices.
        """

        texture_coordinates = self.dna.get_vertex_texture_coordinates_for_mesh(
            self.mesh_index
        )
        dna_faces = self.dna.get_faces(self.mesh_index)

        coordinate_indices = []
        for layout_id in range(
            len(self.dna.get_layouts_for_mesh_index(self.mesh_index))
        ):
            coordinate_indices.append(
                self.dna.get_texture_coordinate_index(self.mesh_index, layout_id)
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

    def add_blend_shapes(self, add_mesh_name_to_blend_shape_channel_name: bool) -> None:
        """Adds blend shapes to the mesh"""
        if self.dna.has_blend_shapes(self.mesh_index):
            self.create_blend_shapes(add_mesh_name_to_blend_shape_channel_name)
            self.create_blend_shape_node()

    def create_blend_shape_node(self) -> None:
        """
        Creates a blend shape node.
        """
        mesh_name = self.dna.get_mesh_name(self.mesh_index)

        nodes = []
        for derived_mesh_name in self.data.derived_mesh_names:
            nodes.append(derived_mesh_name)

        cmds.select(nodes, replace=True)

        cmds.select(mesh_name, add=True)
        cmds.blendShape(name=f"{mesh_name}{self.blend_shape_name_postfix}")
        cmds.delete(f"{self.blend_shape_group_prefix}{mesh_name}")

    def create_blend_shapes(
        self, add_mesh_name_to_blend_shape_channel_name: bool
    ) -> None:
        """
        Builds all the derived meshes using the provided mesh and the blend shapes data of the DNA.

        @type add_mesh_name_to_blend_shape_channel_name: bool
        @param add_mesh_name_to_blend_shape_channel_name: A flag representing whether mesh name of blend shape channel is added to name when creating it
        """

        logging.info("adding derived meshes...")

        group: str = cmds.group(
            empty=True,
            name=f"{self.blend_shape_group_prefix}{self.dna.get_mesh_name(self.mesh_index)}",
        )

        self.data.derived_mesh_names = []
        blend_shapes = self.dna.get_blend_shapes(self.mesh_index)
        for blend_shape_target_index, blend_shape in enumerate(blend_shapes):

            self.create_blend_shape(
                blend_shape_target_index,
                blend_shape.channel,
                group,
                add_mesh_name_to_blend_shape_channel_name,
            )
        cmds.setAttr(f"{group}.visibility", 0)

    def create_blend_shape(
        self,
        blend_shape_target_index: int,
        blend_shape_channel: int,
        group: str,
        add_mesh_name_to_blend_shape_channel_name: bool,
    ) -> None:
        """
        Builds a single derived mesh using the provided mesh and the blend shape data of the DNA.


        @type blend_shape_target_index: int
        @param blend_shape_target_index: Used for getting a delta value representing the value change concerning the blend shape.

        @type blend_shape_channel: int
        @param blend_shape_channel: Used for getting the blend shape name from the DNA.

        @type group: str
        @param group: The transform the new meshes will be added to.

        @type add_mesh_name_to_blend_shape_channel_name: bool
        @param add_mesh_name_to_blend_shape_channel_name: A flag representing whether mesh name of blend shape channel is added to name when creating it
        """

        new_vert_layout = self.get_vertex_positions_from_dna_vertex_positions()

        zipped_deltas = self.dna.get_blend_shape_target_deltas_with_vertex_id(
            self.mesh_index, blend_shape_target_index
        )
        for zipped_delta in zipped_deltas:
            delta: Point3 = zipped_delta[1]
            new_vert_layout[zipped_delta[0]] += MPoint(
                delta.x,
                delta.y,
                delta.z,
            )

        new_mesh = self.fn_mesh.create(
            new_vert_layout, self.data.polygon_faces, self.data.polygon_connects
        )
        derived_name = self.dna.get_blend_shape_channel_name(blend_shape_channel)
        name = (
            f"{self.dna.geometry_meshes[self.mesh_index].name}__{derived_name}"
            if add_mesh_name_to_blend_shape_channel_name
            else derived_name
        )
        self.dag_modifier.renameNode(new_mesh, name)
        self.dag_modifier.doIt()

        dag = MFnDagNode(Maya.get_element(group))
        dag.addChild(new_mesh)

        self.data.derived_mesh_names.append(name)

    def add_skin_cluster(self, joint_names: List[str], joint_ids: List[int]) -> None:
        """
        Adds skin cluster to the mesh

        @type joint_names: List[str]
        @param joint_names: Joint names needed for adding the skin cluster

        @type joint_ids: List[int]
        @param joint_ids: Joint indices needed for setting skin weights
        """

        mesh_name = self.dna.get_mesh_name(self.mesh_index)

        self._add_skin_cluster(mesh_name, joint_names)
        self.set_skin_weights(mesh_name, joint_ids)

    def _add_skin_cluster(self, mesh_name: str, joint_names: List[str]) -> None:
        """
        Creates a skin cluster object.

        @type mesh_name: str
        @param mesh_name: The mesh name that is used for skin cluster naming.

        @type joints: List[Joint]
        @param joints: List of joints used for adding the skin cluster.
        """

        logging.info("adding skin cluster...")
        maximum_influences = self.dna.get_maximum_influence_per_vertex(self.mesh_index)

        cmds.select(joint_names[0], replace=True)

        cmds.select(mesh_name, add=True)
        skin_cluster = cmds.skinCluster(
            toSelectedBones=True,
            name=f"{mesh_name}_{self.skin_cluster_suffix}",
            maximumInfluences=maximum_influences,
            skinMethod=0,
            obeyMaxInfluences=True,
        )
        cmds.skinCluster(
            skin_cluster, edit=True, addInfluence=joint_names[1:], weight=0
        )

    def set_skin_weights(self, mesh_name: str, joint_ids: List[int]) -> None:
        """
        Sets the skin weights attributes.

        @type mesh_name: str
        @param mesh_name: The mesh name that is used for getting the skin cluster name.

        @type joint_ids: List[int]
        @param joint_ids: List of joint indices used for setting the skin weight attribute.
        """

        logging.info("adding skin weights...")
        skin_weights = self.dna.get_skin_weight_matrix_for_mesh(self.mesh_index)

        # import skin weights
        temp_str = f"{mesh_name}_{self.skin_cluster_suffix}.wl["
        for vertex_id, skin_weight in enumerate(skin_weights):
            if not (vertex_id + 1) % SKIN_WEIGHT_PRINT_RANGE:
                logging.info(f"\t{vertex_id + 1} / {len(skin_weights)}")
            vertex_infos = skin_weight

            # set all skin weights to zero
            vertex_string = f"{temp_str}{str(vertex_id)}].w["
            cmds.setAttr(f"{vertex_string}0]", 0.0)

            # import skin weights
            for vertex_info in vertex_infos:
                cmds.setAttr(
                    f"{vertex_string}{str(joint_ids.index(vertex_info[0]))}]",
                    float(vertex_info[1]),
                )
        if len(skin_weights) % SKIN_WEIGHT_PRINT_RANGE != 0:
            logging.info(f"\t{len(skin_weights)} / {len(skin_weights)}")
