// Copyright Epic Games, Inc. All Rights Reserved.

#pragma once

#include "dna/DataLayer.h"
#include "dna/DataLayerBitmask.h"
#include "dna/LODConstraint.h"
#include "dna/TypeDefs.h"
#include "dna/filters/AnimatedMapFilter.h"
#include "dna/filters/BlendShapeFilter.h"
#include "dna/filters/JointFilter.h"
#include "dna/filters/MeshFilter.h"

#include <terse/archives/binary/InputArchive.h>

#include <cstddef>
#include <cstdint>

namespace dna {

struct RawAnimatedMaps;
struct RawBehavior;
struct RawBlendShapeChannels;
struct RawDefinition;
struct RawDescriptor;
struct RawGeometry;
struct RawJoints;
struct RawMesh;
struct RawVertexSkinWeights;

class FilteredInputArchive final : public AnimatedMapFilter, public BlendShapeFilter, public JointFilter, public MeshFilter,
    public terse::ExtendableBinaryInputArchive<FilteredInputArchive,
                                               BoundedIOStream,
                                               std::uint32_t,
                                               std::uint32_t,
                                               terse::Endianness::Network> {
    private:
        using BaseArchive = terse::ExtendableBinaryInputArchive<FilteredInputArchive,
                                                                BoundedIOStream,
                                                                std::uint32_t,
                                                                std::uint32_t,
                                                                terse::Endianness::Network>;
        friend Archive<FilteredInputArchive>;

    public:
        FilteredInputArchive(BoundedIOStream* stream_,
                             DataLayer layer_,
                             std::uint16_t maxLOD_,
                             std::uint16_t minLOD_,
                             MemoryResource* memRes_);
        FilteredInputArchive(BoundedIOStream* stream_,
                             DataLayer layer_,
                             ConstArrayView<std::uint16_t> lods_,
                             MemoryResource* memRes_);

    private:
        void process(RawDescriptor& dest);
        void process(RawDefinition& dest);
        void process(RawBehavior& dest);
        void process(RawJoints& dest);
        void process(RawBlendShapeChannels& dest);
        void process(RawAnimatedMaps& dest);
        void process(RawGeometry& dest);
        void process(RawMesh& dest);
        void process(RawVertexSkinWeights& dest);

        template<typename ... Args>
        void process(Args&& ... args) {
            BaseArchive::process(std::forward<Args>(args)...);
        }

        template<typename TContainer>
        void processSubset(TContainer& dest, std::size_t offset, std::size_t size);

    private:
        BoundedIOStream* stream;
        MemoryResource* memRes;
        DataLayerBitmask layerBitmask;
        LODConstraint lodConstraint;
        std::uint16_t unconstrainedLODCount;

};

}  // namespace dna
