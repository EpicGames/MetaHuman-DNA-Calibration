// Copyright Epic Games, Inc. All Rights Reserved.

#include "pma/resources/DefaultMemoryResource.h"

#include <cstddef>
#include <cstdlib>

namespace pma {

void* DefaultMemoryResource::allocate(std::size_t size, std::size_t  /*unused*/) {
    // NOLINTNEXTLINE(cppcoreguidelines-owning-memory,cppcoreguidelines-no-malloc,hicpp-no-malloc)
    return std::malloc(size);
}

void DefaultMemoryResource::deallocate(void* ptr, std::size_t  /*unused*/, std::size_t  /*unused*/) {
    // NOLINTNEXTLINE(cppcoreguidelines-owning-memory,cppcoreguidelines-no-malloc,hicpp-no-malloc)
    std::free(ptr);
}

}  // namespace pma
