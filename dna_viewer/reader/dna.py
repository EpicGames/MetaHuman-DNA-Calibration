import logging
from typing import Optional

from ..model.behavior import Behavior as BehaviorModel
from ..model.definition import Definition as DefinitionModel
from ..model.descriptor import Descriptor as DescriptorModel
from ..model.dna import DNA as DNAModel
from ..model.geometry import Geometry as GeometryModel
from ..model.geometry import Mesh
from ..reader.behavior import Behavior as BehaviorReader
from ..reader.definition import Definition as DefinitionReader
from ..reader.descriptor import Descriptor as DescriptorReader
from ..reader.geometry import Geometry as GeometryReader
from ..util.reader import Reader
from ..util.reference import set_geometry_reader


def load_dna(dna_path: str = None) -> DNAModel:
    return DNA.load_dna(path=dna_path)


class DNA:
    """
    A class used to represent the character config
    """

    @staticmethod
    def load_dna(path: str) -> DNAModel:
        """
        Loads in the DNA from the given file path

        @type dna: DNAModel
        @param dna: The DNA data

        @rtype: DNA
        @returns: An object representing the DNA data
        """

        logging.info(f"loading DNA {path}")
        reader = DNA(path)
        return reader.read()

    def __init__(self, path: str) -> None:
        self.stream_reader = Reader.create_stream_reader(path)
        self.path = path
        self.dna: Optional[DNAModel] = None

    def read(self) -> DNAModel:
        """
        Reads in the base DNA data as well as the meshes

        @rtype: DNAModel
        @returns: The DNA data
        """

        self.dna = DNAModel(path=self.path)
        self.read_base()
        self.load_meshes()
        return self.dna

    def read_base(self) -> None:
        """Reads in the base DNA data without the mesh data"""

        self.dna.descriptor = self.read_descriptor()
        self.dna.definition = self.read_definition()
        self.dna.behavior = self.read_behavior()
        self.dna.geometry = GeometryModel()

    def load_meshes(self) -> None:
        """Loads all the mesh data"""

        for lod in range(self.dna.descriptor.lod_count):
            for mesh_index in self.dna.definition.meshes.indices_for_lod[lod]:
                self.dna.geometry.meshes[mesh_index] = self.load_mesh(
                    mesh_index=mesh_index
                )

    def load_mesh(self, mesh_index: int) -> Mesh:
        """
        Loads geometry data for a single mesh at the given index

        @type mesh_index: int
        @param mesh_index: mesh index

        @rtype: Mesh
        @returns: mesh data
        """

        return self.read_geometry_for_mesh_index(mesh_index=mesh_index)

    def read_descriptor(self) -> DescriptorModel:
        """
        Reads the descriptor part of the DNA

        @rtype: DescriptorModel
        @returns: Descriptor data from the DNA
        """

        return DescriptorReader(self.stream_reader).read()

    def read_definition(self) -> DefinitionModel:
        """
        Reads the definition part of the DNA

        @rtype: DefinitionModel
        @returns: Definition data from the DNA
        """

        return DefinitionReader(self.stream_reader).read()

    def read_behavior(self) -> BehaviorModel:
        """
        Reads the descriptor part of the DNA

        @rtype: DescriptorModel
        @returns: Descriptor data from the DNA
        """

        return BehaviorReader(self.stream_reader).read()

    def read_geometry_for_mesh_index(self, mesh_index: int) -> Mesh:
        """
        Reads the geometry for a given mesh index

        @type mesh_index: int
        @param mesh_index: mesh index

        @rtype: Mesh
        @returns: Mesh data
        """

        reader = GeometryReader(stream_reader=self.stream_reader, mesh_index=mesh_index)
        set_geometry_reader(dna_path=self.path, geometry_reader=reader)
        return reader.read()
