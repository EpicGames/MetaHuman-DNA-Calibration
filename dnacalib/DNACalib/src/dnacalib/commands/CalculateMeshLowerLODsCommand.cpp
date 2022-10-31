// Copyright Epic Games, Inc. All Rights Reserved.

#include "dnacalib/commands/CalculateMeshLowerLODsCommand.h"

#include "dnacalib/CommandImplBase.h"
#include "dnacalib/dna/DNA.h"
#include "dnacalib/dna/DNACalibDNAReaderImpl.h"
#include "dnacalib/types/Aliases.h"
#include "dnacalib/types/UVBarycentricMapping.h"

namespace dnac {

class CalculateMeshLowerLODsCommand::Impl : public CommandImplBase<Impl> {
    private:
        using Super = CommandImplBase<Impl>;

    public:
        explicit Impl(MemoryResource* memRes_) :
            Super{memRes_},
            meshIndex{} {
        }

        void setMeshIndex(std::uint16_t meshIndex_) {
            meshIndex = meshIndex_;
        }

        void run(DNACalibDNAReaderImpl* output) {
            UVBarycentricMapping mapping{output, meshIndex, getMemoryResource()};

            auto srcMeshXs = output->getVertexPositionXs(meshIndex);
            auto srcMeshYs = output->getVertexPositionYs(meshIndex);
            auto srcMeshZs = output->getVertexPositionZs(meshIndex);

            const auto getSrcVertex = [srcMeshXs, srcMeshYs, srcMeshZs](std::uint32_t positionIndex) {
                    return fvec3{srcMeshXs[positionIndex], srcMeshYs[positionIndex], srcMeshZs[positionIndex]};
                };

            for (std::uint16_t mi : findIndicesOfMeshLowerLODs(output)) {
                auto vertexLayoutPositionIndices = output->getVertexLayoutPositionIndices(mi);
                auto vertexLayoutTextureCoordinateIndices = output->getVertexLayoutTextureCoordinateIndices(mi);
                auto us = output->getVertexTextureCoordinateUs(mi);
                auto vs = output->getVertexTextureCoordinateVs(mi);
                const std::uint32_t positionCount = output->getVertexPositionCount(mi);
                RawVector3Vector destVertexPositions {positionCount, {}, getMemoryResource()};
                // As there can be multiple VertexLayout per each VertexPosition we will use arithmetic mean value.
                Vector<uint8_t> vertexLayoutsPerPosition{positionCount, {}, getMemoryResource()};

                for (std::size_t i = 0u; i < vertexLayoutPositionIndices.size(); ++i) {
                    const std::uint32_t uvIndex = vertexLayoutTextureCoordinateIndices[i];
                    const fvec2 uvs = {us[uvIndex], vs[uvIndex]};
                    const auto weightsIndicesPair = mapping.getBarycentric(uvs);
                    const fvec3& barycentric = weightsIndicesPair.first;
                    auto srcVtxIndices = weightsIndicesPair.second;

                    if (srcVtxIndices.size() == 0) {
                        // We'll need to handle this case in the future?
                        assert(false && "Could not map a vertex, did not hit any triangle's bounding box.");
                        continue;
                    }
                    const fvec3 src =
                        getSrcVertex(srcVtxIndices[0]) * barycentric[0] +
                        getSrcVertex(srcVtxIndices[1]) * barycentric[1] +
                        getSrcVertex(srcVtxIndices[2]) * barycentric[2];

                    const uint32_t positionIndex = vertexLayoutPositionIndices[i];
                    float& destX = destVertexPositions.xs[positionIndex];
                    float& destY = destVertexPositions.ys[positionIndex];
                    float& destZ = destVertexPositions.zs[positionIndex];

                    const auto vtxLayoutCount = ++vertexLayoutsPerPosition[positionIndex];

                    if (vtxLayoutCount == 1) {
                        destX = src[0];
                        destY = src[1];
                        destZ = src[2];
                    } else {
                        // We require mean average, more than one vertexLayout for this vertex position
                        const auto lastDenominator = static_cast<float>(vtxLayoutCount - 1u);
                        const auto newDenominator = static_cast<float>(vtxLayoutCount);
                        destX = (destX * lastDenominator + src[0]) / newDenominator;
                        destY = (destY * lastDenominator + src[1]) / newDenominator;
                        destZ = (destZ * lastDenominator + src[2]) / newDenominator;
                    }
                }
                output->setVertexPositions(mi, std::move(destVertexPositions));
            }
        }

    private:
        /**
         * @brief Get the Mesh Name without postfix " _lodX_mesh"
         */
        static StringView getMeshName(DNACalibDNAReaderImpl* output, std::uint16_t mi) {
            const auto meshName = output->getMeshName(mi);
            const auto underscoreIter = std::find(meshName.begin(), meshName.end(), '_');
            assert(underscoreIter != meshName.end() && "Mesh naming does not follow convention.");

            auto length = static_cast<size_t>(std::distance(meshName.begin(), underscoreIter));
            return {meshName.data(), length};
        }

        Vector<std::uint16_t> findIndicesOfMeshLowerLODs(DNACalibDNAReaderImpl* output) {
            Vector<std::uint16_t> lowerLODIndices{getMemoryResource()};
            bool isLowerLOD = false;
            auto meshName = getMeshName(output, meshIndex);
            for (std::uint16_t lodIndex = 0u; lodIndex < output->getLODCount(); ++lodIndex) {
                auto lodMeshIndices = output->getMeshIndicesForLOD(lodIndex);
                if (isLowerLOD) {
                    for (std::uint16_t mi : lodMeshIndices) {
                        if (meshName == getMeshName(output, mi)) {
                            lowerLODIndices.push_back(mi);
                            break;
                        }
                    }
                } else {
                    isLowerLOD = std::find(lodMeshIndices.begin(), lodMeshIndices.end(), meshIndex) != lodMeshIndices.end();
                }
            }
            return lowerLODIndices;
        }

    private:
        std::uint16_t meshIndex;
};

CalculateMeshLowerLODsCommand::CalculateMeshLowerLODsCommand(MemoryResource* memRes) : pImpl{makeScoped<Impl>(memRes)} {
}

CalculateMeshLowerLODsCommand::CalculateMeshLowerLODsCommand(std::uint16_t meshIndex, MemoryResource* memRes) :
    pImpl{makeScoped<Impl>(memRes)} {

    pImpl->setMeshIndex(meshIndex);
}

CalculateMeshLowerLODsCommand::~CalculateMeshLowerLODsCommand() = default;
CalculateMeshLowerLODsCommand::CalculateMeshLowerLODsCommand(CalculateMeshLowerLODsCommand&&) = default;
CalculateMeshLowerLODsCommand& CalculateMeshLowerLODsCommand::operator=(CalculateMeshLowerLODsCommand&&) = default;

void CalculateMeshLowerLODsCommand::setMeshIndex(std::uint16_t meshIndex) {
    pImpl->setMeshIndex(meshIndex);
}

void CalculateMeshLowerLODsCommand::run(DNACalibDNAReader* output) {
    pImpl->run(static_cast<DNACalibDNAReaderImpl*>(output));
}

}  // namespace dnac
