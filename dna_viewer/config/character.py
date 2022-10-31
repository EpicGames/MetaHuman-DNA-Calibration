import logging
from dataclasses import dataclass, field
from pathlib import Path
from typing import List, Optional

from ..config.aas import AdditionalAssemblyScript
from ..config.analog_gui import AnalogGui
from ..config.gui import Gui
from ..config.rig_logic import RigLogic
from ..model.dna import DNA


@dataclass
class SpaceModifiers:
    """
    A class used to represent the character config

    Attributes
    ----------
    @type linear_modifier: float
    @param linear_modifier: The linear modifier that needs to be applied to the character

    @type angle_modifier: float
    @param angle_modifier: The angle modifier that needs to be applied to the character
    """

    linear_modifier: float = field(default=None)
    angle_modifier: float = field(default=None)


@dataclass
class BuildOptions:
    """
    A class used to represent the build options we want to apply while building the character

    Attributes
    ----------
    @type add_joints: bool
    @param add_joints: A flag representing whether joints should be added

    @type add_normals: bool
    @param add_normals: A flag representing whether normals should be added

    @type add_blend_shapes: bool
    @param add_blend_shapes: A flag representing whether blend shapes should be added

    @type add_skin: bool
    @param add_skin: A flag representing whether skin should be added

    @type add_ctrl_attributes_on_root_joint: bool
    @param add_ctrl_attributes_on_root_joint: A flag representing whether control attributes should be added to the root joint

    @type add_animated_map_attributes_on_root_joint: bool
    @param add_animated_map_attributes_on_root_joint: A flag representing whether animated map attributes should be added to the root joint

    @type add_key_frames: bool
    @param add_key_frames: A flag representing whether key frames should be added

    @type add_mesh_name_to_blend_shape_channel_name: bool
    @param add_mesh_name_to_blend_shape_channel_name: A flag representing whether mash name of blend shape channel is added to name when creating it
    """

    add_joints: bool = field(default=False)
    add_normals: bool = field(default=False)
    add_blend_shapes: bool = field(default=False)
    add_skin: bool = field(default=False)
    add_ctrl_attributes_on_root_joint: bool = field(default=False)
    add_animated_map_attributes_on_root_joint: bool = field(default=False)
    add_key_frames: bool = field(default=False)
    add_mesh_name_to_blend_shape_channel_name: bool = field(default=False)


