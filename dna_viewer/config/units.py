from dataclasses import dataclass, field
from enum import Enum


class LinearUnit(Enum):
    """
    An enum used to represent the unit used for linear representation.

    Attributes
    ----------
    @cm: using cm as unit
    @m: using m as unit
    """

    cm = 0
    m = 1


class AngleUnit(Enum):
    """
    An enum used to represent the unit used for angle representation.

    Attributes
    ----------
    @degree: using degree as unit
    @radian: using radian as unit
    """

    degree = 0
    radian = 1


@dataclass
class Unit:
    """
    A class used to represent the configuration of units in the scene

    Attributes
    ----------
    @type linear_unit: LinearUnit
    @param linear_unit: The linear unit value

    @type angle_unit: AngleUnit
    @param angle_unit: The angle unit value
    """

    linear_unit: LinearUnit = field(default=None)
    angle_unit: AngleUnit = field(default=None)
