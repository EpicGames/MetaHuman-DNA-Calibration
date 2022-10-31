// Copyright Epic Games, Inc. All Rights Reserved.

#pragma once

#include "dna/LODMapping.h"
#include "dna/types/Aliases.h"
#include "dna/utils/Extd.h"

#include <cassert>
#include <cstdint>

namespace dna {

template<class Reader>
struct DenormalizedData {
    LODMapping jointVariableAttributeIndices;
    LODMapping meshBlendShapeMappingIndices;

    explicit DenormalizedData(MemoryResource* memRes) :
        jointVariableAttributeIndices{memRes},
        meshBlendShapeMappingIndices{memRes} {
    }

    void populate(const Reader* source) {
        populateJointVariableAttributeIndices(source, jointVariableAttributeIndices);
        populateMeshBlendShapeMappingIndices(source, meshBlendShapeMappingIndices);
    }

    private:
        void populateJointVariableAttributeIndices(const Reader* source, LODMapping& destination) {
            // Prepare storage for all available LODs
            const auto lodCount = source->getLODCount();
            destination.setLODCount(lodCount);
            // Concatenate all output indices for each LOD
            for (std::uint16_t i = 0u; i < source->getJointGroupCount(); ++i) {
                const auto outputIndices = source->getJointGroupOutputIndices(i);
                const auto lodSizes = source->getJointGroupLODs(i);
                assert(lodSizes.size() == lodCount);
                for (std::uint16_t lod = 0u; lod < lodCount; ++lod) {
                    // In this case, each LOD has a distinct set of indices, so the LOD and Index parameters
                    // are the same for all LODs
                    destination.addIndices(lod, outputIndices.data(), lodSizes[lod]);
                    destination.associateLODWithIndices(lod, lod);
                }
            }
        }

        void populateMeshBlendShapeMappingIndices(const Reader* source, LODMapping& destination) {
            // Prepare storage for all available LODs
            const auto lodCount = source->getLODCount();
            destination.setLODCount(lodCount);
            // Include only those mapping indices which are present in the already filtered
            // mesh and blendshape LOD mapping
            for (std::uint16_t lod = 0u; lod < lodCount; ++lod) {
                const auto meshIndices = source->getMeshIndicesForLOD(lod);
                const auto blendShapeIndices = source->getBlendShapeChannelIndicesForLOD(lod);

                auto isMappingNeeded = [&meshIndices, &blendShapeIndices](const MeshBlendShapeChannelMapping& mapping) {
                        const bool meshNeeded = extd::contains(meshIndices, mapping.meshIndex);
                        const bool blendShapeNeeded = extd::contains(blendShapeIndices, mapping.blendShapeChannelIndex);
                        return (meshNeeded && blendShapeNeeded);
                    };

                for (std::uint16_t i = 0u; i < source->getMeshBlendShapeChannelMappingCount(); ++i) {
                    const auto mapping = source->getMeshBlendShapeChannelMapping(i);
                    if (isMappingNeeded(mapping)) {
                        // In this case, each LOD has a distinct set of indices, so the LOD and Index parameters
                        // are the same for all LODs
                        destination.addIndices(lod, &i, static_cast<std::uint16_t>(1));
                    }
                }

                destination.associateLODWithIndices(lod, lod);
            }
        }

};

}  // namespace dna
