// Copyright Epic Games, Inc. All Rights Reserved.

#pragma once

#include "dna/TypeDefs.h"

#ifdef _MSC_VER
    #pragma warning(push)
    #pragma warning(disable : 4365 4987)
#endif
#include <cstdint>
#include <functional>
#ifdef _MSC_VER
    #pragma warning(pop)
#endif

namespace dna {

class LODConstraint;

class LODMapping {
    public:
        explicit LODMapping(MemoryResource* memRes_);

        std::uint16_t getLODCount() const;
        void resetIndices();
        void resetLODs();
        void reset();
        void setLODCount(std::uint16_t lodCount);
        void discardLODs(const LODConstraint& lodConstraint);
        ConstArrayView<std::uint16_t> getIndices(std::uint16_t lod) const;
        std::uint16_t getIndexListCount() const;
        void clearIndices(std::uint16_t index);
        void addIndices(std::uint16_t index, const std::uint16_t* source, std::uint16_t count);
        void associateLODWithIndices(std::uint16_t lod, std::uint16_t index);
        void mapIndices(std::function<std::uint16_t(std::uint16_t)> mapper);
        void filterIndices(std::function<bool(std::uint16_t)> filterer);
        UnorderedSet<std::uint16_t> getCombinedDistinctIndices(MemoryResource* memRes) const;

    private:
        void cleanupIndices();

    protected:
        // Map indices to rows of the below defined matrix, e.g.:
        // lods: [0, 0, 1, 1]
        // indices: {[10, 15, 12], [9, 7, 43, 67]}
        // expands into:
        // 0: [10, 15, 12]
        // 1: [10, 15, 12]
        // 2: [9, 7, 43, 67]
        // 3: [9, 7, 43, 67]
        Vector<std::uint16_t> lods;
        Matrix<std::uint16_t> indices;

};

}  // namespace dna
