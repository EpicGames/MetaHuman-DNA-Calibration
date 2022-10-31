// Copyright Epic Games, Inc. All Rights Reserved.

#pragma once

#include "pma/Defs.h"
#include "pma/MemoryResource.h"

#include <cstddef>

namespace pma {

/**
    @brief A MemoryResource that honors alignment requirements.
    @see MemoryResource
*/
class PMAAPI AlignedMemoryResource : public MemoryResource {
    public:
        void* allocate(std::size_t size, std::size_t alignment) override;
        void deallocate(void* ptr, std::size_t size, std::size_t alignment) override;
};

}  // namespace pma
