// Copyright Epic Games, Inc. All Rights Reserved.

#pragma once

#include "dna/DataLayer.h"
#include "dna/utils/ScopedEnumEx.h"

namespace dna {

enum class DataLayerBitmask {
    Descriptor = 1,
    Definition = 2,
    Behavior = 4,
    GeometryBlendShapesOnly = 8,
    GeometryRest = 16,
};

inline DataLayerBitmask computeDataLayerBitmask(DataLayer layer) {
    DataLayerBitmask result = DataLayerBitmask::Descriptor;
    if (layer == DataLayer::Definition) {
        result |= DataLayerBitmask::Definition;
    } else if (layer == DataLayer::Behavior) {
        result |= DataLayerBitmask::Definition;
        result |= DataLayerBitmask::Behavior;
    } else if (layer == DataLayer::Geometry) {
        result |= DataLayerBitmask::Definition;
        result |= DataLayerBitmask::GeometryBlendShapesOnly;
        result |= DataLayerBitmask::GeometryRest;
    } else if (layer == DataLayer::GeometryWithoutBlendShapes) {
        result |= DataLayerBitmask::Definition;
        result |= DataLayerBitmask::GeometryRest;
    } else if (layer == DataLayer::AllWithoutBlendShapes) {
        result |= DataLayerBitmask::Definition;
        result |= DataLayerBitmask::Behavior;
        result |= DataLayerBitmask::GeometryRest;
    } else if (layer == DataLayer::All) {
        result |= DataLayerBitmask::Definition;
        result |= DataLayerBitmask::Behavior;
        result |= DataLayerBitmask::GeometryBlendShapesOnly;
        result |= DataLayerBitmask::GeometryRest;
    }
    return result;
}

}  // namespace dna
