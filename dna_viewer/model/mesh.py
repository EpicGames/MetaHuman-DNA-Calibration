from dataclasses import dataclass, field
from typing import List

from ..model.geometry import Point3


@dataclass
class Mesh:
    """
    A model class for holding data needed in the mesh building process

    Attributes
    ----------
    @type dna_vertex_positions: List[Point3]
    @param dna_vertex_positions: Data representing the positions of the vertices

    @type dna_vertex_layout_positions: List[int]
    @param dna_vertex_layout_positions: Data representing layout position indices of vertices

    @type dna_vertex_layout_normals: List[Point3]
    @param dna_vertex_layout_normals: Data representing layout normals of vertices

    @type polygon_faces: List[int]
    @param polygon_faces: List of lengths of vertex layout indices

    @type polygon_connects: List[int]
    @param polygon_connects: List of vertex layout position indices

    @type vertex_normals: List[Point3]
    @param vertex_normals: List of vertex layout normal indices

    @type derived_mesh_names: List[str]
    @param derived_mesh_names: List of mesh names
    """

    dna_vertex_positions: List[Point3] = field(default_factory=list)
    dna_vertex_layout_positions: List[int] = field(default_factory=list)
    dna_vertex_layout_normals: List[Point3] = field(default_factory=list)
    polygon_faces: List[int] = field(default_factory=list)
    polygon_connects: List[int] = field(default_factory=list)
    vertex_normals: List[Point3] = field(default_factory=list)
    derived_mesh_names: List[str] = field(default_factory=list)
