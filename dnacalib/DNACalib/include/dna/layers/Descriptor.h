// Copyright Epic Games, Inc. All Rights Reserved.

#pragma once

namespace dna {

enum class Archetype {
    asian,
    black,
    caucasian,
    hispanic,
    alien,
    other
};

enum class Gender {
    male,
    female,
    other
};

enum class TranslationUnit {
    cm,
    m
};

enum class RotationUnit {
    degrees,
    radians
};

enum class Direction {
    left,
    right,
    up,
    down,
    front,
    back
};

struct CoordinateSystem {
    Direction xAxis;
    Direction yAxis;
    Direction zAxis;
};

}  // namespace dna
