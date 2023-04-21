from dataclasses import dataclass, field
from typing import Dict, List, Optional, Tuple, cast

from dna import BinaryStreamReader as DNAReader
from dna import MeshBlendShapeChannelMapping

from ..model import Point3
from .descriptor import Descriptor
from .layer import Layer


class Definition(Descriptor):
    """
    A class used for reading and accessing the definition part of the DNA file

    Attributes
    ----------
    @type reader: BinaryStreamReader
    @param reader: The binary stream reader being used

    @type definition: DefinitionModel
    @param definition: The object that holds the definition data read from the DNA file

    @type joints: Joints
    @param joints: The data about joints

    @type blend_shape_channels: GeometryEntity
    @param blend_shape_channels: The names and indices of blend shape channels

    @type animated_maps: GeometryEntity
    @param animated_maps: The names and indices of animated maps

    @type meshes: GeometryEntity
    @param meshes: The names and indices of the meshes

    @type gui_control_names: List[str]
    @param gui_control_names: The list of gui control names

    @type raw_control_names: List[str]
    @param raw_control_names: The list of raw control names

    @type mesh_blend_shape_channel_mapping: List[Tuple[int, int]]
    @param mesh_blend_shape_channel_mapping: Mapping of mesh index to the blend shape channel index

    @type mesh_blend_shape_channel_mapping_indices_for_lod: List[List[int]]
    @param mesh_blend_shape_channel_mapping_indices_for_lod: The list of blend shape channel mapping indices by lod

    @type neutral_joint_translations: List[Point3]
    @param neutral_joint_translations: The list of neutral joint translations

    @type neutral_joint_rotations: List[Point3]
    @param neutral_joint_rotations: The list of neutral joint rotations
    """

    def __init__(self, reader: DNAReader, layers: Optional[List[Layer]]) -> None:
        super().__init__(reader, layers)
        self.joints = Joints()
        self.blend_shape_channels = GeometryEntity()
        self.animated_maps = GeometryEntity()
        self.meshes = GeometryEntity()
        self.meshes_mapping: Dict[str, int] = {}

        self.gui_control_names: List[str] = []
        self.raw_control_names: List[str] = []

        self.mesh_blend_shape_channel_mapping: List[Tuple[int, int]] = []
        self.mesh_blend_shape_channel_mapping_indices_for_lod: List[List[int]] = []

        self.neutral_joint_translations: List[Point3] = []
        self.neutral_joint_rotations: List[Point3] = []
        self.definition_read = False

    def start_read(self) -> None:
        super().start_read()
        self.definition_read = False

    def is_read(self) -> bool:
        return super().is_read() and self.definition_read

    def read(self) -> None:
        """
        Starts reading in the definition part of the DNA

        @rtype: DefinitionModel
        @returns: the instance of the created definition model
        """
        super().read()

        if not self.definition_read and self.layer_enabled(Layer.definition):
            self.definition_read = True
            self.add_controls()
            self.add_joints()
            self.add_blend_shape_channels()
            self.add_animated_maps()
            self.add_meshes()
            self.add_mesh_blend_shape_channel_mapping()
            self.add_neutral_joints()

    def get_lod_count(self) -> int:
        return cast(int, self.reader.getLODCount())

    def get_gui_control_count(self) -> int:
        return cast(int, self.reader.getGUIControlCount())

    def get_gui_control_name(self, index: int) -> str:
        return cast(str, self.reader.getGUIControlName(index))

    def get_raw_control_count(self) -> int:
        return cast(int, self.reader.getRawControlCount())

    def get_raw_control_name(self, index: int) -> str:
        return cast(str, self.reader.getRawControlName(index))

    def get_raw_control_names(self) -> List[str]:
        names = []
        for i in range(self.get_raw_control_count()):
            names.append(self.get_raw_control_name(i))
        return names

    def get_neutral_joint_translation(self, index: int) -> Point3:
        translation = cast(List[float], self.reader.getNeutralJointTranslation(index))
        return Point3(translation[0], translation[1], translation[2])

    def get_neutral_joint_translation_xs(self) -> List[float]:
        return cast(List[float], self.reader.getNeutralJointTranslationXs())

    def get_neutral_joint_translation_ys(self) -> List[float]:
        return cast(List[float], self.reader.getNeutralJointTranslationYs())

    def get_neutral_joint_translation_zs(self) -> List[float]:
        return cast(List[float], self.reader.getNeutralJointTranslationZs())

    def get_neutral_joint_rotation(self, index: int) -> Point3:
        translation = cast(List[float], self.reader.getNeutralJointRotation(index))
        return Point3(translation[0], translation[1], translation[2])

    def get_neutral_joint_rotation_xs(self) -> List[float]:
        return cast(List[float], self.reader.getNeutralJointRotationXs())

    def get_neutral_joint_rotation_ys(self) -> List[float]:
        return cast(List[float], self.reader.getNeutralJointRotationYs())

    def get_neutral_joint_rotation_zs(self) -> List[float]:
        return cast(List[float], self.reader.getNeutralJointRotationZs())

    def get_mesh_blend_shape_channel_mapping_count(self) -> int:
        return cast(int, self.reader.getMeshBlendShapeChannelMappingCount())

    def get_mesh_blend_shape_channel_mapping(
        self, index: int
    ) -> MeshBlendShapeChannelMapping:
        return cast(
            MeshBlendShapeChannelMapping,
            self.reader.getMeshBlendShapeChannelMapping(index),
        )

    def get_mesh_blend_shape_channel_mapping_for_lod(self, lod: int) -> List[int]:
        return cast(
            List[int], self.reader.getMeshBlendShapeChannelMappingIndicesForLOD(lod)
        )

    def get_joint_count(self) -> int:
        return cast(int, self.reader.getJointCount())

    def get_joint_name(self, index: int) -> str:
        return cast(str, self.reader.getJointName(index))

    def get_joint_parent_index(self, index: int) -> int:
        return cast(int, self.reader.getJointParentIndex(index))

    def get_joint_indices_for_lod(self, index: int) -> List[int]:
        return cast(List[int], self.reader.getJointIndicesForLOD(index))

    def get_blend_shape_channel_count(self) -> int:
        return cast(int, self.reader.getBlendShapeChannelCount())

    def get_blend_shape_channel_name(self, index: int) -> str:
        return cast(str, self.reader.getBlendShapeChannelName(index))

    def get_mesh_count(self) -> int:
        return cast(int, self.reader.getMeshCount())

    def get_mesh_name(self, index: int) -> str:
        return cast(str, self.reader.getMeshName(index))

    def get_mesh_indices_for_lod(self, index: int) -> List[int]:
        return cast(List[int], self.reader.getMeshIndicesForLOD(index))

    def get_blend_shape_channel_indices_for_lod(self, index: int) -> List[int]:
        return cast(List[int], self.reader.getBlendShapeChannelIndicesForLOD(index))

    def get_animated_map_count(self) -> int:
        return cast(int, self.reader.getAnimatedMapCount())

    def get_animated_map_name(self, index: int) -> str:
        return cast(str, self.reader.getAnimatedMapName(index))

    def get_animated_map_names(self) -> List[str]:
        names = []
        for i in range(self.get_animated_map_count()):
            names.append(self.get_animated_map_name(i))
        return names

    def get_animated_map_indices_for_lod(self, index: int) -> List[int]:
        return cast(List[int], self.reader.getAnimatedMapIndicesForLOD(index))

    def get_translation_unit(self) -> int:
        return cast(int, self.reader.getTranslationUnit())

    def get_rotation_unit(self) -> int:
        return cast(int, self.reader.getRotationUnit())

    def add_neutral_joints(self) -> None:
        """Reads in the neutral joints part of the definition"""

        neutral_joint_translation_xs = self.get_neutral_joint_translation_xs()
        neutral_joint_translation_ys = self.get_neutral_joint_translation_ys()
        neutral_joint_translation_zs = self.get_neutral_joint_translation_zs()
        neutral_joint_translation_count_x = len(neutral_joint_translation_xs)
        for index in range(neutral_joint_translation_count_x):
            self.neutral_joint_translations.append(
                Point3(
                    x=neutral_joint_translation_xs[index],
                    y=neutral_joint_translation_ys[index],
                    z=neutral_joint_translation_zs[index],
                )
            )
        neutral_joint_rotation_xs = self.get_neutral_joint_rotation_xs()
        neutral_joint_rotation_ys = self.get_neutral_joint_rotation_ys()
        neutral_joint_rotation_zs = self.get_neutral_joint_rotation_zs()
        neutral_joint_rotation_count_x = len(neutral_joint_rotation_xs)
        for index in range(neutral_joint_rotation_count_x):
            self.neutral_joint_rotations.append(
                Point3(
                    x=neutral_joint_rotation_xs[index],
                    y=neutral_joint_rotation_ys[index],
                    z=neutral_joint_rotation_zs[index],
                )
            )

    def add_mesh_blend_shape_channel_mapping(self) -> None:
        """Reads in the mesh blend shape channel mapping"""

        for index in range(self.get_mesh_blend_shape_channel_mapping_count()):
            mapping = self.get_mesh_blend_shape_channel_mapping(index)
            self.mesh_blend_shape_channel_mapping.append(
                (mapping.meshIndex, mapping.blendShapeChannelIndex)
            )
        for lod in range(self.get_lod_count()):
            self.mesh_blend_shape_channel_mapping_indices_for_lod.append(
                self.get_mesh_blend_shape_channel_mapping_for_lod(lod)
            )

    def add_meshes(self) -> None:
        """Reads in the meshes of the definition"""

        for index in range(self.get_mesh_count()):
            mesh_name = self.get_mesh_name(index)
            self.meshes.names.append(mesh_name)
            self.meshes_mapping[mesh_name] = index
        for index in range(self.get_lod_count()):
            self.meshes.lod_indices.append(self.get_mesh_indices_for_lod(index))

    def add_animated_maps(self) -> None:
        """Reads in the animated maps of the definition"""

        for index in range(self.get_animated_map_count()):
            self.animated_maps.names.append(self.get_animated_map_name(index))
        for index in range(self.get_lod_count()):
            self.animated_maps.lod_indices.append(
                self.get_animated_map_indices_for_lod(index)
            )

    def add_blend_shape_channels(self) -> None:
        """Reads in the neutral joints part of the definition"""

        for index in range(self.get_blend_shape_channel_count()):
            self.blend_shape_channels.names.append(
                self.get_blend_shape_channel_name(index)
            )
        for index in range(self.get_lod_count()):
            self.blend_shape_channels.lod_indices.append(
                self.get_blend_shape_channel_indices_for_lod(index)
            )

    def add_joints(self) -> None:
        """Reads in the joints of the definition"""

        for index in range(self.get_joint_count()):
            self.joints.names.append(self.get_joint_name(index))
            self.joints.parent_index.append(self.get_joint_parent_index(index))
        for index in range(self.get_lod_count()):
            self.joints.lod_indices.append(self.get_joint_indices_for_lod(index))

    def add_controls(self) -> None:
        """Reads in the gui and raw controls of the definition"""

        for index in range(self.get_gui_control_count()):
            self.gui_control_names.append(self.get_gui_control_name(index))
        for index in range(self.get_raw_control_count()):
            self.raw_control_names.append(self.get_raw_control_name(index))


@dataclass
class GeometryEntity:
    """
    A model class for holding names and indices

    Attributes
    ----------
    @type names: List[str]
    @param names: List of names

    @type lod_indices: List[List[int]]
    @param lod_indices: List of indices per lod
    """

    names: List[str] = field(default_factory=list)
    lod_indices: List[List[int]] = field(default_factory=list)


@dataclass
class Joints(GeometryEntity):
    """
    A model class for holding data about the joints

    Attributes
    ----------
    @type parent_index: List[int]
    @param parent_index: List of parent indices for each joint index
    """

    parent_index: List[int] = field(default_factory=list)
