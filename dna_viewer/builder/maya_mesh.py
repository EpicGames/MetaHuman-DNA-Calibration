from typing import List

from maya.api.OpenMaya import MDagModifier, MFnMesh, MObject

from ..config.mesh import Mesh as MeshConfig
from ..model.dna import DNA
from ..model.mesh import Mesh as MeshModel
from ..util.mesh_blend_shape import MeshBlendShape
from ..util.mesh_neutral import MeshNeutral
from ..util.mesh_normals import MeshNormals
from ..util.mesh_skin import MeshSkin


class MayaMesh:
    """
    A builder class used for adding joints to the scene

    Attributes
    ----------
    @type config: MeshConfig
    @param config: The mesh configuration options used for creating meshes

    @type data: MeshModel
    @param data: mesh data used in the mesh creation process

    @type fn_mesh: om.MFnMesh
    @param fn_mesh: OpenMaya class used for creating the mesh

    @type mesh_object: om.MObject
    @param mesh_object: the object representing the mesh

    @type dag_modifier: om.MDagModifier
    @param dag_modifier: OpenMaya class used for naming the mesh
    """

    def __init__(self, config: MeshConfig, dna: DNA) -> None:
        self.config = config
        self.data: MeshModel = MeshModel()
        self.fn_mesh: MFnMesh = None
        self.mesh_object: MObject = None
        self.dag_modifier: MDagModifier = None
        self.dna = dna

    def create_neutral_mesh(self) -> MObject:
        """
        Creates the neutral mesh using the config provided for this builder class object

        @rtype: om.MObject
        @returns: the instance of the created mesh object
        """
        MeshNeutral.prepare_mesh(self.config, self.dna, self.data)
        self.fn_mesh, self.mesh_object = MeshNeutral.create_mesh_object(
            self.config, self.data
        )
        self.dag_modifier = MeshNeutral.rename_mesh(
            self.config, self.dna, self.mesh_object
        )
        MeshNeutral.add_texture_coordinates(
            self.config, self.dna, self.data, self.fn_mesh
        )
        return self.mesh_object

    def add_blend_shapes(self, add_mesh_name_to_blend_shape_channel_name: bool) -> None:
        """Adds blend shapes to the mesh"""

        if self.dna.has_blend_shapes(self.config.mesh_index):
            MeshBlendShape.create_all_derived_meshes(
                self.config,
                self.dna,
                self.data,
                self.fn_mesh,
                self.dag_modifier,
                add_mesh_name_to_blend_shape_channel_name,
            )
            MeshBlendShape.create_blend_shape_node(
                self.dna.get_mesh_name(self.config.mesh_index),
                self.data.derived_mesh_names,
            )

    def add_skin(self, joint_names: List[str], joint_ids: List[int]) -> None:
        """
        Adds skin to the mesh

        @type joint_names: List[str]
        @param joint_names: Joint names needed for adding the skin cluster

        @type joint_ids: List[int]
        @param joint_ids: Joint indices needed for setting skin weights
        """

        mesh_name = self.dna.get_mesh_name(self.config.mesh_index)

        MeshSkin.add_skin_cluster(
            self.dna, self.config.mesh_index, mesh_name, joint_names
        )
        MeshSkin.set_skin_weights(
            self.dna, self.config.mesh_index, mesh_name, joint_ids
        )

    def add_normals(self) -> None:
        """Add normals to the mesh"""

        MeshNormals.add_normals(self.config, self.dna, self.data, self.fn_mesh)
