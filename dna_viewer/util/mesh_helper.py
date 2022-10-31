import logging

from ..model.dna import DNA
from ..util.error import DNAViewerError
from ..util.mesh import get_mesh_indices_containing_string, get_mesh_lods


def print_meshes(dna: DNA) -> None:
    """
    Prints the mesh names grouped by lod.

    @type dna: DNA
    @param dna: Instance of DNA.
    """

    mesh_indices_by_lods = get_mesh_lods(dna)

    for lod, mesh_indices in enumerate(mesh_indices_by_lods):
        logging.info(f"LOD_{lod}")
        for mesh_index in mesh_indices:
            logging.info(f"\t{mesh_index}->{dna.get_mesh_name(mesh_index)}")


def print_mesh_indices_containing_string(
    mesh_name_part: str, lod: int, dna: DNA
) -> None:
    """
    Prints the mesh indices that contain a search string.

    @type mesh_name_part: str
    @param mesh_name_part: The search string.

    @type lod: int
    @param lod: The lod where the search will be done.

    @type dna: DNA
    @param dna: Instance of DNA.
    """

    try:
        results = get_mesh_indices_containing_string(mesh_name_part, lod, dna)
        for mesh_index in results:
            logging.info(f"\t{dna.get_mesh_name(mesh_index)}->{mesh_index}")
    except DNAViewerError as e:
        logging.error(e)
        raise DNAViewerError(e) from e
    except Exception as e:
        logging.error(f"Unhandled exception, {e}")
        raise DNAViewerError(e) from e
