from math import pi

from ..config.units import AngleUnit, LinearUnit
from ..util.error import DNAViewerError


class Conversion:
    """
    A utility class containing methods for converting and calculating units
    """

    @staticmethod
    def calculate_linear_modifier(
        unit: LinearUnit, dna_unit: LinearUnit = None
    ) -> float:
        """
        A method used for calculating the value (linear modifier) which the transforms will be multiplied with.
        If the chosen unit is not the same as the one from the DNA file a multiplier will be calculated. Otherwise it returns 1.

        @type unit: LinearUnit
        @param unit: Can be m (meter) and cm (centimeter).

        @type dna_unit: LinearUnit
        @param dna_unit: The linear unit specified in the DNA file (default value is None).

        @rtype: float
        @returns: A multiplier needed for conversion between different units.
        """

        if dna_unit is None:
            return 1

        if unit != dna_unit:
            if unit == LinearUnit.m:
                return 0.01
            if unit == LinearUnit.cm:
                return 100
        return 1

    @staticmethod
    def calculate_angle_modifier(unit: AngleUnit, dna_unit: AngleUnit = None) -> float:
        """
        A method used for calculating the value (angle modifier) which the angles will be multiplied with. If the
        chosen unit is not the same as the one from the DNA file a multiplier will be calculated. Otherwise,
        it returns 1.

        @type unit: AngleUnit
        @param unit: Can be degree and radian.

        @type dna_unit: AngleUnit
        @param dna_unit: The angle unit specified in the DNA file (default value is None).

        @rtype: float
        @returns: A multiplier needed for conversion between different units.
        """

        if dna_unit is None:
            return 1

        if unit != dna_unit:
            if unit == AngleUnit.degree:
                return 180 / pi
            if unit == AngleUnit.radian:
                return pi / 180
        return 1

    @staticmethod
    def get_linear_unit_from_int(value: int) -> LinearUnit:
        """
        Returns an enum from an int value.
        0 -> cm
        1 -> m

        @type value: int
        @param value: The value that the enum is mapped to.

        @rtype: LinearUnit
        @returns: LinearUnit.cm or LinearUnit.m
        """

        if value == 0:
            return LinearUnit.cm
        if value == 1:
            return LinearUnit.m
        raise DNAViewerError(f"Unknown linear unit set in DNA file! value {value}")

    @staticmethod
    def get_angle_unit_from_int(value: int) -> AngleUnit:
        """
        Returns an enum from an int value.
        0 -> degree
        1 -> radian

        @type value: int
        @param value: The value that the enum is mapped to.

        @rtype: AngleUnit
        @returns: AngleUnit.degree or AngleUnit.radian
        """

        if value == 0:
            return AngleUnit.degree
        if value == 1:
            return AngleUnit.radian
        raise DNAViewerError(f"Unknown angle unit set in DNA file! value {value}")
