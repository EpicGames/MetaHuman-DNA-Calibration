import logging
from typing import List, Tuple, Union

from maya import cmds, mel
from maya.api.OpenMaya import MFnMesh, MGlobal
from maya.api.OpenMayaAnim import MFnSkinCluster

from ..util.error import DNAViewerError
from ..util.maya_util import Maya


class MayaSkinWeights:
    """
    A class used for reading and storing skin weight related data needed for adding skin clusters
    """

    no_of_influences: int
    skinning_method: int
    joints: List[str]
    vertices_info: List[List[Union[int, float]]]

    @staticmethod
    def create(skin_cluster: MFnSkinCluster, mesh_name: str) -> "MayaSkinWeights":
        """
        Creates a new instance of the class object.

        @type skin_cluster: MFnSkinCluster
        @param skin_cluster: Functionalities of maya skin clusters

        @type mesh_name: str
        @param mesh_name: The name of the mesh
        """

        skin_weights = MayaSkinWeights()

        skin_weights.no_of_influences = cmds.skinCluster(
            skin_cluster.name(), q=True, mi=True
        )

        skin_weights.skinning_method = cmds.skinCluster(
            skin_cluster.name(), q=True, sm=True
        )

        skin_weights.joints = MayaSkinWeights.get_skin_cluster_influence(skin_cluster)

        skin_weights.vertices_info = MayaSkinWeights.get_skin_weights_for_mesh_name(
            skin_cluster, mesh_name
        )

        return skin_weights

    @staticmethod
    def get_skin_cluster_influence(
        skin_cluster: MFnSkinCluster,
    ) -> List[str]:
        """
        Gets a list of joint names that are influences to the skin cluster.

        @type skin_cluster: MFnSkinCluster
        @param skin_cluster: The functionalities of a maya skin cluster object

        @rtype: List[str]
        @returns: The list if names of the joints that influence the skin cluster
        """

        influences: List[str] = cmds.skinCluster(skin_cluster.name(), q=True, inf=True)
        if influences and not isinstance(influences[0], str):
            influences = [obj.name() for obj in influences]
        return influences

    @staticmethod
    def get_skin_weights_for_mesh_name(
        skin_cluster: MFnSkinCluster,
        mesh_name: str,
    ) -> List[List[Union[int, float]]]:
        """
        Gets the skin weights concerning the given mesh.

        @type skin_cluster: MFnSkinCluster
        @param skin_cluster: The functionalities of a maya skin cluster object

        @type mesh_name: str
        @param mesh_name: The name of the mesh

        @rtype: List[List[Union[int, float]]]
        @returns: A list of list of weight indices and the weight values
        """

        mesh = Maya.get_element(mesh_name)
        components = MGlobal.getSelectionListByName(f"{mesh_name}.vtx[*]").getComponent(
            0
        )[1]
        weights_data, chunk = skin_cluster.getWeights(mesh, components)
        iterator = [
            weights_data[i : i + chunk] for i in range(0, len(weights_data), chunk)
        ]

        vertices_info = []
        for weights in iterator:
            vertex_weights: List[float] = []
            vertices_info.append(vertex_weights)

            for i, weight in enumerate(weights):
                if weight:
                    vertex_weights.append(i)
                    vertex_weights.append(weight)
        return vertices_info


class SkinWeightsMaya:
    """
    A class used for setting and interacting with skin weights in maya.
    """

    def get_skin_weights_data(self, mesh_name: str) -> Tuple[MFnMesh, MFnSkinCluster]:
        """
        Gets the maya objects that manipulate the mesh node and the skin cluster for a given mesh name.

        @type mesh_name: str
        @param mesh_name: The name of the mesh

        @rtype: Tuple[MFnMesh, MFnSkinCluster]
        @returns: The maya object that manipulate the mesh node and the skin cluster for a given mesh name.
        """

        skin_cluster = None
        skin_cluster_name = mel.eval(f"findRelatedSkinCluster {mesh_name}")
        if skin_cluster_name:
            skin_cluster = MFnSkinCluster(Maya.get_element(skin_cluster_name))
            mesh_node = MFnMesh(Maya.get_element(mesh_name))
        if not skin_cluster:
            raise DNAViewerError(f"Unable to find skin for given mesh: {mesh_name}")
        return mesh_node, skin_cluster

    def get_skin_weights_from_scene(self, mesh_name: str) -> MayaSkinWeights:
        """
        Gets the instance of this class filled with data from the scene for a given mesh name.

        @type mesh_name: str
        @param mesh_name: The mesh name

        @rtype: MayaSkinWeights
        @returns: An instance of this class with the data from the scene
        """

        _, skin_cluster = self.get_skin_weights_data(mesh_name)

        skin_weights = MayaSkinWeights.create(skin_cluster, mesh_name)

        return skin_weights

    def get_file_joint_mappings(
        self, skin_weights: MayaSkinWeights, skin_cluster: MFnSkinCluster
    ) -> List[int]:
        """
        Returns a list of object indices representing the influences concerning the joint names specified in the skin weight model.

        @type skin_weights: MayaSkinWeights
        @param skin_weights: The instance of the model storing data about skin weights

        @type skin_cluster: MFnSkinCluster
        @param skin_cluster: An object for working with functions concerning a skin cluster in maya

        @rtype: List[int]
        @returns: a list of indices representing the influences concerning the given joints
        """

        file_joint_mapping: List[int] = []
        for joint_name in skin_weights.joints:
            file_joint_mapping.append(
                skin_cluster.indexForInfluenceObject(Maya.get_element(joint_name))
            )
        return file_joint_mapping

    def set_skin_weights_to_scene(
        self, mesh_name: str, skin_weights: MayaSkinWeights
    ) -> None:
        """
        Sets the skin weights to the scene.

        @type mesh_name: str
        @param mesh_name: The mesh name

        @type skin_weights: MayaSkinWeights
        @param skin_weights: The object containing data that need to be set to the scene.
        """

        mesh_node, skin_cluster = self.get_skin_weights_data(mesh_name)

        file_joint_mapping = self.get_file_joint_mappings(skin_weights, skin_cluster)

        self.import_skin_weights(
            skin_cluster, mesh_node, skin_weights, file_joint_mapping
        )

        logging.info("Set skin weights ended.")

    def import_skin_weights(
        self,
        skin_cluster: MFnSkinCluster,
        mesh_node: MFnMesh,
        skin_weights: MayaSkinWeights,
        file_joint_mapping: List[int],
    ) -> None:
        """
        Imports the skin weights to the scene using the joint mapping and the data provided in the model containing the weights.

        @type skin_cluster: MFnSkinCluster
        @param skin_cluster: An object for working with functions concerning a skin cluster in maya

        @type mesh_node: MFnMesh
        @param mesh_node: An object for working with functions concerning meshes in maya

        @type skin_weights: MayaSkinWeights
        @param skin_weights: The instance of the model storing data about skin weights

        @type file_joint_mapping: List[int]
        @param file_joint_mapping: a list of indices representing the influences concerning joints
        """

        temp_str = f"{skin_cluster.name()}.wl["
        for vtx_id in range(cmds.polyEvaluate(mesh_node.name(), vertex=True)):
            vtx_info = skin_weights.vertices_info[vtx_id]

            vtx_str = f"{temp_str}{str(vtx_id)}].w["

            cmds.setAttr(f"{vtx_str}0]", 0.0)

            for i in range(0, len(vtx_info), 2):
                cmds.setAttr(
                    f"{vtx_str}{str(file_joint_mapping[int(vtx_info[i])])}]",
                    vtx_info[i + 1],
                )
