from typing import Any, Dict, List

from ..builder.scene import Scene, SceneResult
from ..config.aas import AdditionalAssemblyScript
from ..config.character import Character
from ..config.gui import Gui
from ..config.rig_logic import RigLogic
from ..config.units import AngleUnit, LinearUnit
from ..const.naming import BLEND_SHAPE_NAME_POSTFIX
from ..model.dna import DNA


def assemble_rig(
    dna: DNA,
    analog_gui_path: str,
    gui_path: str = None,
    gui: Gui = None,
    aas_path: str = None,
    aas_fn: str = "run_after_assemble",
    aas_params: Dict[str, Any] = None,
    with_attributes_on_root_joint: bool = False,
    with_key_frames: bool = False,
    add_mesh_name_to_blend_shape_channel_name: bool = True,
) -> SceneResult:
    """
    Used for assembling the rig with the following parameters

    @type dna: DNA
    @param dna: Instance of DNA

    @type gui_path: str
    @param gui_path: The file location of the gui

    @type gui: Gui
    @param gui: The gui configuration, this can be used instead of gui_path for finer control

    @type analog_gui_path: str
    @param analog_gui_path: The file location of the analog gui

    @type aas_path: str
    @param aas_path: The file location of the additional assembly script

    @type aas_fn: str
    @param aas_fn: The method name called from the additional assembly script (default is "run_after_assemble")

    @type aas_params: str
    @param aas_params: The parameters dictionary that will get passed to the provided method name called from the additional assembly script (default is None)

    @type with_attributes_on_root_joint: bool
    @param with_attributes_on_root_joint: A flag used for adding attributes on the root joint (default is False)

    @type with_key_frames: bool
    @param with_key_frames: A flag used for adding key frames (default is False)

    @type add_mesh_name_to_blend_shape_channel_name: bool
    @param add_mesh_name_to_blend_shape_channel_name: A flag representing whether mash name of blend shape channel is added to name when creating it

    @rtype: SceneResult
    @returns: A SceneResult object representing the info about the finished build process
    """

    meshes: List[int] = list(range(dna.get_mesh_count()))

    rig_logic = RigLogic()
    if add_mesh_name_to_blend_shape_channel_name:
        rig_logic.with_blend_shape_naming(
            f"<objName>{BLEND_SHAPE_NAME_POSTFIX}.<objName>__<attrName>"
        )

    character_config = (
        Character()
        .with_dna(dna)
        .with_character_node(False)
        .with_meshes(meshes)
        .with_analog_gui_path(analog_gui_path)
        .with_additional_assembly_script(
            AdditionalAssemblyScript(
                path=aas_path,
                method=aas_fn,
                parameter=aas_params if aas_params else {},
            )
        )
        .with_joints()
        .with_normals()
        .with_blend_shapes()
        .with_skin()
        .with_rig_logic(rig_logic)
        .with_add_meshes_to_display_layers(False)
    )

    if gui_path:
        character_config.with_gui_path(gui_path)

    if gui:
        character_config.with_gui(gui)

    if with_attributes_on_root_joint:
        character_config.with_ctrl_attributes_on_root_joint().with_animated_map_attributes_on_root_joint()

    if with_key_frames:
        character_config.with_key_frames()

    character_config.options.add_mesh_name_to_blend_shape_channel_name = (
        add_mesh_name_to_blend_shape_channel_name
    )

    scene_builder = Scene()
    scene_builder.config.with_character(character_config)
    scene_builder.config.with_linear_unit(unit=LinearUnit.cm).with_angle_unit(
        unit=AngleUnit.degree
    )
    return scene_builder.build()
