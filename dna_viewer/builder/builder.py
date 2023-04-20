import logging
import traceback
from dataclasses import dataclass, field
from pathlib import Path
from typing import Dict, List, Optional

from maya import cmds, mel

from ..builder.maya.util import Maya
from ..common import DNAViewerError
from ..dnalib.dnalib import DNA
from ..model import Joint as JointModel
from .config import AngleUnit, Config, LinearUnit
from .joint import Joint as JointBuilder
from .mesh import Mesh


@dataclass
class BuildResult:
    """
    A class used for returning data after finishing the build process

    Attributes
    ----------
    @type meshes_per_lod: Dict[int, List[str]]
    @param meshes_per_lod: The list of mesh names created group by LOD number
    """

    meshes_per_lod: Dict[int, List[str]] = field(default_factory=dict)

    def get_all_meshes(self) -> List[str]:
        """
        Flatten meshes to single list.

        @rtype: List[str]
        @returns: The list of all mesh names.
        """

        all_meshes = []
        for meshes_per_lod in self.meshes_per_lod.values():
            all_meshes.extend(meshes_per_lod)
        return all_meshes


class Builder:
    """
    A builder class used for building the character

    Attributes
    ----------
    @type config: Config
    @param config: The configuration options used for building the character

    @type dna: DNA
    @param dna: The DNA object read from the DNA file

    @type meshes: Dict[int, List[str]]
    @param meshes: A list of meshes created grouped by lod

    """

    def __init__(self, dna: DNA, config: Optional[Config] = None) -> None:
        self.config = config or Config()
        self.dna = dna
        self.meshes: Dict[int, List[str]] = {}
        self.all_loaded_meshes: List[int] = []

    def _build(self) -> bool:
        self.new_scene()
        self.set_filtered_meshes()
        if not self.all_loaded_meshes:
            logging.error("No mashes has been loaded.")
            return False

        self.create_groups()

        self.set_units()
        self.add_joints()
        self.build_meshes()
        self.add_ctrl_attributes_on_root_joint()
        self.add_animated_map_attributes_on_root_joint()
        self.add_key_frames()
        return True

    def build(self) -> BuildResult:
        """Builds the character"""
        self.meshes = {}
        try:
            filename = Path(self.dna.path).stem
            logging.info("******************************")
            logging.info(f"{filename} started building")
            logging.info("******************************")

            self._build()

            logging.info(f"{filename} built successfully!")

        except DNAViewerError as e:
            traceback.print_exc()
            raise e
        except Exception as e:
            traceback.print_exc()
            logging.error(f"Unhandled exception, {e}")
            raise DNAViewerError(f"Scene creation failed! Reason: {e}") from e
        return BuildResult(meshes_per_lod=self.meshes)

    def new_scene(self) -> None:
        cmds.file(new=True, force=True)

    def add_mesh_to_display_layer(self, mesh_name: str, lod: int) -> None:
        """
        Add the mesh with the given name to an already created display layer.

        @type mesh_name: str
        @param mesh_name: The name of the mesh that should be added to a display layer.

        @type lod: int
        @param lod: The lod value, this is needed for determining the name of the display layer that the mesh should be added to.
        """
        if self.config.create_display_layers:
            cmds.editDisplayLayerMembers(
                f"{self.config.top_level_group}_lod{lod}_layer", mesh_name
            )

    def _add_joints(self) -> List[JointModel]:
        """
        Reads and adds the joints to the scene, also returns a list model objects of joints that were added.

        @rtype: List[JointModel]
        @returns: The list containing model objects representing the joints that were added to the scene.
        """

        joints: List[JointModel] = self.dna.read_all_neutral_joints()
        builder = JointBuilder(
            joints,
        )
        builder.process()
        return joints

    def add_joints(self) -> None:
        """
        Starts adding the joints the character, if the character configuration options have add_joints set to False,
        this step will be skipped.
        """

        if self.config.add_joints:
            logging.info("adding joints to character...")
            joints = self._add_joints()

            if self.config.group_by_lod and joints:
                cmds.parent(joints[0].name, self.config.get_top_level_group())

    def create_groups(self) -> None:
        """
        Creates a Maya transform which will hold the character, if the character configuration options have
        create_character_node set to False, this step will be skipped.
        """

        if self.config.group_by_lod:
            logging.info("building character node...")
            cmds.group(world=True, empty=True, name=self.config.get_top_level_group())
            cmds.group(
                parent=self.config.get_top_level_group(),
                empty=True,
                name=self.config.get_geometry_group(),
            )
            cmds.group(
                parent=self.config.get_top_level_group(),
                empty=True,
                name=self.config.get_rig_group(),
            )
        for lod in self.get_display_layers():
            name = f"{self.config.top_level_group}_lod{lod}_layer"
            if not cmds.objExists(name):
                if self.config.group_by_lod:
                    cmds.group(
                        parent=self.config.get_geometry_group(),
                        empty=True,
                        name=f"{self.config.top_level_group}_lod{lod}_grp",
                    )
                    cmds.select(
                        f"{self.config.top_level_group}_lod{lod}_grp",
                        replace=True,
                    )
                if self.config.create_display_layers:
                    cmds.createDisplayLayer(name=name, noRecurse=True)

    def attach_mesh_to_lod(self, mesh_name: str, lod: int) -> None:
        """
        Attaches the mesh called mesh_name to a given lod.

        @type mesh_name: str
        @param mesh_name: The mesh that needs to be attached to a lod holder object.

        @type lod: str
        @param lod: The name of the mesh that should be added to a display layer.
        """
        if self.config.group_by_lod:
            parent_node = f"{self.config.get_top_level_group()}|{self.config.get_geometry_group()}|{self.config.top_level_group}_lod{lod}_grp"
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

    def add_ctrl_attributes_on_root_joint(self) -> None:
        """
        Adds and sets the raw gui control attributes on root joint.
        """

        if self.config.add_ctrl_attributes_on_root_joint and self.config.add_joints:
            gui_control_names = self.dna.get_raw_control_names()
            for name in gui_control_names:
                ctrl_and_attr_names = name.split(".")
                self.add_attribute(
                    control_name=self.config.facial_root_joint_name,
                    long_name=ctrl_and_attr_names[1],
                )

    def add_animated_map_attributes_on_root_joint(self) -> None:
        """
        Adds and sets the animated map attributes on root joint.
        """

        if (
            self.config.add_animated_map_attributes_on_root_joint
            and self.config.add_joints
        ):
            names = self.dna.get_animated_map_names()
            for name in names:
                long_name = name.replace(".", "_")
                self.add_attribute(
                    control_name=self.config.facial_root_joint_name, long_name=long_name
                )

    def add_attribute(self, control_name: str, long_name: str) -> None:
        """
        Adds attributes wrapper for internal usage.
        """
        cmds.addAttr(
            control_name,
            longName=long_name,
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

        if self.config.add_key_frames and self.config.add_joints:
            logging.info("setting keyframe on the root joint...")
            cmds.currentTime(0)
            if cmds.objExists(self.config.facial_root_joint_name):
                cmds.select(self.config.facial_root_joint_name, replace=True)
                cmds.setKeyframe(inTangentType="linear", outTangentType="linear")

    def set_filtered_meshes(self) -> None:
        self.all_loaded_meshes = self.get_filtered_meshes()

    def get_mesh_indices_filter(self) -> List[int]:
        indices = []
        for index in range(self.dna.get_mesh_count()):
            mesh_name = self.dna.get_mesh_name(index)
            for cur_filter in self.config.mesh_filter:
                if cur_filter in mesh_name:
                    indices.append(index)
        return indices

    def get_filtered_meshes(self) -> List[int]:
        if not self.config.mesh_filter and not self.config.lod_filter:
            if self.config.meshes:
                return self.config.meshes
            return list(range(self.dna.get_mesh_count()))

        meshes: List[int] = []
        meshes_by_lod = self.dna.get_all_meshes_grouped_by_lod()
        all_meshes = [mesh_index for meshes in meshes_by_lod for mesh_index in meshes]
        mesh_indices_filter = self.get_mesh_indices_filter()

        if self.config.lod_filter:
            for lod in self.config.lod_filter:
                if 0 <= lod < len(meshes_by_lod):
                    meshes.extend(meshes_by_lod[lod])
            if mesh_indices_filter:
                return list(set(meshes) & set(mesh_indices_filter))
            return meshes
        if self.config.mesh_filter:
            return list(set(all_meshes) & set(mesh_indices_filter))
        return all_meshes

    def build_meshes(self) -> None:
        """
        Builds the meshes. If specified in the config they get parented to a created
        character node transform, otherwise the meshes get put to the root level of the scene.
        """

        logging.info("adding character meshes...")
        self.meshes = {}
        for lod, meshes_per_lod in enumerate(
            self.dna.get_meshes_by_lods(self.all_loaded_meshes)
        ):
            self.meshes[lod] = self.build_meshes_by_lod(
                lod=lod, meshes_per_lod=meshes_per_lod
            )

    def build_meshes_by_lod(self, lod: int, meshes_per_lod: List[int]) -> List[str]:
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

        meshes: List[str] = []
        for mesh_index in meshes_per_lod:
            builder = Mesh(
                config=self.config,
                dna=self.dna,
                mesh_index=mesh_index,
            )
            builder.build()

            mesh_name = self.dna.get_mesh_name(index=mesh_index)
            meshes.append(mesh_name)

            self.add_mesh_to_display_layer(mesh_name, lod)
            self.attach_mesh_to_lod(mesh_name, lod)
            self.default_lambert_shader(mesh_name)
        return meshes

    def default_lambert_shader(self, mesh_name: str) -> None:
        try:
            if self.config.group_by_lod:
                names = cmds.ls(f"*|{mesh_name}", l=True)
                for item in names:
                    if item.startswith(f"|{self.config.get_top_level_group()}"):
                        cmds.select(item, r=True)
                        break
            else:
                cmds.select(mesh_name, r=True)

            mel.eval("sets -e -forceElement initialShadingGroup")

        except Exception as e:
            logging.error(
                f"Couldn't set lambert shader for mesh {mesh_name}. Reason: {e}"
            )
            raise DNAViewerError(e) from e

    def set_units(self) -> None:
        """Sets the translation and rotation units of the scene from @config"""

        linear_unit = self.get_linear_unit()
        angle_unit = self.get_angle_unit()

        cmds.currentUnit(linear=linear_unit.name, angle=angle_unit.name)

    def get_linear_unit(self) -> LinearUnit:
        return self.get_linear_unit_from_int(self.dna.get_translation_unit())

    def get_angle_unit(self) -> AngleUnit:
        return self.get_angle_unit_from_int(self.dna.get_rotation_unit())

    def get_linear_unit_from_int(self, value: int) -> LinearUnit:
        """
        Returns an enum from an int value.
        0 -> cm
        1 -> m

        @type value: int
        @param value: The value that the enum is mapped to.

        @rtype: LinearUnit
        @returns: LinearUnit.cm or LinearUnit.m
        """

        if value == 0:
            return LinearUnit.cm
        if value == 1:
            return LinearUnit.m
        raise DNAViewerError(f"Unknown linear unit set in DNA file! value {value}")

    def get_angle_unit_from_int(self, value: int) -> AngleUnit:
        """
        Returns an enum from an int value.
        0 -> degree
        1 -> radian

        @type value: int
        @param value: The value that the enum is mapped to.

        @rtype: AngleUnit
        @returns: AngleUnit.degree or AngleUnit.radian
        """

        if value == 0:
            return AngleUnit.degree
        if value == 1:
            return AngleUnit.radian
        raise DNAViewerError(f"Unknown angle unit set in DNA file! value {value}")

    def get_display_layers(self) -> List[int]:
        """Gets a lod id list that need to be created for the meshes from @config"""
        meshes: List[int] = []
        for idx, meshes_per_lod in enumerate(
            self.dna.get_meshes_by_lods(self.all_loaded_meshes)
        ):
            if meshes_per_lod:
                meshes.append(idx)
        return list(set(meshes))
