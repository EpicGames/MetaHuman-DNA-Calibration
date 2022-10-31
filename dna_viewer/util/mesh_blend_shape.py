import logging
from typing import List

from maya import cmds
from maya.api.OpenMaya import MDagModifier, MFnDagNode, MFnMesh, MPoint

from ..config.mesh import Mesh
from ..const.naming import (
    BLEND_SHAPE_GROUP_PREFIX,
    BLEND_SHAPE_NAME_POSTFIX,
    BLEND_SHAPE_NAMING,
    DERIVED_MESH_NAME,
    MESH_NAME,
)
from ..const.printing import BLEND_SHAPE_PRINT_RANGE
from ..model.dna import DNA
from ..model.geometry import Point3
from ..model.mesh import Mesh as MayaMeshModel
from ..util.maya_util import Maya
from ..util.mesh_neutral import MeshNeutral


class MeshBlendShape:
    """
    A utility class used for interacting with blend shapes
    """

    @staticmethod
    def create_all_derived_meshes(
        config: Mesh,
        dna: DNA,
        data: MayaMeshModel,
        fn_mesh: MFnMesh,
        dag_modifier: MDagModifier,
        add_mesh_name_to_blend_shape_channel_name: bool,
    ) -> None:
        """
        Builds all the derived meshes using the provided mesh and the blend shapes data of the DNA.

        @type config: Mesh
        @param config: Mesh configuration from the DNA.

        @type data: MayaMeshModel
        @param data: An object that stores values that get passed around different methods.

        @type fn_mesh: MFnMesh
        @param fn_mesh: Used for creating and manipulating maya mesh objects.

        @type dag_modifier: MDagModifier
        @param dag_modifier: Used for manipulating maya objects.

        @type add_mesh_name_to_blend_shape_channel_name: bool
        @param add_mesh_name_to_blend_shape_channel_name: A flag representing whether mash name of blend shape channel is added to name when creating it
        """

        logging.info("building derived meshes...")

        group: str = cmds.group(
            empty=True,
            name=f"{BLEND_SHAPE_GROUP_PREFIX}{dna.get_mesh_name(config.mesh_index)}",
        )

        data.derived_mesh_names = []
        blend_shapes = dna.get_blend_shapes(config.mesh_index)
        for blend_shape_target_index, blend_shape in enumerate(blend_shapes):
            if (blend_shape_target_index + 1) % BLEND_SHAPE_PRINT_RANGE == 0:
                logging.info(f"\t{blend_shape_target_index + 1} / {len(blend_shapes)}")

            MeshBlendShape._create_derived_mesh(
                config,
                dna,
                data,
                blend_shape_target_index,
                blend_shape.channel,
                group,
                fn_mesh,
                dag_modifier,
                add_mesh_name_to_blend_shape_channel_name,
            )

        if len(blend_shapes) % BLEND_SHAPE_PRINT_RANGE != 0:
            logging.info(f"\t{len(blend_shapes)} / {len(blend_shapes)}")

        cmds.setAttr(f"{group}.visibility", 0)

    @staticmethod
    def _create_derived_mesh(
        config: Mesh,
        dna: DNA,
        data: MayaMeshModel,
        blend_shape_target_index: int,
        blend_shape_channel: int,
        group: str,
        fn_mesh: MFnMesh,
        dag_modifier: MDagModifier,
        add_mesh_name_to_blend_shape_channel_name: bool,
    ) -> None:
        """
        Builds a single derived mesh using the provided mesh and the blend shape data of the DNA.

        @type config: Mesh
        @param config: Mesh configuration from the DNA.

        @type data: MayaMeshModel
        @param data: An object that stores values that get passed around different methods.

        @type blend_shape_target_index: int
        @param blend_shape_target_index: Used for getting a delta value representing the value change concerning the blend shape.

        @type blend_shape_channel: int
        @param blend_shape_channel: Used for getting the blend shape name from the DNA.

        @type group: str
        @param group: The transform the new meshes will be added to.

        @type fn_mesh: MFnMesh
        @param fn_mesh: Used for creating and manipulating maya mesh objects.

        @type dag_modifier: MDagModifier
        @param dag_modifier: Used for manipulating maya objects.

        @type add_mesh_name_to_blend_shape_channel_name: bool
        @param add_mesh_name_to_blend_shape_channel_name: A flag representing whether mash name of blend shape channel is added to name when creating it
        """

        new_vert_layout = MeshNeutral.get_vertex_positions_from_dna_vertex_positions(
            config=config, data=data
        )

        zipped_deltas = dna.get_blend_shape_target_deltas_with_vertex_id(
            config.mesh_index, blend_shape_target_index
        )
        for zipped_delta in zipped_deltas:
            delta: Point3 = zipped_delta[1]
            new_vert_layout[zipped_delta[0]] += MPoint(
                config.linear_modifier * delta.x,
                config.linear_modifier * delta.y,
                config.linear_modifier * delta.z,
            )

        new_mesh = fn_mesh.create(
            new_vert_layout, data.polygon_faces, data.polygon_connects
        )
        derived_name = dna.get_blend_shape_name(blend_shape_channel)
        name = (
            f"{dna.geometry.meshes[config.mesh_index].name}__{derived_name}"
            if add_mesh_name_to_blend_shape_channel_name
            else derived_name
        )
        dag_modifier.renameNode(new_mesh, name)
        dag_modifier.doIt()

        dag = MFnDagNode(Maya.get_element(group))
        dag.addChild(new_mesh)

        data.derived_mesh_names.append(name)

    @staticmethod
    def create_blend_shape_node(
        mesh_name: str, derived_mesh_names: List[str], rename: bool = False
    ) -> None:
        """
        Creates a blend shape node.

        @type mesh_name: str
        @param mesh_name: The name of the mesh.

        @type derived_mesh_names: List[str]
        @param derived_mesh_names: List of the names that will end up as blend shapes added to the mesh.

        @type rename: bool
        @param rename: A flag representing if the name should be changed to a blend shape naming convention.
        """

        nodes = []
        for derived_mesh_name in derived_mesh_names:
            if rename:
                name = BLEND_SHAPE_NAMING.replace(MESH_NAME, mesh_name).replace(
                    DERIVED_MESH_NAME, derived_mesh_name
                )
            else:
                name = derived_mesh_name

            nodes.append(name)

        cmds.select(nodes, replace=True)

        cmds.select(mesh_name, add=True)
        cmds.blendShape(name=f"{mesh_name}{BLEND_SHAPE_NAME_POSTFIX}")
        cmds.delete(f"{BLEND_SHAPE_GROUP_PREFIX}{mesh_name}")
