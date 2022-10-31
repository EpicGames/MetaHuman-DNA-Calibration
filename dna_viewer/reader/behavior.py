from typing import Optional

from dna import BinaryStreamReader

from ..model.behavior import AnimatedMapsData
from ..model.behavior import Behavior as BehaviorModel
from ..model.behavior import BlendShapesData, ConditionalTable, JointGroup, PSDMatrix


class Behavior:
    """
    A class used for reading the behavior part of the DNA file

    Attributes
    ----------
    @type reader: BinaryStreamReader
    @param reader: The stream reader being used

    @type behavior: BehaviorModel
    @param behavior: The object that holds the behavior data read from the DNA file
    """

    def __init__(self, stream_reader: BinaryStreamReader) -> None:
        self.reader = stream_reader
        self.behavior: Optional[BehaviorModel] = None

    def read(self) -> BehaviorModel:
        """
        Starts reading in the behavior part of the DNA

        @rtype: BehaviorModel
        @returns: the instance of the created behavior model
        """

        self.behavior = BehaviorModel()
        self.add_gui_to_raw()
        self.add_psd()
        self.add_joints()
        self.add_blend_shapes()
        self.add_animated_maps()
        return self.behavior

    def add_gui_to_raw(self) -> None:
        """Reads in the gui to raw mapping"""

        self.behavior.gui_to_raw = ConditionalTable(
            inputs=self.reader.getGUIToRawInputIndices(),
            outputs=self.reader.getGUIToRawOutputIndices(),
            from_values=self.reader.getGUIToRawFromValues(),
            to_values=self.reader.getGUIToRawToValues(),
            slope_values=self.reader.getGUIToRawSlopeValues(),
            cut_values=self.reader.getGUIToRawCutValues(),
        )

    def add_psd(self) -> None:
        """Reads in the PSD part of the behavior"""

        self.behavior.psd = PSDMatrix(
            count=self.reader.getPSDCount(),
            rows=self.reader.getPSDRowIndices(),
            columns=self.reader.getPSDColumnIndices(),
            values=self.reader.getPSDValues(),
        )

    def add_joints(self) -> None:
        """Reads in the joints part of the behavior"""

        self.behavior.joints.joint_row_count = self.reader.getJointRowCount()
        self.behavior.joints.joint_column_count = self.reader.getJointColumnCount()
        for lod in range(self.reader.getLODCount()):
            self.behavior.joints.joint_variable_attribute_indices.append(
                self.reader.getJointVariableAttributeIndices(lod)
            )
        for joint_group_index in range(self.reader.getJointGroupCount()):
            self.behavior.joints.joint_groups.append(
                JointGroup(
                    lods=self.reader.getJointGroupLODs(joint_group_index),
                    inputs=self.reader.getJointGroupInputIndices(joint_group_index),
                    outputs=self.reader.getJointGroupOutputIndices(joint_group_index),
                    values=self.reader.getJointGroupValues(joint_group_index),
                    joints=self.reader.getJointGroupJointIndices(joint_group_index),
                )
            )

    def add_blend_shapes(self) -> None:
        """Reads in the blend shapes part of the behavior"""

        self.behavior.blend_shapes = BlendShapesData(
            lods=self.reader.getBlendShapeChannelLODs(),
            inputs=self.reader.getBlendShapeChannelInputIndices(),
            outputs=self.reader.getBlendShapeChannelOutputIndices(),
        )

    def add_animated_maps(self) -> None:
        """Reads in the animated maps part of the behavior"""

        self.behavior.animated_maps = AnimatedMapsData(
            lods=self.reader.getAnimatedMapLODs(),
            conditional_table=ConditionalTable(
                from_values=self.reader.getAnimatedMapFromValues(),
                to_values=self.reader.getAnimatedMapToValues(),
                slope_values=self.reader.getAnimatedMapSlopeValues(),
                cut_values=self.reader.getAnimatedMapCutValues(),
                inputs=self.reader.getAnimatedMapInputIndices(),
                outputs=self.reader.getAnimatedMapOutputIndices(),
            ),
        )
