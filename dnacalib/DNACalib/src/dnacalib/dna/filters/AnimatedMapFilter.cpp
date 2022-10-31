// Copyright Epic Games, Inc. All Rights Reserved.

#include "dnacalib/dna/filters/AnimatedMapFilter.h"

#include "dnacalib/TypeDefs.h"
#include "dnacalib/dna/DNA.h"
#include "dnacalib/dna/filters/Remap.h"
#include "dnacalib/utils/Extd.h"

namespace dnac {

AnimatedMapFilter::AnimatedMapFilter(MemoryResource* memRes_) :
    memRes{memRes_},
    passingIndices{memRes},
    remappedIndices{memRes} {
}

void AnimatedMapFilter::configure(std::uint16_t animatedMapCount, UnorderedSet<std::uint16_t> allowedAnimatedMapIndices) {
    passingIndices = std::move(allowedAnimatedMapIndices);
    // Fill the structure that maps indices prior to deletion to indices after deletion
    remap(animatedMapCount, passingIndices, remappedIndices);
}

void AnimatedMapFilter::apply(RawDefinition& dest) {
    // Fix indices so they match the same elements as earlier (but their
    // actual position changed with the deletion of the unneeded entries)
    dest.lodAnimatedMapMapping.mapIndices([this](std::uint16_t value) {
            return remappedIndices.at(value);
        });
    // Delete elements that are not referenced by the new subset of LODs
    extd::filter(dest.animatedMapNames, extd::byPosition(passingIndices));
}

bool AnimatedMapFilter::passes(std::uint16_t index) const {
    return extd::contains(passingIndices, index);
}

}  // namespace dnac
