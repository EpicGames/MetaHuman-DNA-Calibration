// Copyright Epic Games, Inc. All Rights Reserved.

#include "dnacalib/types/UVBarycentricMapping.h"

namespace dnac {

UVBarycentricMapping::UVBarycentricMapping(const std::function<ConstArrayView<std::uint32_t>(std::uint32_t)>& faceGetter,
                                           ConstArrayView<std::uint32_t> vertexPositionIndices,
                                           ConstArrayView<std::uint32_t> textureCoordinateUVIndices,
                                           ConstArrayView<float> Us,
                                           ConstArrayView<float> Vs,
                                           std::uint32_t faceCount,
                                           MemoryResource* memRes) :
    triangles{memRes},
    bBoxes{memRes} {

    auto estimatedTriangleCount = static_cast<std::size_t>(static_cast<float>(faceCount) * 2.5f);
    triangles.reserve(estimatedTriangleCount);
    bBoxes.reserve(estimatedTriangleCount);
    for (std::uint32_t i = 0u; i < faceCount; i++) {
        auto face = faceGetter(i);
        while (face.size() > 2) {
            const auto vertexLayoutIndex0 = face[0];
            const auto vertexLayoutIndex1 = face[1];
            const auto vertexLayoutIndex2 = face[face.size() - 1u];

            const std::array<std::uint32_t, 3> positionIndices {vertexPositionIndices[vertexLayoutIndex0],
                                                                vertexPositionIndices[vertexLayoutIndex1],
                                                                vertexPositionIndices[vertexLayoutIndex2]};

            const auto uvIndex0 = textureCoordinateUVIndices[vertexLayoutIndex0];
            const auto uvIndex1 = textureCoordinateUVIndices[vertexLayoutIndex1];
            const auto uvIndex2 = textureCoordinateUVIndices[vertexLayoutIndex2];

            const std::array<fvec2, 3> UVs = {fvec2{Us[uvIndex0], Vs[uvIndex0]},
                                              fvec2{Us[uvIndex1], Vs[uvIndex1]},
                                              fvec2{Us[uvIndex2], Vs[uvIndex2]}};

            triangles.emplace_back(Triangle{UVs}, positionIndices);
            bBoxes.emplace_back(BoundingBox{UVs});
            face = face.last(face.size() - 1u);
        }
    }
    triangles.shrink_to_fit();
    bBoxes.shrink_to_fit();
}

UVBarycentricMapping::UVBarycentricMapping(const dna::Reader* reader, std::uint16_t meshIndex, MemoryResource* memRes) :
    UVBarycentricMapping(std::bind(&dna::Reader::getFaceVertexLayoutIndices, reader, meshIndex, std::placeholders::_1),
                         reader->getVertexLayoutPositionIndices(meshIndex),
                         reader->getVertexLayoutTextureCoordinateIndices(meshIndex),
                         reader->getVertexTextureCoordinateUs(meshIndex),
                         reader->getVertexTextureCoordinateVs(meshIndex),
                         reader->getFaceCount(meshIndex),
                         memRes) {

}

ConstArrayView<UVBarycentricMapping::TrianglePositionIndicesPair> UVBarycentricMapping::getTriangles() const {
    return {triangles.data(), triangles.size()};
}

ConstArrayView<BoundingBox> UVBarycentricMapping::getBoundingBoxes() const {
    return {bBoxes.data(), bBoxes.size()};
}

UVBarycentricMapping::BarycentricPositionIndicesPair UVBarycentricMapping::getBarycentric(const fvec2& uv) const {
    BarycentricPositionIndicesPair barycentricPositionsPair;
    for (std::uint32_t i = 0u; i < bBoxes.size(); i++) {
        if (bBoxes[i].contains(uv)) {
            const auto barycentricWeights = triangles[i].first.getBarycentricCoords(uv);
            // If we don't hit any triangle, we will use one whose bounding box we hit
            barycentricPositionsPair = {barycentricWeights, ConstArrayView<std::uint32_t>{triangles[i].second}};
            if ((barycentricWeights[0] >= 0.0f) && (barycentricWeights[0] <= 1.0f) &&
                (barycentricWeights[1] >= 0.0f) && (barycentricWeights[1] <= 1.0f) &&
                (barycentricWeights[2] >= 0.0f) && (barycentricWeights[2] <= 1.0f)) {
                return barycentricPositionsPair;
            }
        }
    }
    return barycentricPositionsPair;
}

}  // namespace dnac
