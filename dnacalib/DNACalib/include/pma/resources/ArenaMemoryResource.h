// Copyright Epic Games, Inc. All Rights Reserved.

#pragma once

#include "pma/Defs.h"
#include "pma/MemoryResource.h"
#include "pma/ScopedPtr.h"

#include <cstddef>

namespace pma {

/**
    @brief Serves allocations from a preallocated memory region.
    @see MemoryResource
*/
class ArenaMemoryResource : public MemoryResource {
    public:
        /**
            @brief Constructor
            @param initialSize
                The size of the first allocated region from which allocation requests are served.
            @param regionSize
                When a memory region backing allocation requests has not enough free space to serve an
                allocation, an additional region is allocated for both the current and all subsequent allocations.
                This parameter denotes the size of these additionally allocated regions.
            @param growthFactor
                It describes by which factor should each subsequently allocated region be scaled,
                relative to the previous region. A list of possible region allocation would look like:

                regions = {initialSize, regionSize, regions[1] * growthFactor, regions[2] * growthFactor, ... , regions[n - 1] * growthFactor}

            @param upstream
                The backing memory region will be allocated using the given upstream MemoryResource.
        */
        PMAAPI ArenaMemoryResource(std::size_t initialSize, std::size_t regionSize, float growthFactor, MemoryResource* upstream);
        /**
            @brief Constructor
            @param regionSize
                When a memory region backing allocation requests has not enough free space to serve an
                allocation, an additional region is allocated for both the current and all subsequent allocations.
                This parameter denotes the size of the initial and all subsequently allocated regions.
            @param growthFactor
                It describes by which factor should each subsequently allocated region be scaled,
                relative to the previous region. A list of possible region allocation would look like:

                regions = {initialSize, regionSize, regions[1] * growthFactor, regions[2] * growthFactor, ... , regions[n - 1] * growthFactor}

            @param upstream
                The backing memory region will be allocated using the given upstream MemoryResource.
        */
        PMAAPI ArenaMemoryResource(std::size_t regionSize, float growthFactor, MemoryResource* upstream);
        /**
            @brief Constructor
            @param regionSize
                When a memory region backing allocation requests has not enough free space to serve an
                allocation, an additional region is allocated for both the current and all subsequent allocations.
                This parameter denotes the size of the initial and all subsequently allocated regions.
            @note
                The growth factor in this case will be 1.0, i.e. no growth.
            @param upstream
                The backing memory region will be allocated using the given upstream MemoryResource.
        */
        PMAAPI ArenaMemoryResource(std::size_t regionSize, MemoryResource* upstream);

        PMAAPI ~ArenaMemoryResource();

        ArenaMemoryResource(const ArenaMemoryResource&) = delete;
        ArenaMemoryResource& operator=(const ArenaMemoryResource&) = delete;

        PMAAPI ArenaMemoryResource(ArenaMemoryResource&&);
        PMAAPI ArenaMemoryResource& operator=(ArenaMemoryResource&&);

        /**
            @brief All allocations will be served from the currently active memory region.
        */
        PMAAPI void* allocate(std::size_t size, std::size_t alignment) override;
        /**
            @brief This is a no-op, and the regions are only freed when the arena itself is destroyed.
        */
        PMAAPI void deallocate(void* ptr, std::size_t size, std::size_t alignment) override;
        /**
            @brief The upstream memory resource was passed through the constructor and is backing all arena allocations.
        */
        PMAAPI MemoryResource* getUpstreamMemoryResource() const;

    private:
        class Impl;
        ScopedPtr<Impl, FactoryDestroy<Impl> > pImpl;

};

}  // namespace pma
