from dataclasses import dataclass, field

from ..model.geometry import Point3


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
