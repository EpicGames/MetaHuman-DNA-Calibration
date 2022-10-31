from typing import Optional

from dna import BinaryStreamReader

from ..model.descriptor import Descriptor as DescriptorModel


class Descriptor:
    """
    A class used for reading the descriptor part of the DNA file

    Attributes
    ----------
    @type reader: BinaryStreamReader
    @param reader: The stream reader being used

    @type descriptor: DescriptorModel
    @param descriptor: The object that holds the descriptor data read from the DNA file
    """

    def __init__(self, stream_reader: BinaryStreamReader) -> None:
        self.reader = stream_reader
        self.descriptor: Optional[DescriptorModel] = None

    def read(self) -> DescriptorModel:
        """
        Starts reading in the descriptor part of the DNA

        @rtype: DescriptorModel
        @returns: the instance of the created descriptor model
        """

        self.descriptor = DescriptorModel()

        self.add_basic_data()
        self.add_metadata()
        self.add_geometry_data()
        self.add_db_data()

        return self.descriptor

    def add_basic_data(self) -> None:
        """Reads in the character name, archetype, gender and age"""

        self.descriptor.name = self.reader.getName()
        self.descriptor.archetype = self.reader.getArchetype()
        self.descriptor.gender = self.reader.getGender()
        self.descriptor.age = self.reader.getAge()

    def add_metadata(self) -> None:
        """Reads in the metadata provided from the DNA file"""

        for i in range(self.reader.getMetaDataCount()):
            self.descriptor.metadata[
                self.reader.getMetaDataKey(i)
            ] = self.reader.getMetaDataValue(self.reader.getMetaDataKey(i))

    def add_geometry_data(self) -> None:
        """Sets the translation unit, rotation unit, and coordinate system from the DNA file"""

        self.descriptor.translation_unit = self.reader.getTranslationUnit()
        self.descriptor.rotation_unit = self.reader.getRotationUnit()
        coordinate_system = self.reader.getCoordinateSystem()
        self.descriptor.coordinate_system = (
            coordinate_system.xAxis,
            coordinate_system.yAxis,
            coordinate_system.zAxis,
        )

    def add_db_data(self) -> None:
        """Reads in the db data from the DNA file"""

        self.descriptor.lod_count = self.reader.getLODCount()
        self.descriptor.db_max_lod = self.reader.getDBMaxLOD()
        self.descriptor.db_complexity = self.reader.getDBComplexity()
        self.descriptor.db_name = self.reader.getDBName()
