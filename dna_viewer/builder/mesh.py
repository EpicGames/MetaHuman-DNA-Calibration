import logging
from typing import List

from ..builder.maya.mesh import MayaMesh
from ..dnalib.dnalib import DNA
from .config import Config


class Mesh:
    """
    A builder class used for adding joints to the scene

    Attributes
    ----------
    @type dna: DNA
    @param dna: The location of the DNA file

    @type mesh_index: int
    @param mesh_index: The mesh index we are working with

    @type joint_ids: List[int]
    @param joint_ids: The joint indices used for adding skin

    @type joint_names: List[str]
    @param joint_names: The joint names used for adding skin

    @type config: Config
    @param config: The build options that will be applied when creating the mesh


    @type mesh: MayaMesh
    @param mesh: The builder class object for creating the meshes

    @type dna: DNA
    @param dna: The DNA object that was loaded in
    """

    def __init__(
        self,
        config: Config,
        dna: DNA,
        mesh_index: int,
    ) -> None:
        self.mesh_index: int = mesh_index
        self.joint_ids: List[int] = []
        self.joint_names: List[str] = []
        self.config = config
        self.dna = dna
        self.mesh = MayaMesh(
            self.mesh_index,
            self.dna,
            blend_shape_group_prefix=self.config.blend_shape_group_prefix,
            blend_shape_name_postfix=self.config.blend_shape_name_postfix,
            skin_cluster_suffix=self.config.skin_cluster_suffix,
        )

    def build(self) -> None:
        """Starts the build process, creates the neutral mesh, then adds normals, blends shapes and skin if needed"""

        self.create_neutral_mesh()
        self.add_blend_shapes()
        self.add_skin_cluster()

    def create_neutral_mesh(self) -> None:
        """Creates the neutral mesh"""

        self.mesh.create_neutral_mesh()

    def add_blend_shapes(self) -> None:
        """Reads in the blend shapes, then adds them to the mesh if it is set in the build options"""

        if self.config.add_blend_shapes:
            logging.info("adding blend shapes...")
            self.mesh.add_blend_shapes(
                self.config.add_mesh_name_to_blend_shape_channel_name
            )

    def add_skin_cluster(self) -> None:
        """Adds skin cluster to the mesh if it is set in the build options"""

        if self.config.add_skin_cluster and self.config.add_joints:
            self.prepare_joints()
            if self.joint_names:
                self.mesh.add_skin_cluster(self.joint_names, self.joint_ids)

    def prepare_joints(self) -> None:
        """
        Gets the joint indices and names needed for the given mesh.
        """

        self.prepare_joint_ids()

        joints = self.dna.read_all_neutral_joints()
        self.joint_names = []
        for joint_id in self.joint_ids:
            self.joint_names.append(joints[joint_id].name)

    def prepare_joint_ids(self) -> None:
        joints_temp: List[int] = []
        joint_indices = self.dna.get_all_skin_weights_joint_indices_for_mesh(
            self.mesh_index
        )
        self.joint_ids = []
        if any(joint_indices):
            for row in joint_indices:
                for column in row:
                    joints_temp.append(column)

            self.joint_ids = list(set(joints_temp))
            self.joint_ids.sort()
        else:
            lod = self.dna.get_lowest_lod_containing_meshes([self.mesh_index])
            if lod:
                self.joint_ids = self.dna.get_joint_indices_for_lod(lod)
