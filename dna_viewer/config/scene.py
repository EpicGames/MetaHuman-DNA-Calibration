import pathlib
from dataclasses import dataclass, field
from typing import List, Optional

from ..config.character import Character
from .units import AngleUnit, LinearUnit, Unit


@dataclass
class SaveOptions:
    """
    A class used to represent the save options

    Attributes
    ----------
    @type name: str
    @param name: The name of the scene

    @type extension: str
    @param extension: The extension

    @type destination_path: str
    @param destination_path: The location where the scene should be saved, if no value provided it defaults to the current working directory
    """

    name: str = field(default=None)
    extension: str = field(default=None)
    destination_path: str = field(default=str(pathlib.Path.cwd()))

    def get_path(self) -> str:
        """
        Returns the file path

        @rtype: str
        @returns: The file path
        """
        return f"{self.destination_path}/{self.name}.{self.extension}"


@dataclass
class Scene:
    """
    A class used to represent the scene config

    Attributes
    ----------
    @type dna_path: str
    @param dna_path: The location of the DNA file

    @type characters: List[Character]
    @param characters: The list of character configuration objects that need to be processed for the scene

    @type units: Unit
    @param units: The configuration containing the units for the scene

    @type create_new_scene: bool
    @param create_new_scene: A flag representing whether a new should be created when the build process starts

    @type save_options: SaveOptions
    @param save_options: A flag representing whether the created meshes should be assigned to a display layer
    """

    dna_path: str = field(default=None)
    characters: List[Character] = field(default_factory=list)
    units: Unit = field(default_factory=Unit)
    create_new_scene: bool = field(default=True)
    save_options: Optional[SaveOptions] = field(default=None)

    def with_character(self, character: Character) -> "Scene":
        """
        Adds a character to the list of characters that need to be processed

        @type character: Character
        @param character: The character configuration object

        @rtype: Scene
        @returns: The instance of the changed object
        """

        self.characters.append(character)
        return self

    def with_linear_unit(self, unit: LinearUnit) -> "Scene":
        """
        Set the linear unit for the scene

        @type unit: str
        @param unit: The linear unit name

        @rtype: Scene
        @returns: The instance of the changed object
        """

        self.units.linear_unit = unit
        return self

    def with_angle_unit(self, unit: AngleUnit) -> "Scene":
        """
        Set the angle unit for the scene

        @type unit: str
        @param unit: The angle unit name

        @rtype: Scene
        @returns: The instance of the changed object
        """
        self.units.angle_unit = unit
        return self

    def with_create_new_scene(self, create_new_scene: bool) -> "Scene":
        """
        Set the flag representing whether a new should be created when the build process starts

        @type create_new_scene: bool
        @param create_new_scene: The flag representing whether a new should be created when the build process starts

        @rtype: Scene
        @returns: The instance of the changed object
        """

        self.create_new_scene = create_new_scene
        return self

    def with_scene_file_path(
        self,
        name: str = "untitled_scene",
        extension: str = "mb",
        destination_path: str = None,
    ) -> "Scene":
        """
        Set the scene save configuration

        @type name: str
        @param name: The name of the scene

        @type extension: str
        @param extension: The extension

        @type destination_path: str
        @param destination_path: The location where the scene should be saved

        @rtype: Scene
        @returns: The instance of the changed object
        """

        if destination_path is None:
            destination_path = str(pathlib.Path.cwd())

        self.save_options = SaveOptions(
            name=name, extension=extension, destination_path=destination_path
        )
        return self
