from dataclasses import dataclass, field
from typing import List, Optional


@dataclass
class ConditionalTable:
    """
    A model class for holding various values

    Attributes
    ----------
    @type from_values: List[float]
    @param from_values: The list of values

    @type to_values: List[float]
    @param to_values: The list of values

    @type slope_values: List[float]
    @param slope_values: The list of slope values

    @type cut_values: List[float]
    @param cut_values: The list of cut values

    @type inputs: List[int]
    @param inputs: The indices of inputs

    @type outputs: List[int]
    @param outputs: The indices of outputs
    """

    from_values: List[float] = field(default_factory=list)
    to_values: List[float] = field(default_factory=list)
    slope_values: List[float] = field(default_factory=list)
    cut_values: List[float] = field(default_factory=list)
    inputs: List[int] = field(default_factory=list)
    outputs: List[int] = field(default_factory=list)


@dataclass
class PSDMatrix:
    """
    A model class for holding data about Pose Space Deformation

    Attributes
    ----------
    @type count: int
    @param count: The list of values

    @type rows: List[int]
    @param rows: List of row indices used for storing values

    @type columns: List[int]
    @param columns: List of row indices used for storing values

    @type values: List[float]
    @param values: The list of values, that can be accessed from the row and column index
    """

    count: Optional[int] = field(default=None)
    rows: List[int] = field(default_factory=list)
    columns: List[int] = field(default_factory=list)
    values: List[float] = field(default_factory=list)


@dataclass
class JointGroup:
    """
    A model class for holding data about joint groups

    Attributes
    ----------
    @type lods: List[int]
    @param lods: A list of lod indices that the joint group is contained within

    @type values: List[float]
    @param values: A list of values

    @type joints: List[int]
    @param joints: A list of joint indices

    @type inputs: List[int]
    @param inputs: The indices of inputs

    @type outputs: List[int]
    @param outputs: The indices of outputs
    """

    lods: List[int] = field(default_factory=list)
    values: List[float] = field(default_factory=list)
    joints: List[int] = field(default_factory=list)
    inputs: List[int] = field(default_factory=list)
    outputs: List[int] = field(default_factory=list)


@dataclass
class BlendShapesData:
    """
    A model class for holding data about blend shapes

    Attributes
    ----------
    @type lods: List[int]
    @param lods: A list of lod indices that the blend shapes are contained within

    @type inputs: List[int]
    @param inputs: The indices of inputs

    @type outputs: List[int]
    @param outputs: The indices of outputs
    """

    lods: List[int] = field(default_factory=list)
    inputs: List[int] = field(default_factory=list)
    outputs: List[int] = field(default_factory=list)


@dataclass
class AnimatedMapsData:
    """
    A model class for holding data about animated maps

    Attributes
    ----------
    @type lods: List[int]
    @param lods: A list of lod indices that the blend shapes are contained within

    @type conditional_table: ConditionalTable
    @param conditional_table: Data needed for animated maps
    """

    lods: List[int] = field(default_factory=list)
    conditional_table: ConditionalTable = field(default_factory=ConditionalTable)


@dataclass
class JointsData:
    """
    A model class for storing data about joints

    Attributes
    ----------
    @type joint_row_count: int
    @param joint_row_count: The row count of the matrix that stores the joints data

    @type joint_column_count: int
    @param joint_column_count: The column count of the matrix that stores the joints data

    @type joint_variable_attribute_indices: List[List[int]]
    @param joint_variable_attribute_indices: List of joint variable attribute indices per LOD

    @type joint_groups: List[JointGroup]
    @param joint_groups: The list of joint groups
    """

    joint_row_count: Optional[int] = field(default=None)
    joint_column_count: Optional[int] = field(default=None)
    joint_variable_attribute_indices: List[List[int]] = field(default_factory=list)
    joint_groups: List[JointGroup] = field(default_factory=list)


@dataclass
class Behavior:
    """
    A model class for holding data about the behavior part of the DNA

    Attributes
    ----------
    @type gui_to_raw: ConditionalTable
    @param gui_to_raw: Mapping data about gui to raw values

    @type psd: PSDMatrix
    @param psd: The data representing Pose Space Deformation

    @type blend_shapes: BlendShapesData
    @param blend_shapes: The data representing blend shapes

    @type animated_maps: AnimatedMapsData
    @param animated_maps: The data representing animated maps

    @type joints: JointsData
    @param joints: The data representing joints
    """

    gui_to_raw: ConditionalTable = field(default_factory=ConditionalTable)
    psd: PSDMatrix = field(default_factory=PSDMatrix)
    blend_shapes: BlendShapesData = field(default_factory=BlendShapesData)
    animated_maps: AnimatedMapsData = field(default_factory=AnimatedMapsData)
    joints: JointsData = field(default_factory=JointsData)
