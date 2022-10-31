// Copyright Epic Games, Inc. All Rights Reserved.

#pragma once

#include "dnacalib/TypeDefs.h"

#include <cstdint>

namespace dnac {

struct RawDefinition;

class AnimatedMapFilter {
    public:
        explicit AnimatedMapFilter(MemoryResource* memRes_);
        void configure(std::uint16_t animatedMapCount, UnorderedSet<std::uint16_t> allowedAnimatedMapIndices);
        void apply(RawDefinition& dest);
        bool passes(std::uint16_t index) const;

    private:
        MemoryResource* memRes;
        UnorderedSet<std::uint16_t> passingIndices;
        UnorderedMap<std::uint16_t, std::uint16_t> remappedIndices;

};

}  // namespace dnac
