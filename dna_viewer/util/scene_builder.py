import logging
from os import makedirs
from pathlib import Path
from typing import List

from maya import cmds

from ..config.scene import SaveOptions
from ..config.units import Unit
from ..model.dna import DNA


class SceneBuilder:
    """
    A utility class containing methods needed for building the maya scene
    """

    LOD_PREFIX = "LOD_"

    @staticmethod
    def add_display_layers(display_layers_needed: List[int]) -> None:
        """
        Creates a display layer for each value of the given list if it does not exist

        @type display_layers_needed: List[int]
        @param display_layers_needed: A list of lod numbers that need a display layer created for them
        """

        for lod in display_layers_needed:
            if not cmds.objExists(f"{SceneBuilder.LOD_PREFIX}{lod}"):
                cmds.createDisplayLayer(name=f"{SceneBuilder.LOD_PREFIX}{lod}")

    @staticmethod
    def save_scene(save_options: SaveOptions) -> None:
        """
        Saves the scene if save options are provided.

        @type save_options: SaveOptions
        @param save_options: The part configuration concerning how the scene should be saved
        """

        path = save_options.get_path()
        logging.info(f"Saving scene to: {path}")
        makedirs(Path(path).parent, exist_ok=True)
        cmds.file(rename=path)
        if save_options.extension == "ma":
            cmds.file(save=True, type="mayaAscii")
        elif save_options.extension == "mb":
            cmds.file(save=True, type="mayaBinary")
        else:
            cmds.file(save=True)

    @staticmethod
    def set_units(dna: DNA, units: Unit) -> None:
        """
        Sets the linear and angle units of the scene if provided as a parameter, otherwise defaults the values provided in the DNA file.

        @type units: Unit
        @param units: The configuration that contains the linear and the angle unit.
        """

        linear_unit = units.linear_unit if units.linear_unit else dna.get_linear_unit()
        angle_unit = units.angle_unit if units.angle_unit else dna.get_angle_unit()

        cmds.currentUnit(linear=linear_unit.name, angle=angle_unit.name)

    @staticmethod
    def new_scene() -> None:
        """
        Creates a new maya scene.
        """

        cmds.file(force=True, new=True)
