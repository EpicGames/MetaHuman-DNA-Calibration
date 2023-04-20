from dataclasses import dataclass, field
from typing import List, Optional, cast

from dna import BinaryStreamReader as DNAReader

from .definition import Definition
from .layer import Layer


class Behavior(Definition):
    """
    @type reader: BinaryStreamReader
    @param reader: The binary stream reader being used

    @type gui_to_raw: ConditionalTable
    @param gui_to_raw: Mapping data about gui to raw values

    @type psd: PSDMatrix
    @param psd: The data representing Pose Space Deformation

    @type blend_shapes: BlendShapesData
    @param blend_shapes: The data representing blend shapes

    @type animated_maps: AnimatedMapsConditionalTable
    @param animated_maps: The data representing animated maps

    @type joints: JointGroups
    @param joints: The data representing joints
    """

    def __init__(self, reader: DNAReader, layers: Optional[List[Layer]]) -> None:
        super().__init__(reader, layers)

        self.gui_to_raw = ConditionalTable()
        self.psd = PSDMatrix()
        self.blend_shapes = BlendShapesData()
        self.animated_maps_conditional_table = AnimatedMapsConditionalTable()
        self.joint_groups = JointGroups()
        self.behavior_read = False

    def start_read(self) -> None:
        super().start_read()
        self.behavior_read = False

    def is_read(self) -> bool:
        return super().is_read() and self.behavior_read

    def read(self) -> None:
        """
        Starts reading in the behavior part of the DNA
        """
        super().read()

        if not self.behavior_read and self.layer_enabled(Layer.behavior):
            self.behavior_read = True
            self.add_gui_to_raw()
            self.add_psd()
            self.add_joint_groups()
            self.add_blend_shapes()
            self.add_animated_maps_conditional_table()

    def get_animated_map_lods(self) -> List[int]:
        return cast(List[int], self.reader.getAnimatedMapLODs())

    def get_animated_map_from_values(self) -> List[float]:
        return cast(List[float], self.reader.getAnimatedMapFromValues())

    def get_animated_map_to_values(self) -> List[float]:
        return cast(List[float], self.reader.getAnimatedMapToValues())

    def get_animated_map_slope_values(self) -> List[float]:
        return cast(List[float], self.reader.getAnimatedMapSlopeValues())

    def get_animated_map_cut_values(self) -> List[float]:
        return cast(List[float], self.reader.getAnimatedMapCutValues())

    def get_animated_map_input_indices(self) -> List[int]:
        return cast(List[int], self.reader.getAnimatedMapInputIndices())

    def get_animated_map_output_indices(self) -> List[int]:
        return cast(List[int], self.reader.getAnimatedMapOutputIndices())

    def get_gui_to_raw_from_values(self) -> List[float]:
        return cast(List[float], self.reader.getGUIToRawFromValues())

    def get_gui_to_raw_to_values(self) -> List[float]:
        return cast(List[float], self.reader.getGUIToRawToValues())

    def gget_gui_to_raw_slope_values(self) -> List[float]:
        return cast(List[float], self.reader.getGUIToRawSlopeValues())

    def get_gui_to_raw_cut_values(self) -> List[float]:
        return cast(List[float], self.reader.getGUIToRawCutValues())

    def get_gui_to_raw_input_indices(self) -> List[int]:
        return cast(List[int], self.reader.getGUIToRawInputIndices())

    def get_gui_to_raw_output_indices(self) -> List[int]:
        return cast(List[int], self.reader.getGUIToRawOutputIndices())

    def get_psd_count(self) -> int:
        return cast(int, self.reader.getPSDCount())

    def get_psd_row_indices(self) -> List[int]:
        return cast(List[int], self.reader.getPSDRowIndices())

    def get_psd_column_indices(self) -> List[int]:
        return cast(List[int], self.reader.getPSDColumnIndices())

    def get_psd_values(self) -> List[float]:
        return cast(List[float], self.reader.getPSDValues())

    def get_blend_shape_channel_lods(self) -> List[int]:
        return cast(List[int], self.reader.getBlendShapeChannelLODs())

    def get_blend_shape_channel_input_indices(self) -> List[int]:
        return cast(List[int], self.reader.getBlendShapeChannelInputIndices())

    def get_blend_shape_channel_output_indices(self) -> List[int]:
        return cast(List[int], self.reader.getBlendShapeChannelOutputIndices())

    def get_joint_row_count(self) -> int:
        return cast(int, self.reader.getJointRowCount())

    def get_joint_column_count(self) -> int:
        return cast(int, self.reader.getJointColumnCount())

    def get_joint_variable_attribute_indices(self) -> int:
        return cast(int, self.reader.getJointVariableAttributeIndices())

    def get_joint_group_count(self) -> int:
        return cast(int, self.reader.getJointGroupCount())

    def get_joint_group_logs(self, joint_group_index: int) -> List[int]:
        return cast(List[int], self.reader.getJointGroupLODs(joint_group_index))

    def get_joint_group_input_indices(self, joint_group_index: int) -> List[int]:
        return cast(List[int], self.reader.getJointGroupInputIndices(joint_group_index))

    def get_joint_group_output_indices(self, joint_group_index: int) -> List[int]:
        return cast(
            List[int], self.reader.getJointGroupOutputIndices(joint_group_index)
        )

    def get_joint_group_values(self, joint_group_index: int) -> List[float]:
        return cast(List[float], self.reader.getJointGroupValues(joint_group_index))

    def get_joint_group_joint_indices(self, joint_group_index: int) -> List[int]:
        return cast(List[int], self.reader.getJointGroupJointIndices(joint_group_index))

    def add_gui_to_raw(self) -> None:
        """Reads in the gui to raw mapping"""

        self.reader.gui_to_raw = ConditionalTable(
            inputs=self.get_gui_to_raw_input_indices(),
            outputs=self.get_gui_to_raw_output_indices(),
            from_values=self.get_gui_to_raw_from_values(),
            to_values=self.get_gui_to_raw_to_values(),
            slope_values=self.gget_gui_to_raw_slope_values(),
            cut_values=self.get_gui_to_raw_cut_values(),
        )

    def add_psd(self) -> None:
        """Reads in the PSD part of the behavior"""

        self.psd = PSDMatrix(
            count=self.get_psd_count(),
            rows=self.get_psd_row_indices(),
            columns=self.get_psd_column_indices(),
            values=self.get_psd_values(),
        )

    def add_joint_groups(self) -> None:
        """Reads in the joints part of the behavior"""

        self.joint_groups.joint_row_count = self.reader.getJointRowCount()
        self.joint_groups.joint_column_count = self.reader.getJointColumnCount()
        for lod in range(self.get_lod_count()):
            self.joint_groups.joint_variable_attribute_indices.append(
                self.reader.getJointVariableAttributeIndices(lod)
            )
        for joint_group_index in range(self.get_joint_group_count()):
            self.joint_groups.joint_groups.append(
                JointGroup(
                    lods=self.get_joint_group_logs(joint_group_index),
                    inputs=self.get_joint_group_input_indices(joint_group_index),
                    outputs=self.get_joint_group_output_indices(joint_group_index),
                    values=self.get_joint_group_values(joint_group_index),
                    joints=self.get_joint_group_joint_indices(joint_group_index),
                )
            )

    def add_blend_shapes(self) -> None:
        """Reads in the blend shapes part of the behavior"""

        self.blend_shapes = BlendShapesData(
            lods=self.get_blend_shape_channel_lods(),
            inputs=self.get_blend_shape_channel_input_indices(),
            outputs=self.get_blend_shape_channel_output_indices(),
        )

    def add_animated_maps_conditional_table(self) -> None:
        """Reads in the animated maps part of the behavior"""

        self.reader.animated_maps_conditional_table = AnimatedMapsConditionalTable(
            lods=self.get_animated_map_lods(),
            conditional_table=ConditionalTable(
                from_values=self.get_animated_map_from_values(),
                to_values=self.get_animated_map_to_values(),
                slope_values=self.get_animated_map_slope_values(),
                cut_values=self.get_animated_map_cut_values(),
                inputs=self.get_animated_map_input_indices(),
                outputs=self.get_animated_map_output_indices(),
            ),
        )


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
class AnimatedMapsConditionalTable:
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
class JointGroups:
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
