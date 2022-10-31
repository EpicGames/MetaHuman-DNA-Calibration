from dataclasses import dataclass, field
from typing import List, Tuple

from ..model.geometry import Point3


@dataclass
class NamesAndIndices:
    """
    A model class for holding names and indices

    Attributes
    ----------
    @type names: List[str]
    @param names: List of names

    @type indices_for_lod: List[List[int]]
    @param indices_for_lod: List of indices per lod
    """

    names: List[str] = field(default_factory=list)
    indices_for_lod: List[List[int]] = field(default_factory=list)


@dataclass
class Joints(NamesAndIndices):
    """
    A model class for holding data about the joints

    Attributes
    ----------
    @type parent_index: List[int]
    @param parent_index: List of parent indices for each joint index
    """

    parent_index: List[int] = field(default_factory=list)


@dataclass
class Definition:
    """
    A model class for holding data about the definition part of the DNA

    Attributes
    ----------
    @type joints: Joints
    @param joints: The data about joints

    @type blend_shape_channels: NamesAndIndices
    @param blend_shape_channels: The names and indices of blend shape channels

    @type animated_maps: NamesAndIndices
    @param animated_maps: The names and indices of animated maps

    @type meshes: NamesAndIndices
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

    joints: Joints = field(default_factory=Joints)
    blend_shape_channels: NamesAndIndices = field(default_factory=NamesAndIndices)
    animated_maps: NamesAndIndices = field(default_factory=NamesAndIndices)
    meshes: NamesAndIndices = field(default_factory=NamesAndIndices)

    gui_control_names: List[str] = field(default_factory=list)
    raw_control_names: List[str] = field(default_factory=list)

    mesh_blend_shape_channel_mapping: List[Tuple[int, int]] = field(
        default_factory=list
    )
    mesh_blend_shape_channel_mapping_indices_for_lod: List[List[int]] = field(
        default_factory=list
    )

    neutral_joint_translations: List[Point3] = field(default_factory=list)
    neutral_joint_rotations: List[Point3] = field(default_factory=list)
