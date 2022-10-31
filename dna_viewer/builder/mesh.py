import logging
from typing import List

from ..builder.maya_mesh import MayaMesh as MayaMeshBuilder
from ..config.character import BuildOptions, Character, SpaceModifiers
from ..config.mesh import Mesh as MeshConfig
from ..model.dna import DNA
from ..util.mesh_skin import MeshSkin
from ..util.reference import get_geometry_reader


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

    @type options: BuildOptions
    @param options: The build options that will be applied when creating the mesh

    @type modifiers: SpaceModifiers
    @param modifiers: Space modifiers that should be applied when creating the mesh

    @type config: Character
    @param config: The character configuration options used for getting information about the DNA path, build options and space modifiers

    @type mesh: MayaMeshBuilder
    @param mesh: The builder class object for creating the meshes

    @type dna: DNA
    @param dna: The DNA object that was loaded in
    """

    def __init__(
        self,
        character_config: Character,
        dna: DNA,
        mesh_index: int,
    ) -> None:
        self.mesh_index: int = mesh_index
        self.joint_ids: List[int] = []
        self.joint_names: List[str] = []

        self.options: BuildOptions = character_config.options
        self.modifiers: SpaceModifiers = character_config.modifiers
        self.config = MeshConfig(
            mesh_index=self.mesh_index,
            linear_modifier=self.modifiers.linear_modifier,
        )
        self.dna = dna
        self.mesh = MayaMeshBuilder(self.config, self.dna)

    def build(self) -> None:
        """Starts the build process, creates the neutral mesh, then adds normals, blends shapes and skin if needed"""

        self.create_neutral_mesh()
        self.add_normals()
        self.add_blend_shapes()
        self.add_skin()

    def create_neutral_mesh(self) -> None:
        """Creates the neutral mesh"""

        self.mesh.create_neutral_mesh()

    def add_normals(self) -> None:
        """Adds normals to the mesh if it is set in the build options"""

        if self.options.add_normals:
            logging.info("adding normals...")
            self.mesh.add_normals()

    def add_blend_shapes(self) -> None:
        """Reads in the blend shapes, then adds them to the mesh if it is set in the build options"""

        if self.options.add_blend_shapes:
            logging.info("reading blend shapes...")
            geometry_reader = get_geometry_reader(self.mesh_index, self.dna.path)
            geometry_reader.read_blend_shapes(
                self.dna.get_mesh_data(self.mesh_index), self.mesh_index
            )
            logging.info("adding blend shapes...")
            self.mesh.add_blend_shapes(
                self.options.add_mesh_name_to_blend_shape_channel_name
            )

    def add_skin(self) -> None:
        """Adds skin to the mesh if it is set in the build options"""

        if self.options.add_skin and self.options.add_joints:
            self.joint_ids, self.joint_names = MeshSkin.prepare_joints(
                self.dna,
                self.mesh_index,
            )
            self.mesh.add_skin(self.joint_names, self.joint_ids)
