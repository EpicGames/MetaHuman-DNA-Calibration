// Copyright Epic Games, Inc. All Rights Reserved.

#pragma once

namespace dna {

enum class DataLayer {
    Descriptor,
    Definition,  // Includes Descriptor
    Behavior,  // Includes Descriptor and Definition
    Geometry,  // Includes Descriptor and Definition
    GeometryWithoutBlendShapes,  // Includes Descriptor and Definition
    AllWithoutBlendShapes,  // Includes everything except blend shapes from Geometry
    All
};

}  // namespace dna
