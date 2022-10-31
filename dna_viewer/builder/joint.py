from typing import Dict, List

from maya import cmds

from ..model.joint import Joint as JointModel


class Joint:
    """
    A builder class used for adding joints to the scene

    Attributes
    ----------
    @type joints: List[JointModel]
    @param joints: data representing the joints

    @type linear_modifier: float
    @param linear_modifier: The linear modifier that should be applied to the joints

    @type angle_modifier: float
    @param angle_modifier: The linear modifier that should be applied to the joints

    @type joint_flags: Dict[str, bool]
    @param joint_flags: A mapping used for setting flags that are used to avoid adding the same joint multiple times
    """

    def __init__(
        self, joints: List[JointModel], linear_modifier: float, angle_modifier: float
    ) -> None:
        self.joints = joints
        self.linear_modifier = linear_modifier
        self.angle_modifier = angle_modifier
        self.joint_flags: Dict[str, bool] = {}

        for joint in self.joints:
            self.joint_flags[joint.name] = False

    def add_joint_to_scene(self, joint: JointModel) -> None:
        """
        Adds the given joint to the scene

        @type joint: JointModel
        @param joint: The joint to be added to the scene
        """

        if self.joint_flags[joint.name]:
            return

        in_parent_space = True

        if cmds.objExists(joint.parent_name):
            cmds.select(joint.parent_name)
        else:
            if joint.name != joint.parent_name:
                parent_joint = next(
                    j for j in self.joints if j.name == joint.parent_name
                )
                self.add_joint_to_scene(parent_joint)
            else:
                # this is the first node
                cmds.select(d=True)
                in_parent_space = False

        position = (
            self.linear_modifier * joint.translation.x,
            self.linear_modifier * joint.translation.y,
            self.linear_modifier * joint.translation.z,
        )
        orientation = (
            self.angle_modifier * joint.orientation.x,
            self.angle_modifier * joint.orientation.y,
            self.angle_modifier * joint.orientation.z,
        )
        cmds.joint(
            p=position,
            o=orientation,
            n=joint.name,
            r=in_parent_space,
            a=not in_parent_space,
        )
        self.joint_flags[joint.name] = True

    def process(self) -> None:
        """Starts adding all the provided joints to the scene"""

        for joint in self.joints:
            self.add_joint_to_scene(joint)