@dataclass
class Character:
    """
    A class used to represent the character config

    Attributes
    ----------
    @type dna: DNA
    @param dna: Instance of DNA object

    @type options: BuildOptions
    @param options: The configuration containing the build options

    @type modifiers: SpaceModifiers
    @param modifiers: The configuration containing space modifiers for the character

    @type meshes: List[int]
    @param meshes: The list of mesh ids that need to be processed

    @type rig_logic_config: RigLogic
    @param rig_logic_config: The rig logic configuration file containing naming patterns

    @type gui_options: Gui
    @param gui_options: The configuration containing the gui options

    @type analog_gui_options: AnalogGui
    @param analog_gui_options: The configuration containing the analog gui options

    @type create_character_node: bool
    @param create_character_node: A flag representing whether the character should be parented to a character transform node in the scene hierarchy

    @type create_display_layers: bool
    @param create_display_layers: A flag representing whether the created meshes should be assigned to a display layer

    @type aas: AdditionalAssemblyScript
    @param aas: The configuration containing the additional assembly script options

    """

    dna: DNA = field(default=None)
    options: BuildOptions = field(default_factory=BuildOptions)
    modifiers: SpaceModifiers = field(default_factory=SpaceModifiers)
    meshes: List[int] = field(default_factory=list)
    rig_logic_config: RigLogic = field(default=None)
    gui_options: Gui = field(default=None)
    analog_gui_options: AnalogGui = field(default=None)
    create_character_node: bool = field(default=True)
    create_display_layers: bool = field(default=True)
    aas: AdditionalAssemblyScript = field(default=None)

    def with_dna(self, dna: DNA) -> "Character":
        """
        Set the DNA file path

        @type dna: DNA
        @param dna: The location of the DNA file

        @rtype: Character
        @returns: The instance of the changed object
        """

        self.dna = dna
        return self

    def with_character_node(self, value: bool) -> "Character":
        """
        Set the flag that represents if the result character rig should be parented to a character transform

        @type value: bool
        @param value: The flag that represents if the result character rig should be parented to a character transform

        @rtype: Character
        @returns: The instance of the changed object
        """
        self.create_character_node = value
        return self

    def with_add_meshes_to_display_layers(self, value: bool) -> "Character":
        """
        Set the flag that represents if the created meshes should be put in their corresponding display layer

        @type value: bool
        @param value: The flag that represents if the created meshes should be put in their corresponding display layer

        @rtype: Character
        @returns: The instance of the changed object
        """
        self.create_display_layers = value
        return self

    def with_joints(self) -> "Character":
        """
        Set the flag that represents if joints should be created

        @rtype: Character
        @returns: The instance of the changed object
        """

        self.options.add_joints = True
        return self

    def with_gui_path(self, gui_path: str) -> "Character":
        """
        Set the gui path

        @type gui_path: str
        @param gui_path: The location of the gui file

        @rtype: Character
        @returns: The instance of the changed object
        """

        self.gui_options = Gui(gui_path=gui_path)
        return self

    def with_gui(self, gui: Gui) -> "Character":
        """
        Set the gui configuration

        @type gui: Gui
        @param gui: The gui configuration file

        @rtype: Character
        @returns: The instance of the changed object
        """

        self.gui_options = gui
        return self

    def with_analog_gui(self, analog_gui_config: AnalogGui) -> "Character":
        """
        Set the analog gui configuration

        @type analog_gui_config: AnalogGui
        @param analog_gui_config: The configuration containing the analog gui options

        @rtype: Character
        @returns: The instance of the changed object
        """

        self.analog_gui_options = analog_gui_config
        return self

    def with_analog_gui_path(
        self, analog_gui_path: Optional[str] = None
    ) -> "Character":
        """
        Set the analog gui path

        @type analog_gui_path: Optional[str]
        @param analog_gui_path: The configuration containing the analog gui options

        @rtype: Character
        @returns: The instance of the changed object
        """

        self.analog_gui_options = AnalogGui(gui_path=analog_gui_path)
        return self

    def with_blend_shapes(self) -> "Character":
        """
        Set the flag that represents if blend shapes should be created

        @rtype: Character
        @returns: The instance of the changed object
        """

        self.options.add_blend_shapes = True
        return self

    def with_skin(self) -> "Character":
        """
        Set the flag that represents if skin should be created

        @rtype: Character
        @returns: The instance of the changed object
        """

        self.options.add_skin = True
        return self

    def with_normals(self) -> "Character":
        """
        Set the flag that represents if normals should be created

        @rtype: Character
        @returns: The instance of the changed object
        """

        self.options.add_normals = True
        return self

    def with_meshes(self, meshes: List[int]) -> "Character":
        """
        Set the meshes that need to be processed

        @type meshes: List[int]
        @param meshes: The list of mesh ids that need to be processed

        @rtype: Character
        @returns: The instance of the changed object
        """

        self.meshes = meshes
        self.meshes.sort()
        return self

    def with_linear_modifier(self, modifier: float) -> "Character":
        """
        Set the linear modifier

        @type modifier: float
        @param modifier: The value of the linear modifier

        @rtype: Character
        @returns: The instance of the changed object
        """

        self.modifiers.linear_modifier = modifier
        return self

    def with_angle_modifier(self, modifier: float) -> "Character":
        """
        Set the angle modifier

        @type modifier: float
        @param modifier: The value of the angle modifier

        @rtype: Character
        @returns: The instance of the changed object
        """

        self.modifiers.angle_modifier = modifier
        return self

    def with_rig_logic(self, rig_logic_node_config: RigLogic = None) -> "Character":
        """
        Set the rig logic configuration

        @type rig_logic_node_config: RigLogic
        @param rig_logic_node_config: The rig logic configuration file containing naming patterns

        @rtype: Character
        @returns: The instance of the changed object
        """

        self.rig_logic_config = rig_logic_node_config or RigLogic()
        return self

    def with_additional_assembly_script(
        self, aas_config: AdditionalAssemblyScript
    ) -> "Character":
        """
        Set the additional assembly script configuration

        @type aas_config: AdditionalAssemblyScript
        @param aas_config: The configuration containing the additional assembly script options

        @rtype: Character
        @returns: The instance of the changed object
        """

        if aas_config.path is None:
            logging.error(
                "No AAS path provided, skipping additional assembly script execution"
            )
            return self

        if aas_config.module_name is None:
            aas_config.module_name = Path(aas_config.path).stem

        self.aas = aas_config
        return self

    def with_ctrl_attributes_on_root_joint(self) -> "Character":
        """
        Set the flag that represents if control attributes should be added on the root joint

        @rtype: Character
        @returns: The instance of the changed object
        """

        self.options.add_ctrl_attributes_on_root_joint = True
        return self

    def with_animated_map_attributes_on_root_joint(self) -> "Character":
        """
        Set the flag that represents if animated map attributes should be added on the root joint

        @rtype: Character
        @returns: The instance of the changed object
        """

        self.options.add_animated_map_attributes_on_root_joint = True
        return self

    def with_key_frames(self) -> "Character":
        """
        Set the flag that represents if key frames should be added

        @rtype: Character
        @returns: The instance of the changed object
        """

        self.options.add_key_frames = True
        return self
