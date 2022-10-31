// Copyright Epic Games, Inc. All Rights Reserved.

#pragma once

#include "dnacalib/types/Aliases.h"
#include "dnacalib/types/Triangle.h"
#include "dnacalib/types/BoundingBox.h"

namespace dnac {


class UVBarycentricMapping {
    public:
        using TrianglePositionIndicesPair = std::pair<Triangle, std::array<std::uint32_t, 3u> >;
        using BarycentricPositionIndicesPair = std::pair<fvec3, ConstArrayView<std::uint32_t> >;

    public:
        UVBarycentricMapping(const std::function<ConstArrayView<std::uint32_t>(std::uint32_t)>& faceGetter,
                             ConstArrayView<std::uint32_t> vertexPositionIndices,
                             ConstArrayView<std::uint32_t> textureCoordinateUVIndices,
                             ConstArrayView<float> Us,
                             ConstArrayView<float> Vs,
                             std::uint32_t faceCount,
                             MemoryResource* memRes);

        explicit UVBarycentricMapping(const dna::Reader* reader, std::uint16_t meshIndex, MemoryResource* memRes);

        ConstArrayView<TrianglePositionIndicesPair> getTriangles() const;
        ConstArrayView<BoundingBox> getBoundingBoxes() const;

        BarycentricPositionIndicesPair getBarycentric(const fvec2& uv) const;

    private:
        Vector<TrianglePositionIndicesPair> triangles;
        Vector<BoundingBox> bBoxes;
};

}  // namespace dnac
