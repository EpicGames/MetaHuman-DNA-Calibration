from typing import Dict, List, Optional, Tuple

from dna import BinaryStreamReader as DNAReader

from ..dnalib.layer import Layer


class Descriptor:
    """
    A class used for reading and accessing the descriptor part of the DNA file

    Attributes
    ----------

    @type name: str
    @param name: The name of the character

    @type archetype: int
    @param archetype: A value that represents the archetype of the character

    @type gender: int
    @param gender: A value that represents the gender of the character

    @type age: int
    @param age: The age of the character

    @type metadata: Dict[str, str]
    @param metadata: Metadata stored for the character

    @type translation_unit: int
    @param translation_unit: The translation unit that was used for creating the character

    @type rotation_unit: int
    @param rotation_unit: The translation unit that was used for creating the character

    @type coordinate_system: Tuple[int, int, int]
    @param coordinate_system: A tuple representing the coordinate system

    @type lod_count: int
    @param lod_count: The number of LODs for the characters

    @type db_max_lod:int
    @param db_max_lod: A LOD constraint representing the greatest LOD we wish wish to produce (ie. if the value is n, the potential LODs are 0, 1, .. n-1)

    @type db_complexity: str
    @param db_complexity: Will be used in future

    @type db_name: str
    @param db_name: DB identifier
    """

    def __init__(self, reader: DNAReader, layers: Optional[List[Layer]]) -> None:
        self.reader = reader
        self.layers = layers
        self.name: Optional[str] = None
        self.archetype: Optional[int] = None
        self.gender: Optional[int] = None
        self.age: Optional[int] = None
        self.metadata: Dict[str, str] = {}

        self.translation_unit: Optional[int] = None
        self.rotation_unit: Optional[int] = None

        self.coordinate_system: Optional[Tuple[int, int, int]] = None

        self.lod_count: Optional[int] = None
        self.db_max_lod: Optional[int] = None
        self.db_complexity: Optional[str] = None
        self.db_name: Optional[str] = None
        self.descriptor_read = False

    def start_read(self) -> None:
        self.descriptor_read = False

    def is_read(self) -> bool:
        return self.descriptor_read

    def layer_enabled(self, layer: Layer) -> bool:
        return layer in self.layers or Layer.all in self.layers

    def read(self) -> None:
        """
        Starts reading in the descriptor part of the DNA

        @rtype: DescriptorModel
        @returns: the instance of the created descriptor model
        """

        if not self.descriptor_read and self.layer_enabled(Layer.descriptor):
            self.descriptor_read = True
            self.add_basic_data()
            self.add_metadata()
            self.add_geometry_data()
            self.add_db_data()

    def add_basic_data(self) -> None:
        """Reads in the character name, archetype, gender and age"""

        self.name = self.reader.getName()
        self.archetype = self.reader.getArchetype()
        self.gender = self.reader.getGender()
        self.age = self.reader.getAge()

    def add_metadata(self) -> None:
        """Reads in the metadata provided from the DNA file"""

        for i in range(self.reader.getMetaDataCount()):
            key = self.reader.getMetaDataKey(i)
            self.metadata[key] = self.reader.getMetaDataValue(key)

    def add_geometry_data(self) -> None:
        """Sets the translation unit, rotation unit, and coordinate system from the DNA file"""

        self.translation_unit = self.reader.getTranslationUnit()
        self.rotation_unit = self.reader.getRotationUnit()
        coordinate_system = self.reader.getCoordinateSystem()
        self.coordinate_system = (
            coordinate_system.xAxis,
            coordinate_system.yAxis,
            coordinate_system.zAxis,
        )

    def add_db_data(self) -> None:
        """Reads in the db data from the DNA file"""

        self.lod_count = self.reader.getLODCount()
        self.db_max_lod = self.reader.getDBMaxLOD()
        self.db_complexity = self.reader.getDBComplexity()
        self.db_name = self.reader.getDBName()
