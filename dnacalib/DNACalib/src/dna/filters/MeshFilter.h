// Copyright Epic Games, Inc. All Rights Reserved.

#pragma once

#include "dna/TypeDefs.h"

#include <cstdint>

namespace dna {

struct RawDefinition;

class MeshFilter {
    public:
        explicit MeshFilter(MemoryResource* memRes_);
        void configure(std::uint16_t meshCount, UnorderedSet<std::uint16_t> allowedMeshIndices);
        void apply(RawDefinition& dest);
        bool passes(std::uint16_t index) const;

    private:
        MemoryResource* memRes;
        UnorderedSet<std::uint16_t> passingIndices;
        UnorderedMap<std::uint16_t, std::uint16_t> remappedIndices;

};

}  // namespace dna
