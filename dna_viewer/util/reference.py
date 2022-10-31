from typing import Dict, List

from ..reader.geometry import Geometry


def get_geometry_reader(mesh_index: int, dna_path: str = None) -> Geometry:
    """
    Gets a Geometry reader for a given mesh index and a dna_file path.

    @type mesh_index: int
    @param mesh_index: The mesh index

    @type dna_path: str
    @param dna_path: The path of the DNA file

    @rtype: Geometry
    @returns: A geometry reader stored in the Reference class object for the given mesh index and DNA
    """

    return Reference.get_geometry_reader(mesh_index=mesh_index, dna_path=dna_path)


def set_geometry_reader(dna_path: str, geometry_reader: Geometry) -> None:
    """
    Adds a new geometry reader to the the references mapped to the DNA file path.

    @type dna_path: str
    @param dna_path: The path of the DNA file

    @type geometry_reader: Geometry
    @param geometry_reader: The geometry stream reader
    """

    return Reference.set_geometry_reader(
        dna_path=dna_path, geometry_reader=geometry_reader
    )


class Reference:
    """
    A class used for storing and retrieving geometry readers.
    """

    geometry_readers: Dict[str, List[Geometry]] = {}

    @staticmethod
    def get_geometry_reader(mesh_index: int, dna_path: str = None) -> Geometry:
        """
        Gets a Geometry reader for a given mesh index and a dna_file path.

        @type mesh_index: int
        @param mesh_index: The mesh index

        @type dna_path: str
        @param dna_path: The path of the DNA file

        @rtype: Geometry
        @returns: A stored geometry reader for the given mesh index and DNA
        """

        if dna_path is None:  # defaults to first one
            geometry_readers_for_dna = next(iter(Reference.geometry_readers.values()))
            return geometry_readers_for_dna[mesh_index]
        return Reference.geometry_readers[dna_path][mesh_index]

    @staticmethod
    def set_geometry_reader(dna_path: str, geometry_reader: Geometry) -> None:
        """
        Adds a mapping value of a geometry reader to the DNA file path.

        @type dna_path: str
        @param dna_path: The path of the DNA file

        @type geometry_reader: Geometry
        @param geometry_reader: The geometry reader that should be added to the mapping.
        """

        if dna_path not in Reference.geometry_readers:
            Reference.geometry_readers[dna_path] = []

        Reference.geometry_readers[dna_path].append(geometry_reader)
