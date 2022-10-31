import logging
from typing import Dict, List, Optional

from maya.api.OpenMaya import MObject

from ..config.character import Character as CharacterConfig
from ..model.dna import DNA
from ..util.character_creator import CharacterCreator
from ..util.error import DNAViewerError


class CharacterBuildResult:
    """
    A class used for returning data after finishing the character build process

    Attributes
    ----------
    @type nodes: Dict[int, List[MObject]]
    @param nodes: The PyNode objects created in the build process by LOD number
    """

    nodes: Dict[int, List[MObject]] = {}

    @staticmethod
    def create(nodes: Dict[int, List[MObject]]) -> "CharacterBuildResult":
        """
        Character creator method returning a character build result object

        @type nodes: Dict[int, List[MObject]]
        @param nodes: The PyNode objects created in the build process by LOD number
        """

        result = CharacterBuildResult()
        result.nodes = nodes
        return result


class Character:
    """
    A builder class used for building the character

    Attributes
    ----------
    @type config: CharacterConfig
    @param config: The character configuration options used for building the character
    """

    def __init__(self, dna: DNA, config: Optional[CharacterConfig] = None) -> None:
        self.dna = dna
        self.config = config or CharacterConfig()

    def build(self) -> CharacterBuildResult:
        """Builds the character"""

        if self.config.dna is None:
            raise DNAViewerError("must provide DNA path")

        creator = CharacterCreator(config=self.config, dna=self.dna)

        logging.info("******************************")
        logging.info(creator.character_name)
        logging.info("******************************")

        creator.create_character_node()
        creator.add_joints_to_character()
        creator.create_ctrl_attributes_on_joint()
        creator.create_animated_map_attributes()
        creator.add_key_frames()
        creator.create_geometry_node()
        creator.create_rig_node()
        creator.create_character_meshes()

        creator.add_gui()
        creator.add_analog_gui()
        creator.add_rig_logic_node()
        creator.run_additional_assembly_script()

        logging.info(f"{creator.character_name} built successfully!")
        return CharacterBuildResult.create(nodes=creator.meshes)
