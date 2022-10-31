import logging
from typing import Dict, List

from maya import cmds
from maya.api.OpenMaya import MObject

from ..builder.analog_gui import AnalogGui
from ..builder.gui import Gui
from ..builder.joint import Joint as JointBuilder
from ..builder.mesh import Mesh
from ..config.character import Character
from ..const.naming import (
    ANALOG_GUI_HOLDER,
    FACIAL_ROOT_JOINT,
    FRM_MULTIPLIERS_NAME,
    GEOMETRY_HOLDER_PREFIX,
    GUI_HOLDER,
    LOD_HOLDER_PREFIX,
    LOD_HOLDER_PREFIX_UPPER,
    RIG_HOLDER_PREFIX,
)
from ..model.dna import DNA
from ..model.joint import Joint as JointModel
from ..util.additional_assembly_script import AdditionalAssemblyScript
from ..util.maya_util import Maya
from ..util.rig_logic import RigLogic
from ..util.shader import Shader as ShaderUtil


class CharacterCreator:
    """
    A class used for creating the character in the maya scene

    Attributes
    ----------
    @type config: Character
    @param config: The character configuration containing build options

    @type dna: DNA
    @param dna: The DNA object read from the DNA file

    @type character_name: str
    @param character_name: The name of the character

    @type meshes: Dict[int, List[MObject]]
    @param meshes: A mapping of lod number to a list of meshes created for that lod
    """

    def __init__(self, config: Character, dna: DNA) -> None:
        self.config = config
        self.dna = dna
        self.character_name = self.dna.get_character_name()
        self.meshes: Dict[int, List[MObject]] = {}

    def add_mesh_to_display_layer(self, mesh_name: str, lod: int) -> None:
        """
        Add the mesh with the given name to an already created display layer.

        @type mesh_name: str
        @param mesh_name: The name of the mesh that should be added to a display layer.

        @type lod: int
        @param lod: The lod value, this is needed for determining the name of the display layer that the mesh should be added to.
        """

        cmds.editDisplayLayerMembers(f"{LOD_HOLDER_PREFIX_UPPER}{lod}", mesh_name)

    def add_joints(self) -> List[JointModel]:
        """
        Reads and adds the joints to the scene, also returns a list model objects of joints that were added.

        @rtype: List[JointModel]
        @returns: The list containing model objects representing the joints that were added to the scene.
        """

        joints: List[JointModel] = self.dna.read_all_neutral_joints()
        builder = JointBuilder(
            joints,
            self.config.modifiers.linear_modifier,
            self.config.modifiers.angle_modifier,
        )
        builder.process()
        return joints

    def add_joints_to_character(self) -> None:
        """
        Starts adding the joints the character, if the character configuration options have add_joints set to False,
        this step will be skipped.
        """

        if self.config.options.add_joints:
            logging.info("adding joints to character...")
            joints = self.add_joints()

            if self.config.create_character_node:
                cmds.parent(joints[0].name, self.character_name)

    def create_character_node(self) -> None:
        """
        Creates a Maya transform which will hold the character, if the character configuration options have
        create_character_node set to False, this step will be skipped.
        """

        if self.config.create_character_node:
            logging.info("building character node...")
            if not cmds.objExists(self.character_name):
                cmds.createNode("transform", n=self.character_name)

    def create_geometry_node(self) -> None:
        """
        Creates a Maya transform which will hold the geometry of the character. If the character configuration
        options have create_character_node set to False, this step will be skipped.
        """

        if self.config.create_character_node:
            logging.info("adding geometry node")
            name = f"{GEOMETRY_HOLDER_PREFIX}{self.character_name}"
            if not cmds.objExists(name):
                cmds.createNode("transform", n=name)
                cmds.parent(name, self.character_name)

    def create_rig_node(self) -> None:
        """
        Creates a Maya transform which will hold the rig of the character. If the character configuration options
        have create_character_node set to False, this step will be skipped.
        """

        if self.config.create_character_node:
            logging.info("adding rig node")
            char_name = f"{RIG_HOLDER_PREFIX}{self.character_name}"
            if not cmds.objExists(char_name):
                cmds.createNode("transform", n=char_name)
                cmds.parent(char_name, self.character_name)

    def create_lod_node(self, lod: int, obj_name: str) -> None:
        """
        Creates a Maya transform which will hold the meshes of the character for a given lod.

        @type lod: str
        @param lod: The lod number.

        @type obj_name: str @param obj_name: The full path name of the object in the scene, if it is not found a new
        lod holder will be created.
        """

        if not cmds.objExists(obj_name):
            parent_name = f"{GEOMETRY_HOLDER_PREFIX}{self.character_name}"
            name = f"{LOD_HOLDER_PREFIX}{lod}"
            cmds.createNode("transform", n=name, p=parent_name)

    def attach_mesh_to_lod(self, mesh_name: str, lod: int) -> None:
        """
        Attaches the mesh called mesh_name to a given lod.

        @type mesh_name: str
        @param mesh_name: The mesh that needs to be attached to a lod holder object.

        @type lod: str
        @param lod: The name of the mesh that should be added to a display layer.
        """

        parent_node = (
            f"{GEOMETRY_HOLDER_PREFIX}{self.character_name}|{LOD_HOLDER_PREFIX}{lod}"
        )
        cmds.parent(
            self.get_mesh_node_fullpath_on_root(mesh_name=mesh_name), parent_node
        )

    def get_mesh_node_fullpath_on_root(self, mesh_name: str) -> str:
        """
        Gets the full path in the scene of a mesh.

        @type mesh_name: str
        @param mesh_name: The mesh thats path is needed.

        @rtype: str
        @returns: The full path of the mesh object in the scene
        """

        return str(Maya.get_element(f"|{mesh_name}").fullPathName())

    def create_ctrl_attributes(self) -> None:
        """
        Creates and sets the raw gui control attributes.
        """

        gui_control_names = self.dna.get_raw_control_names()

        for name in gui_control_names:
            ctrl_and_attr_names = name.split(".")
            cmds.addAttr(
                ctrl_and_attr_names[0],
                longName=ctrl_and_attr_names[1],
                keyable=True,
                attributeType="float",
                minValue=0.0,
                maxValue=1.0,
            )

    def create_frm_attributes(self) -> None:
        """
        Creates and sets the animated map attributes.
        """

        frm_names = self.dna.get_animated_map_names()
        for name in frm_names:
            cmds.addAttr(
                FRM_MULTIPLIERS_NAME,
                longName=name.replace(".", "_"),
                keyable=True,
                attributeType="float",
                minValue=0.0,
                maxValue=1.0,
            )

    def create_ctrl_attributes_on_joint(self) -> None:
        """
        Creates control attributes on the root joint from the raw control names.
        """

        if (
            self.config.options.add_ctrl_attributes_on_root_joint
            and self.config.options.add_joints
        ):
            logging.info("adding ctrl attributes on root joint...")
            names = self.dna.get_raw_control_names()
            self.create_attribute_on_joint(names=names)

    def create_animated_map_attributes(self) -> None:
        """
        Creates animated map attributes on the root joint from the animated map names.
        """

        if (
            self.config.options.add_animated_map_attributes_on_root_joint
            and self.config.options.add_joints
        ):
            logging.info("adding animated map attributes on root joint...")
            names = self.dna.get_animated_map_names()
            self.create_attribute_on_joint(names=names)

    def create_attribute_on_joint(self, names: List[str]) -> None:
        """
        Create attributes from a provided list of names on the facial root joint.

        @type names: List[str]
        @param names: List of names that are added as attributes to the facial root joint.
        """

        for name in names:
            cmds.addAttr(
                FACIAL_ROOT_JOINT,
                longName=name.replace(".", "_"),
                keyable=True,
                attributeType="float",
                minValue=0.0,
                maxValue=1.0,
            )

    def add_key_frames(self) -> None:
        """
        Adds a starting key frame to the facial root joint if joints are added and the add_key_frames option is set
        to True.
        """

        if self.config.options.add_key_frames and self.config.options.add_joints:
            logging.info("setting keyframe on the root joint...")
            cmds.currentTime(0)
            cmds.select(FACIAL_ROOT_JOINT, replace=True)
            cmds.setKeyframe(inTangentType="linear", outTangentType="linear")

    def create_character_meshes(self) -> None:
        """
        Builds the meshes of the character. If specified in the character options they get parented to a created
        character node transform, otherwise the meshes get put to the root level of the scene.
        """

        logging.info("building character meshes...")
        meshes: Dict[int, List[MObject]] = {}
        for lod, meshes_per_lod in enumerate(
            self.dna.get_meshes_by_lods(self.config.meshes)
        ):
            if self.config.create_character_node and meshes_per_lod:
                logging.info(f"building LOD for {lod}")
                obj_name = f"{GEOMETRY_HOLDER_PREFIX}{self.character_name}|{LOD_HOLDER_PREFIX}{lod}"
                self.create_lod_node(lod=lod, obj_name=obj_name)

            meshes[lod] = self.create_meshes(
                lod=lod,
                meshes_per_lod=meshes_per_lod,
            )
        self.meshes = meshes

    def create_meshes(self, lod: int, meshes_per_lod: List[int]) -> List[MObject]:
        """
        Builds the meshes from the provided mesh ids and then attaches them to a given lod if specified in the
        character configuration.

        @type lod: int
        @param lod: The lod number representing the display layer the meshes to the display layer.

        @type meshes_per_lod: List[int]
        @param meshes_per_lod: List of mesh indices that are being built.

        @rtype: List[MObject]
        @returns: The list of maya objects that represent the meshes added to the scene.
        """

        meshes: List[MObject] = []
        for mesh_index in meshes_per_lod:
            builder = Mesh(
                character_config=self.config,
                dna=self.dna,
                mesh_index=mesh_index,
            )
            builder.build()

            mesh_name = self.dna.get_mesh_name(mesh_index=mesh_index)
            meshes.append(mesh_name)

            if self.config.create_display_layers:
                self.add_mesh_to_display_layer(mesh_name, lod)
            if self.config.create_character_node:
                self.attach_mesh_to_lod(mesh_name, lod)
            ShaderUtil.default_lambert_shader(
                mesh_name, self.character_name, self.config.create_character_node
            )
        return meshes

    def add_gui(self) -> None:
        """
        Adds a gui according to the specified gui options. If none is specified no gui will be added.
        """

        if self.config.gui_options:
            logging.info("adding gui...")
            builder = Gui(self.config.gui_options)
            self.import_gui(
                gui_path=self.config.gui_options.gui_path, group_name=GUI_HOLDER
            )
            builder.build()
            self.create_ctrl_attributes()
            self.create_frm_attributes()

    def add_analog_gui(
        self,
        add_to_character_node: bool = False,
    ) -> None:
        """
        Adds an analog gui according to the specified analog gui options. If none is specified no analog gui will be
        added.

        @type add_to_character_node: bool @param add_to_character_node: A flag that specifies if the imported analog
        gui should be parented to the character node transform (default value is None).
        """

        if self.config.analog_gui_options and self.config.options.add_joints:
            logging.info("adding analog gui...")
            builder = AnalogGui(self.config.analog_gui_options)
            self.import_gui(
                gui_path=self.config.analog_gui_options.gui_path,
                group_name=ANALOG_GUI_HOLDER,
                add_to_character_node=add_to_character_node,
            )
            builder.build()

    def import_gui(
        self, gui_path: str, group_name: str, add_to_character_node: bool = False
    ) -> None:
        """
        Imports a gui using the provided parameters.

        @type gui_path: str
        @param gui_path: The path of the gui file that needs to be imported.

        @type group_name: str
        @param group_name: The name of the transform that holds the imported asset.

        @type add_to_character_node: bool @param add_to_character_node: A flag representing if the gui holder should
        be attached to the character node or be on the root of the scene (default value is False)
        """

        cmds.file(gui_path, i=True, groupReference=True, groupName=group_name)

        if add_to_character_node:
            cmds.parent(group_name, f"{RIG_HOLDER_PREFIX}{self.character_name}")

    def add_rig_logic_node(self) -> None:
        """
        Creates and adds a rig logic node specified in the character configuration.
        """

        RigLogic.add_rig_logic(config=self.config, character_name=self.character_name)

    def run_additional_assembly_script(self) -> None:
        """
        Runs an additional assembly script if specified in the character configuration.
        """

        AdditionalAssemblyScript.run_additional_assembly_script(config=self.config)
