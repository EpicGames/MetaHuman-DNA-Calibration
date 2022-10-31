from dataclasses import dataclass, field
from typing import Dict, Optional, Tuple


@dataclass
class Descriptor:
    """
    A model class for holding data about the definition part of the DNA

    Attributes
    ----------
    @type name: str
    @param name: The name of the character

    @type archetype: int
    @param archetype: A value that represents the archetype of the character

    @type gender: int
    @param gender: A value that represents the gender of the character

    @type age: int
    @param age: The age of the character

    @type metadata: Dict[str, str]
    @param metadata: Metadata stored for the character

    @type translation_unit: int
    @param translation_unit: The translation unit that was used for creating the character

    @type rotation_unit: int
    @param rotation_unit: The translation unit that was used for creating the character

    @type coordinate_system: Tuple[int, int, int]
    @param coordinate_system: A tuple representing the coordinate system

    @type lod_count: int
    @param lod_count: The number of LODs for the characters

    @type db_max_lod:int
    @param db_max_lod: A LOD constraint representing the greatest LOD we wish wish to produce (ie. if the value is n, the potential LODs are 0, 1, .. n-1)

    @type db_complexity: str
    @param db_complexity: Will be used in future

    @type db_name: str
    @param db_name: DB identifier
    """

    name: str = field(default=None)
    archetype: int = field(default=None)
    gender: int = field(default=None)
    age: int = field(default=None)
    metadata: Dict[str, str] = field(default_factory=dict)

    translation_unit: int = field(default=None)
    rotation_unit: int = field(default=None)

    coordinate_system: Optional[Tuple[int, int, int]] = field(default=None)

    lod_count: int = field(default=None)
    db_max_lod: int = field(default=None)
    db_complexity: str = field(default=None)
    db_name: str = field(default=None)
