import logging

from maya import mel
from maya.cmds import loadPlugin

from ..builder.rig_logic import RigLogic as RigLogicBuilder
from ..config.character import Character
from ..const.naming import RIG_LOGIC_PREFIX
from ..util.error import DNAViewerError


class RigLogic:
    """
    A utility class for adding rig logic to the character
    """

    @staticmethod
    def add_rig_logic(config: Character, character_name: str) -> None:
        """
        Adds a rig logic node if the option is specified in the character configuration.

        @type config: Character
        @param config: The character configuration.

        @type character_name: str
        @param character_name: The name of the character.
        """

        if config.rig_logic_config:
            logging.info("adding rig logic...")
            try:
                loadPlugin("embeddedRL4.mll")
                config.rig_logic_config.with_name(
                    f"{RIG_LOGIC_PREFIX}{character_name}"
                ).with_dna_file_path(config.dna.path)
                mel_command = RigLogicBuilder(config.rig_logic_config).build_command()
                logging.info(f"mel command: {mel_command}")
                mel.eval(mel_command)
            except Exception as e:
                logging.error(
                    "The procedure needed for assembling the rig logic was not found, the plugin needed for this might not be loaded."
                )
                raise DNAViewerError(
                    f"Something went wrong, skipping adding the rig logic... Reason: {e}"
                ) from e
