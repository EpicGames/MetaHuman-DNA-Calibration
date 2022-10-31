from dataclasses import dataclass, field
from typing import List, Optional

from ..model.geometry import UV, Layout, Point3


@dataclass
class FaceVertex:
    """
    A model class for holding data about face vertices

    Attributes
    ----------
    @type position: Point3
    @param position: Represents position as a point in a 3 dimensional space

    @type texture_coordinate: UV
    @param texture_coordinate: Represents the UV values of the texture coordinate

    @type normal: Point3
    @param normal: Represents the normal as a 3 dimensional vector

    @type layout: Layout
    @param layout: The layout this vertex is contained within

    @type skin_weight_values: List[float]
    @param skin_weight_values: The list of the skin weight values

    @type skin_weight_joint_indices: List[int]
    @param skin_weight_joint_indices: List of the skin weight joint indices
    """

    position: Optional[Point3] = field(default=None)
    texture_coordinate: Optional[UV] = field(default=None)
    normal: Optional[Point3] = field(default=None)
    layout: Optional[Layout] = field(default=None)
    skin_weight_values: List[float] = field(default_factory=list)
    skin_weight_joint_indices: List[int] = field(default_factory=list)
