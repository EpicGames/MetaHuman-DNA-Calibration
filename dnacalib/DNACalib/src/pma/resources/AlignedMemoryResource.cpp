// Copyright Epic Games, Inc. All Rights Reserved.

#include "pma/resources/AlignedMemoryResource.h"

#include <cassert>
#include <cstddef>
#include <cstdint>
#include <cstdlib>

#if defined(__linux__) || defined(__APPLE__)
    #include <stdlib.h>
#elif defined(_MSC_VER) || defined(__ANDROID__)
    #include <malloc.h>
#endif

#if defined(__cplusplus) && (__cplusplus >= 201703L) && (defined(_GLIBCXX_HAVE_ALIGNED_ALLOC) || \
    defined(_LIBCPP_HAS_ALIGNED_ALLOC) || defined(_LIBCPP_HAS_C11_FEATURES))
    #define ALIGNED_ALLOC(ptr, alignment, size) ptr = std::aligned_alloc(alignment, size)
    #define ALIGNED_FREE(ptr) std::free(ptr)
#elif ((defined(_POSIX_VERSION) && (_POSIX_VERSION >= 200112L)) || defined(__linux__) || defined(__APPLE__))
    #define ALIGNED_ALLOC(ptr, alignment, size) if (::posix_memalign(&(ptr), alignment, size)) \
        (ptr) = nullptr
    #define ALIGNED_FREE(ptr) ::free(ptr)
#elif defined(_MSC_VER)
    #define ALIGNED_ALLOC(ptr, alignment, size) ptr = _aligned_malloc(size, alignment)
    #define ALIGNED_FREE(ptr) _aligned_free(ptr)
#elif defined(__ANDROID__)
    #define ALIGNED_ALLOC(ptr, alignment, size) ptr = ::memalign(alignment, size)
    #define ALIGNED_FREE(ptr) ::free(ptr)
#else
    inline std::uintptr_t alignAddress(std::uintptr_t address, std::size_t alignment) {
        const std::size_t mask = alignment - 1ul;
        assert((alignment & mask) == 0ul);
        return (address + mask) & ~mask;
    }

    template<typename T>
    inline T* alignPointer(T* ptr, std::size_t alignment) {
        const std::uintptr_t address = reinterpret_cast<std::uintptr_t>(ptr);
        const std::uintptr_t aligned = alignAddress(address, alignment);
        return reinterpret_cast<T*>(aligned);
    }

    void* alignedAlloc(std::size_t size, std::size_t alignment) {
        const std::size_t actualSize = size + alignment;
        char* pUnalignedChunk = new char[actualSize];
        char* pAlignedChunk = alignPointer(pUnalignedChunk, alignment);
        if (pAlignedChunk == pUnalignedChunk) {
            // There was no need for additional alignment, so an artifical gap
            // must be added to make room for the shift value
            pAlignedChunk += alignment;
        }
        // Compute and write the shift value into the buffer (it is needed during
        // deallocation to reconstruct by which amount was the given pointer
        // offset to meet the alignment requirement)
        std::ptrdiff_t shift = pAlignedChunk - pUnalignedChunk;
        // The guaranteed storage size for the shift value is only one byte
        assert(shift > 0 && shift <= 256);
        pAlignedChunk[-1] = static_cast<char>(shift & 0xFF);
        return static_cast<void*>(pAlignedChunk);
    }

    void alignedFree(void* ptr) {
        if (ptr) {
            auto pAlignedChunk = reinterpret_cast<char*>(ptr);
            std::ptrdiff_t shift = pAlignedChunk[-1];
            // There is no 0 alignment, so the value is reused to actually denote alignment by 256
            if (shift == 0) {
                shift = 256;
            }
            // Compute the actual start address of the chunk, prior to aligning it's address
            auto pUnalignedChunk = pAlignedChunk - shift;
            delete[] pUnalignedChunk;
        }
    }

    #define ALIGNED_ALLOC(ptr, alignment, size) ptr = alignedAlloc(size, alignment)
    #define ALIGNED_FREE(ptr) alignedFree(ptr)
#endif

namespace pma {

void* AlignedMemoryResource::allocate(std::size_t size, std::size_t alignment) {
    void* ptr;
    ALIGNED_ALLOC(ptr, alignment, size);
    return ptr;
}

void AlignedMemoryResource::deallocate(void* ptr, std::size_t  /*unused*/, std::size_t  /*unused*/) {
    // NOLINTNEXTLINE(cppcoreguidelines-owning-memory,cppcoreguidelines-no-malloc,hicpp-no-malloc)
    ALIGNED_FREE(ptr);
}

}  // namespace pma
