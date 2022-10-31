// Copyright Epic Games, Inc. All Rights Reserved.

#include "pma/resources/ArenaMemoryResource.h"

#include "pma/ScopedPtr.h"
#include "pma/TypeDefs.h"

#include <cassert>
#include <cmath>
#include <cstddef>
#include <cstdint>

namespace pma {

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

class ArenaMemoryResource::Impl {
    public:
        static Impl* create(std::size_t initialSize_, std::size_t regionSize_, float growthFactor_, MemoryResource* upstream_) {
            PolyAllocator<Impl> alloc{upstream_};
            return alloc.newObject(initialSize_, regionSize_, growthFactor_, upstream_);
        }

        static void destroy(Impl* instance) {
            PolyAllocator<Impl> alloc{instance->upstream};
            alloc.deleteObject(instance);
        }

        Impl(std::size_t initialSize_, std::size_t regionSize_, float growthFactor_, MemoryResource* upstream_) :
            arenas{upstream_},
            regionSize{regionSize_},
            growthFactor{growthFactor_},
            upstream{upstream_},
            ptr{nullptr} {

            assert(upstream != nullptr);
            allocateArena(initialSize_);
        }

        ~Impl() {
            for (auto it = arenas.rbegin(); it != arenas.rend(); ++it) {
                upstream->deallocate(it->memory, it->size, alignof(std::max_align_t));
            }
            arenas.clear();
        }

        Impl(const Impl&) = delete;
        Impl& operator=(const Impl&) = delete;

        Impl(Impl&&) = delete;
        Impl& operator=(Impl&&) = delete;

        void* allocate(std::size_t size, std::size_t alignment) {
            auto pAligned = alignPointer(ptr, alignment);
            // If the old(current) pointer equals the aligned pointer, it was already
            // adhering to the given alignment requirement.
            const auto alignmentCorrection = static_cast<std::size_t>(static_cast<char*>(pAligned) - static_cast<char*>(ptr));
            const auto neededSize = size + alignmentCorrection;
            // Check if current arena has enough free space
            assert(!arenas.empty());
            const auto& currentArena = arenas.back();
            if ((static_cast<char*>(ptr) + neededSize) > (static_cast<char*>(currentArena.memory) + currentArena.size)) {
                // Not enough space in current arena, allocate an additional one (honoring growth factor),
                // unless this is the first additional region that's needed, in which case it's size will
                // be exactly `regionSize`
                const bool isFirstAdditional = (arenas.size() == 1ul);
                const std::size_t newArenaSize =
                    (isFirstAdditional ? regionSize : static_cast<std::size_t>(std::lroundf(static_cast<float>(currentArena.size)
                                                                                            * growthFactor)));
                allocateArena(newArenaSize);
                // Retry allocation relying on newly allocated arena
                return allocate(size, alignment);
            }

            ptr = static_cast<void*>(static_cast<char*>(ptr) + neededSize);
            return pAligned;
        }

        MemoryResource* getUpstreamMemoryResource() const {
            return upstream;
        }

    private:
        void allocateArena(std::size_t size) {
            if (!arenas.empty() && (arenas.back().memory == ptr)) {
                // No allocation happened in the arena whatsoever, and the first allocation was
                // immediately larger than the arena's size, thus it's an unused arena, and should
                // be discarded immediately.
                auto unusedArena = arenas.back();
                arenas.pop_back();
                upstream->deallocate(unusedArena.memory, unusedArena.size, alignof(std::max_align_t));
            }
            arenas.push_back({upstream->allocate(size, alignof(std::max_align_t)), size});
            ptr = arenas.back().memory;
        }

    private:
        struct Arena {
            void* memory;
            std::size_t size;
        };

        pma::List<Arena> arenas;
        std::size_t regionSize;
        float growthFactor;
        MemoryResource* upstream;
        void* ptr;

};

ArenaMemoryResource::ArenaMemoryResource(std::size_t initialSize,
                                         std::size_t regionSize,
                                         float growthFactor,
                                         MemoryResource* upstream) :
    pImpl{makeScoped<Impl, FactoryCreate, FactoryDestroy>(initialSize, regionSize, growthFactor, upstream)} {
}

ArenaMemoryResource::ArenaMemoryResource(std::size_t regionSize, float growthFactor, MemoryResource* upstream) :
    ArenaMemoryResource{regionSize, regionSize, growthFactor, upstream} {
}

ArenaMemoryResource::ArenaMemoryResource(std::size_t regionSize, MemoryResource* upstream) :
    ArenaMemoryResource{regionSize, regionSize, 1.0f, upstream} {
}

ArenaMemoryResource::~ArenaMemoryResource() = default;
ArenaMemoryResource::ArenaMemoryResource(ArenaMemoryResource&&) = default;
ArenaMemoryResource& ArenaMemoryResource::operator=(ArenaMemoryResource&&) = default;

void* ArenaMemoryResource::allocate(std::size_t size, std::size_t alignment) {
    return pImpl->allocate(size, alignment);
}

void ArenaMemoryResource::deallocate(void*  /*unused*/, std::size_t  /*unused*/, std::size_t  /*unused*/) {
    // No-op
}

MemoryResource* ArenaMemoryResource::getUpstreamMemoryResource() const {
    return pImpl->getUpstreamMemoryResource();
}

}  // namespace pma
