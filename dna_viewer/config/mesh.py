from dataclasses import dataclass, field
from typing import Optional


@dataclass
class Mesh:
    """
    A class used to represent the mesh configuration

    Attributes
    ----------
    @type mesh_index: int
    @param mesh_index: The index of the mesh

    @type linear_modifier: float
    @param linear_modifier: The linear modifier that needs to be applied to the character
    """

    mesh_index: Optional[int] = field(default=None)
    linear_modifier: Optional[float] = field(default=None)
