from ..config.rig_logic import RigLogic as RigLogicConfig
from ..util.error import DNAViewerError


class RigLogic:
    """
    A builder class used for adding joints to the scene

    Attributes
    ----------
    @type config: RigLogicConfig
    @param config: The rig logic configuration containing naming options used for creating the execution string that will be called from maya to create the rig logic
    """

    def __init__(self, config: RigLogicConfig = None) -> None:
        self.config = config or RigLogicConfig()

    def build_command(self) -> str:
        """
        Creates the command string that will be executed in maya to create the rig logic

        @rtype: str
        @returns: the string representing the command that needs to be executed
        """

        if self.config.name is None:
            raise DNAViewerError("Must provide a node name for the rig logic")

        if self.config.dna_file_path is None:
            raise DNAViewerError("Must provide a DNA file path")

        string_to_be_executed = self.config.command
        string_to_be_executed += f' -n "{self.config.name}"'
        string_to_be_executed += f' -dfp "{self.config.dna_file_path}"'
        string_to_be_executed += f' -cn "{self.config.control_naming}"'
        string_to_be_executed += f' -jn "{self.config.joint_naming}"'
        string_to_be_executed += f' -bsn "{self.config.blend_shape_naming}"'
        string_to_be_executed += f' -amn "{self.config.animated_map_naming}"; '
        return string_to_be_executed
