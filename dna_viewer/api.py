from typing import Optional

from .builder.builder import Builder, BuildResult
from .builder.config import Config, RigConfig
from .builder.rig_builder import RigBuilder
from .dnalib.dnalib import DNA


def build_rig(dna: DNA, config: RigConfig) -> BuildResult:
    """
    Used for assembling the rig with provided configuration.

    @type config: DNA
    @param config: Instance of DNA

    @type config: Config
    @param config: Instance of configuration

    @rtype: BuildResult
    @returns: The object representing result of build
    """

    return RigBuilder(dna, config).build()


def build_meshes(dna: DNA, config: Optional[Config] = None) -> BuildResult:
    """
    Starts the mesh building process with the provided configuration.

    @type config: DNA
    @param config: Instance of DNA

    @type config: Config
    @param config: Instance of configuration

    @rtype: BuildResult
    @returns: The object representing result of build
    """
    if config is None:
        config = Config()

    return Builder(dna, config).build()
