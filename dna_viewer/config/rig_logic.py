from dataclasses import dataclass, field

from ..const.naming import BLEND_SHAPE_NAME_POSTFIX, FRM_MULTIPLIERS_NAME


@dataclass
class RigLogic:
    """
    A class used to represent the rig logic naming configuration

    Attributes
    ----------
    @type command: str
    @param command: The command used to start creating the rig logic using the plugin

    @type name: str
    @param name: The name of the rig logic node

    @type dna_file_path: str
    @param dna_file_path: The location of the DNA file

    @type control_naming: str
    @param control_naming: The naming pattern of controls

    @type joint_naming: str
    @param joint_naming: The naming pattern of joints

    @type blend_shape_naming: str
    @param blend_shape_naming: The naming pattern of blend shapes

    @type animated_map_naming: str
    @param animated_map_naming: The naming pattern of animated maps
    """

    command: str = field(default="createEmbeddedNodeRL4")
    name: str = field(default="")
    dna_file_path: str = field(default="")
    control_naming: str = field(default="<objName>.<attrName>")
    joint_naming: str = field(default="<objName>.<attrName>")
    blend_shape_naming: str = field(
        default=f"<objName>{BLEND_SHAPE_NAME_POSTFIX}.<attrName>"
    )
    animated_map_naming: str = field(
        default=f"{FRM_MULTIPLIERS_NAME}.<objName>_<attrName>"
    )

    def with_name(self, name: str) -> "RigLogic":
        """
        Set the name of the rig logic node

        @type name: str
        @param name: The name of the rig logic node

        @rtype: RigLogic
        @returns: The instance of the changed object
        """

        self.name = name
        return self

    def with_dna_file_path(self, dna_file_path: str) -> "RigLogic":
        """
        Set the location of the DNA file

        @type dna_file_path: str
        @param dna_file_path: The location of the DNA file

        @rtype: RigLogic
        @returns: The instance of the changed object
        """

        self.dna_file_path = dna_file_path
        return self

    def with_control_naming(self, control_naming: str) -> "RigLogic":
        """
        Set the naming pattern of controls

        @type control_naming: str
        @param control_naming: The naming pattern of controls

        @rtype: RigLogic
        @returns: The instance of the changed object
        """

        self.control_naming = control_naming
        return self

    def with_joint_naming(self, joint_naming: str) -> "RigLogic":
        """
        Set the naming pattern of joints

        @type joint_naming: str
        @param joint_naming: The naming pattern of joints

        @rtype: RigLogic
        @returns: The instance of the changed object
        """

        self.joint_naming = joint_naming
        return self

    def with_blend_shape_naming(self, blend_shape_naming: str) -> "RigLogic":
        """
        Set the naming pattern of blend shapes

        @type blend_shape_naming: str
        @param blend_shape_naming: The naming pattern of blend shapes

        @rtype: RigLogic
        @returns: The instance of the changed object
        """

        self.blend_shape_naming = blend_shape_naming
        return self

    def with_animated_map_naming(self, animated_map_naming: str) -> "RigLogic":
        """
        Set the naming pattern of animated maps

        @type animated_map_naming: str
        @param animated_map_naming: The naming pattern of animated maps

        @rtype: RigLogic
        @returns: The instance of the changed object
        """

        self.animated_map_naming = animated_map_naming
        return self
