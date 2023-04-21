from dataclasses import dataclass, field
from typing import Dict, List


@dataclass
class Point3:
    """
    A model class for representing a 3 dimensional point

    Attributes
    ----------
    @type x: float
    @param x: The value of x

    @type y: float
    @param y: The value of y

    @type z: float
    @param z: The value of z
    """

    x: float = field(default=0.0)
    y: float = field(default=0.0)
    z: float = field(default=0.0)


@dataclass
class UV:
    """
    A model class for holding data about the UV

    Attributes
    ----------
    @type u: float
    @param u: The value of u

    @type v: float
    @param v: The value of v
    """

    u: float = field(default=0.0)
    v: float = field(default=0.0)


@dataclass
class Layout:
    """
    A model class for holding data about a single layout

    Attributes
    ----------
    @type position_index: int
    @param position_index: An index representing position

    @type texture_coordinate_index: int
    @param texture_coordinate_index: A value representing the texture coordinate index
    """

    position_index: int = field(default=0)
    texture_coordinate_index: int = field(default=0)


@dataclass
class Topology:
    """
    A model class for holding data about the topology

    Attributes
    ----------
    @type positions: List[Point3]
    @param positions: List of points in space representing the positions

    @type texture_coordinates: List[UV]
    @param texture_coordinates: List of UVs representing the positions

    @type layouts: List[Layout]
    @param layouts: The list of Layout mappings

    @type face_vertex_layouts: List[List[int]]
    @param face_vertex_layouts: List of face vertex layout indices by face index
    """

    positions: List[Point3] = field(default_factory=list)
    texture_coordinates: List[UV] = field(default_factory=list)
    layouts: List[Layout] = field(default_factory=list)
    face_vertex_layouts: List[List[int]] = field(default_factory=list)


@dataclass
class BlendShape:
    """
    A model class for holding data about the blend shape

    Attributes
    ----------
    @type channel: int
    @param channel: The index pointing to the blend shape name

    @type deltas: Dict[int, Point3]
    @param deltas: A mapping of blend shape indices to the coordinate differences that are made by the blend shape
    """

    channel: int = field(default=None)
    deltas: Dict[int, Point3] = field(default_factory=dict)


@dataclass
class SkinWeightsData:
    """
    A model class for holding data about the skin weights

    Attributes
    ----------

    @type values: List[List[float]]
    @param values: The skin weight values per vertex index

    @type joint_indices: List[List[int]]
    @param joint_indices: The joint indces per vertex index
    """

    values: List[List[float]] = field(default_factory=list)
    joint_indices: List[List[int]] = field(default_factory=list)


@dataclass
class Mesh:
    """
    A model class for holding data about the mesh

    Attributes
    ----------
    @type name: str
    @param name: The name of the mesh

    @type topology: Topology
    @param topology: Data containing the topology of the mesh

    @type skin_weights: SkinWeightsData
    @param skin_weights: Data representing skin weights

    @type blend_shapes: List[BlendShape]
    @param blend_shapes: The list of blend shapes for the mesh
    """

    name: str = field(default=None)
    topology: Topology = field(default_factory=Topology)
    skin_weights: SkinWeightsData = field(default_factory=SkinWeightsData)
    blend_shapes: List[BlendShape] = field(default_factory=list)


@dataclass
class Joint:
    """
    A model class for holding data about a single joint

    Attributes
    ----------
    @type name: str
    @param name: The name of the joint

    @type translation: Point3
    @param translation: A point in 3 dimensional space which represents the translation of the joint

    @type orientation: Point3
    @param orientation: A point in 3 dimensional space which represents the orientation of the joint

    @type parent_name: str
    @param parent_name: The name of the parent joint
    """

    name: str = field(default=None)
    translation: Point3 = field(default_factory=Point3)
    orientation: Point3 = field(default_factory=Point3)
    parent_name: str = field(default=None)
