import logging
from typing import List, Tuple

from maya import cmds

from ..const.naming import SKIN_CLUSTER_AFFIX
from ..const.printing import SKIN_WEIGHT_PRINT_RANGE
from ..model.dna import DNA


class MeshSkin:
    """
    A utility class used for interacting and adding skin clusters to a mesh
    """

    @staticmethod
    def prepare_joints(dna: DNA, mesh_index: int) -> Tuple[List[int], List[str]]:
        """
        Gets the joint indices and names needed for the given mesh.

        @type dna: DNA
        @param dna: Instance of DNA.

        @type mesh_index: int
        @param mesh_index: The index of the mesh.

        @type joints: List[Joint]
        @param joints: List of all joints from which some of them are selected as a result.

        @rtype: Tuple[List[int], List[str]]
        @returns: The tuple containing the list of joint indices and the list of joint names.
        """

        joints = dna.read_all_neutral_joints()
        joints_temp: List[int] = []
        joint_indices = dna.get_all_skin_weights_joint_indices_for_mesh(mesh_index)

        joint_ids = []
        if any(joint_indices):
            for row in joint_indices:
                for column in row:
                    joints_temp.append(column)

            joint_ids = list(set(joints_temp))
            joint_ids.sort()
        else:
            lod = dna.get_lowest_lod_containing_meshes([mesh_index])
            if lod:
                joint_ids = dna.get_joint_indices_for_lod(lod)

        joint_names = []
        for joint_id in joint_ids:
            joint_names.append(joints[joint_id].name)
        return joint_ids, joint_names

    @staticmethod
    def add_skin_cluster(
        dna: DNA, mesh_index: int, mesh_name: str, joint_names: List[str]
    ) -> None:
        """
        Creates a skin cluster object.

        @type dna: DNA
        @param dna: Instance of DNA.

        @type mesh_index: int
        @param mesh_index: The index of the mesh.

        @type mesh_name: str
        @param mesh_name: The mesh name that is used for skin cluster naming.

        @type joints: List[Joint]
        @param joints: List of joints used for adding the skin cluster.
        """

        logging.info("adding skin cluster...")
        maximum_influences = dna.get_maximum_influence_per_vertex(mesh_index)

        cmds.select(joint_names[0], replace=True)

        cmds.select(mesh_name, add=True)
        skin_cluster = cmds.skinCluster(
            toSelectedBones=True,
            name=f"{mesh_name}_{SKIN_CLUSTER_AFFIX}",
            maximumInfluences=maximum_influences,
            skinMethod=0,
            obeyMaxInfluences=True,
        )
        if joint_names:
            cmds.skinCluster(
                skin_cluster, edit=True, addInfluence=joint_names[1:], weight=0
            )

    @staticmethod
    def set_skin_weights(
        dna: DNA, mesh_index: int, mesh_name: str, joint_ids: List[int]
    ) -> None:
        """
        Sets the skin weights attributes.

        @type dna: DNA
        @param dna: Instance of DNA.

        @type mesh_index: int
        @param mesh_index: The index of the mesh.

        @type mesh_name: str
        @param mesh_name: The mesh name that is used for getting the skin cluster name.

        @type joint_ids: List[int]
        @param joint_ids: List of joint indices used for setting the skin weight attribute.
        """

        logging.info("setting skin weights...")
        skin_weights = dna.get_skin_weight_matrix_for_mesh(mesh_index)

        # import skin weights
        temp_str = f"{mesh_name}_{SKIN_CLUSTER_AFFIX}.wl["
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
