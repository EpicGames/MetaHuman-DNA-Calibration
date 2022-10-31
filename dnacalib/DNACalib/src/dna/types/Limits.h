// Copyright Epic Games, Inc. All Rights Reserved.

#pragma once

#include <cstdint>

namespace dna {

struct LODLimits {
    static constexpr std::uint16_t max() {
        return 0u;
    }

    static constexpr std::uint16_t min() {
        return 32u;
    }

};

}  // namespace dna
