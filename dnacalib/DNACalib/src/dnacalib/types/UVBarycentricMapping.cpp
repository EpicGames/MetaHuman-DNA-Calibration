// Copyright Epic Games, Inc. All Rights Reserved.

#include "dnacalib/types/UVBarycentricMapping.h"

namespace dnac {

namespace {

tdm::vec3<std::uint32_t> findTriangleWithLargestArea(ConstArrayView<std::uint32_t> face,
                                                     ConstArrayView<std::uint32_t> textureCoordinateUVIndices,
                                                     ConstArrayView<float> Us,
                                                     ConstArrayView<float> Vs) {
    float maxArea = 0.0f;
    tdm::vec3<std::uint32_t> maxTriangle = {0u, 1u, static_cast<std::uint32_t>(face.size() - 1u)};
    for (std::size_t ai = {}; ai < face.size(); ++ai) {
        const std::uint32_t avli = face[ai];
        const std::uint32_t auvi = textureCoordinateUVIndices[avli];
        const float au = Us[auvi];
        const float av = Vs[auvi];
        for (std::size_t bi = (ai + 1ul); bi < face.size(); ++bi) {
            const std::uint32_t bvli = face[bi];
            const std::uint32_t buvi = textureCoordinateUVIndices[bvli];
            const float bu = Us[buvi];
            const float bv = Vs[buvi];
            for (std::size_t ci = (bi + 1ul); ci < face.size(); ++ci) {
                const std::uint32_t cvli = face[ci];
                const std::uint32_t cuvi = textureCoordinateUVIndices[cvli];
                const float cu = Us[cuvi];
                const float cv = Vs[cuvi];
                const float area = std::fabs(0.5f * (au * (bv - cv) + bu * (cv - av) + cu * (av - bv)));
                if (area > maxArea) {
                    maxArea = area;
                    maxTriangle = {avli, bvli, cvli};
                }
            }
        }
    }
    return maxTriangle;
}

}  // namespace

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
            const auto maxTriangle = findTriangleWithLargestArea(face, textureCoordinateUVIndices, Us, Vs);
            const auto vertexLayoutIndex0 = maxTriangle[0];
            const auto vertexLayoutIndex1 = maxTriangle[1];
            const auto vertexLayoutIndex2 = maxTriangle[2];

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

UVBarycentricMapping::BarycentricPositionIndicesPair UVBarycentricMapping::getBarycentric(fvec2 uv) const {
    BarycentricPositionIndicesPair barycentricPositionsPair;
    auto it = std::min_element(bBoxes.begin(), bBoxes.end(), [uv](const BoundingBox& a, const BoundingBox& b) {
        return a.distance(uv) < b.distance(uv);
    });
    if (it != bBoxes.end()) {
        const auto i = static_cast<std::size_t>(std::distance(bBoxes.begin(), it));
        const auto barycentricWeights = std::get<0>(triangles[i]).getBarycentricCoords(uv);
        // If we don't hit any triangle, we will use one whose bounding box we hit
        barycentricPositionsPair = BarycentricPositionIndicesPair(barycentricWeights, ConstArrayView<std::uint32_t>{std::get<1>(triangles[i])});
        if ((barycentricWeights[0] >= 0.0f) && (barycentricWeights[0] <= 1.0f) &&
            (barycentricWeights[1] >= 0.0f) && (barycentricWeights[1] <= 1.0f) &&
            (barycentricWeights[2] >= 0.0f) && (barycentricWeights[2] <= 1.0f)) {
            return barycentricPositionsPair;
        }
    }
    return barycentricPositionsPair;
}

}  // namespace dnac
