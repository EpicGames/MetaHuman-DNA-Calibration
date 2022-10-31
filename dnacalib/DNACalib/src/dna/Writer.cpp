// Copyright Epic Games, Inc. All Rights Reserved.

#include "dna/Writer.h"

#include "dna/Reader.h"
#include "dna/DataLayerBitmask.h"
#include "dna/TypeDefs.h"
#include "dna/types/Vector3.h"

#ifdef _MSC_VER
    #pragma warning(push)
    #pragma warning(disable : 4365 4987)
#endif
#include <functional>
#ifdef _MSC_VER
    #pragma warning(pop)
#endif

namespace dna {

namespace {

using Vector3Vector = Vector<Vector3>;
using TextureCoordinateVector = Vector<TextureCoordinate>;
using VertexLayoutVector = Vector<VertexLayout>;

}  // namespace

DescriptorWriter::~DescriptorWriter() = default;
DefinitionWriter::~DefinitionWriter() = default;
BehaviorWriter::~BehaviorWriter() = default;
GeometryWriter::~GeometryWriter() = default;
Writer::~Writer() = default;

template<typename TVector, typename TGetter>
static TVector collect_n(std::size_t count, TGetter getter, MemoryResource* memRes) {
    TVector retval{memRes};
    retval.reserve(count);
    for (std::size_t i = 0ul; i < count; ++i) {
        retval.push_back(getter(i));
    }
    return retval;
}

static void copyDescriptor(const DescriptorReader* source, DescriptorWriter* destination, MemoryResource*  /*unused*/) {
    destination->setName(source->getName());
    destination->setArchetype(source->getArchetype());
    destination->setGender(source->getGender());
    destination->setAge(source->getAge());
    destination->clearMetaData();
    for (std::uint32_t i = 0u; i < source->getMetaDataCount(); ++i) {
        const auto key = source->getMetaDataKey(i);
        const auto value = source->getMetaDataValue(key);
        destination->setMetaData(key, value);
    }
    destination->setTranslationUnit(source->getTranslationUnit());
    destination->setRotationUnit(source->getRotationUnit());
    destination->setCoordinateSystem(source->getCoordinateSystem());
    destination->setLODCount(source->getLODCount());
    destination->setDBMaxLOD(source->getDBMaxLOD());
    destination->setDBComplexity(source->getDBComplexity());
    destination->setDBName(source->getDBName());
}

static std::pair<bool, std::uint16_t> findIndices(const Matrix<std::uint16_t>& source, ConstArrayView<std::uint16_t> indices) {
    // In the common scenario each LOD has it's unique set of indices
    for (std::size_t i = 0ul; i < source.size(); ++i) {
        ConstArrayView<std::uint16_t> candidate{source[i].data(), source[i].size()};
        if (indices == candidate) {
            // Unless the indices are the same between multiple LODs, in which case use the
            // already registered index
            return {true, static_cast<std::uint16_t>(i)};
        }
    }
    return {false, static_cast<std::uint16_t>(0)};
}

using IndicesGetter = std::function<ConstArrayView<std::uint16_t>(std::uint16_t)>;
using IndicesSetter = std::function<void (std::uint16_t, const std::uint16_t*, std::uint16_t)>;
using LODMappingSetter = std::function<void (std::uint16_t, std::uint16_t)>;

static void copyNameIndices(IndicesGetter getIndices,
                            IndicesSetter setIndices,
                            LODMappingSetter setLODMapping,
                            std::uint16_t lodCount,
                            MemoryResource* memRes) {
    Matrix<std::uint16_t> allIndices{memRes};
    std::uint16_t index = 0u;
    for (std::uint16_t lod = 0u; lod < lodCount; ++lod) {
        auto indices = getIndices(lod);
        // Check if these same indices were perhaps already used for previous LODs
        auto found = findIndices(allIndices, indices);
        if (!found.first) {
            setIndices(index, indices.data(), static_cast<std::uint16_t>(indices.size()));
            setLODMapping(lod, index);
            allIndices.emplace_back(indices.begin(), indices.end());
            ++index;
        } else {
            // Already used so do not replicate the same data twice
            setLODMapping(lod, found.second);
        }
    }
}

static void copyDefinition(const DefinitionReader* source, DefinitionWriter* destination, MemoryResource* memRes) {
    destination->clearGUIControlNames();
    destination->clearRawControlNames();
    destination->clearJointNames();
    destination->clearBlendShapeChannelNames();
    destination->clearAnimatedMapNames();
    destination->clearMeshNames();
    destination->clearJointIndices();
    destination->clearLODJointMappings();
    destination->clearBlendShapeChannelIndices();
    destination->clearLODBlendShapeChannelMappings();
    destination->clearAnimatedMapIndices();
    destination->clearLODAnimatedMapMappings();
    destination->clearMeshIndices();
    destination->clearLODMeshMappings();
    destination->clearMeshBlendShapeChannelMappings();

    const auto lodCount = source->getLODCount();

    for (std::uint16_t i = source->getGUIControlCount(); i > 0u; --i) {
        const auto idx = static_cast<std::uint16_t>(i - 1u);
        destination->setGUIControlName(idx, source->getGUIControlName(idx).data());
    }
    for (std::uint16_t i = source->getRawControlCount(); i > 0u; --i) {
        const auto idx = static_cast<std::uint16_t>(i - 1u);
        destination->setRawControlName(idx, source->getRawControlName(idx).data());
    }
    for (std::uint16_t i = source->getJointCount(); i > 0u; --i) {
        const auto idx = static_cast<std::uint16_t>(i - 1u);
        destination->setJointName(idx, source->getJointName(idx).data());
    }
    for (std::uint16_t i = source->getBlendShapeChannelCount(); i > 0u; --i) {
        const auto idx = static_cast<std::uint16_t>(i - 1u);
        destination->setBlendShapeChannelName(idx, source->getBlendShapeChannelName(idx).data());
    }
    for (std::uint16_t i = source->getAnimatedMapCount(); i > 0u; --i) {
        const auto idx = static_cast<std::uint16_t>(i - 1u);
        destination->setAnimatedMapName(idx, source->getAnimatedMapName(idx));
    }
    for (std::uint16_t i = source->getMeshCount(); i > 0u; --i) {
        const auto idx = static_cast<std::uint16_t>(i - 1u);
        destination->setMeshName(idx, source->getMeshName(idx).data());
    }

    using namespace std::placeholders;
    copyNameIndices(
        std::bind(&DefinitionReader::getJointIndicesForLOD, source, _1),
        std::bind(&DefinitionWriter::setJointIndices, destination, _1, _2, _3),
        std::bind(&DefinitionWriter::setLODJointMapping, destination, _1, _2),
        lodCount,
        memRes);
    copyNameIndices(
        std::bind(&DefinitionReader::getBlendShapeChannelIndicesForLOD, source, _1),
        std::bind(&DefinitionWriter::setBlendShapeChannelIndices, destination, _1, _2, _3),
        std::bind(&DefinitionWriter::setLODBlendShapeChannelMapping, destination, _1, _2),
        lodCount,
        memRes);
    copyNameIndices(
        std::bind(&DefinitionReader::getAnimatedMapIndicesForLOD, source, _1),
        std::bind(&DefinitionWriter::setAnimatedMapIndices, destination, _1, _2, _3),
        std::bind(&DefinitionWriter::setLODAnimatedMapMapping, destination, _1, _2),
        lodCount,
        memRes);
    copyNameIndices(
        std::bind(&DefinitionReader::getMeshIndicesForLOD, source, _1),
        std::bind(&DefinitionWriter::setMeshIndices, destination, _1, _2, _3),
        std::bind(&DefinitionWriter::setLODMeshMapping, destination, _1, _2),
        lodCount,
        memRes);

    Vector<std::uint16_t> jointHierarchy{memRes};
    jointHierarchy.reserve(source->getJointCount());
    for (std::uint16_t i = 0u; i < source->getJointCount(); ++i) {
        jointHierarchy.push_back(source->getJointParentIndex(i));
    }
    destination->setJointHierarchy(jointHierarchy.data(), static_cast<std::uint16_t>(jointHierarchy.size()));

    for (std::uint16_t i = 0u; i < source->getMeshBlendShapeChannelMappingCount(); ++i) {
        auto mapping = source->getMeshBlendShapeChannelMapping(i);
        destination->setMeshBlendShapeChannelMapping(i, mapping.meshIndex, mapping.blendShapeChannelIndex);
    }

    auto jointCount = source->getJointCount();

    auto translations = collect_n<Vector3Vector>(jointCount, [source](std::size_t index) {
            return source->getNeutralJointTranslation(static_cast<std::uint16_t>(index));
        }, memRes);
    destination->setNeutralJointTranslations(translations.data(), static_cast<std::uint16_t>(translations.size()));

    auto rotations = collect_n<Vector3Vector>(jointCount, [source](std::size_t index) {
            return source->getNeutralJointRotation(static_cast<std::uint16_t>(index));
        }, memRes);
    destination->setNeutralJointRotations(rotations.data(), static_cast<std::uint16_t>(rotations.size()));
}

static void copyBehavior(const BehaviorReader* source, BehaviorWriter* destination, MemoryResource*  /*unused*/) {
    destination->clearJointGroups();

    auto guiToRawInputIndices = source->getGUIToRawInputIndices();
    destination->setGUIToRawInputIndices(guiToRawInputIndices.data(), static_cast<std::uint16_t>(guiToRawInputIndices.size()));

    auto guiToRawOutputIndices = source->getGUIToRawOutputIndices();
    destination->setGUIToRawOutputIndices(guiToRawOutputIndices.data(), static_cast<std::uint16_t>(guiToRawOutputIndices.size()));

    auto guiToRawFromValues = source->getGUIToRawFromValues();
    destination->setGUIToRawFromValues(guiToRawFromValues.data(), static_cast<std::uint16_t>(guiToRawFromValues.size()));

    auto guiToRawToValues = source->getGUIToRawToValues();
    destination->setGUIToRawToValues(guiToRawToValues.data(), static_cast<std::uint16_t>(guiToRawToValues.size()));

    auto guiToRawSlopeValues = source->getGUIToRawSlopeValues();
    destination->setGUIToRawSlopeValues(guiToRawSlopeValues.data(), static_cast<std::uint16_t>(guiToRawSlopeValues.size()));

    auto guiToRawCutValues = source->getGUIToRawCutValues();
    destination->setGUIToRawCutValues(guiToRawCutValues.data(), static_cast<std::uint16_t>(guiToRawCutValues.size()));

    destination->setPSDCount(source->getPSDCount());

    auto psdRowIndices = source->getPSDRowIndices();
    destination->setPSDRowIndices(psdRowIndices.data(), static_cast<std::uint16_t>(psdRowIndices.size()));

    auto psdColumnIndices = source->getPSDColumnIndices();
    destination->setPSDColumnIndices(psdColumnIndices.data(), static_cast<std::uint16_t>(psdColumnIndices.size()));

    auto psdValues = source->getPSDValues();
    destination->setPSDValues(psdValues.data(), static_cast<std::uint16_t>(psdValues.size()));

    destination->setJointRowCount(source->getJointRowCount());
    destination->setJointColumnCount(source->getJointColumnCount());

    for (std::uint16_t jointGroupIndexPlusOne = source->getJointGroupCount();
         jointGroupIndexPlusOne > 0u;
         --jointGroupIndexPlusOne) {
        const auto jointGroupIndex = static_cast<std::uint16_t>(jointGroupIndexPlusOne - 1u);

        auto jointGroupLODs = source->getJointGroupLODs(jointGroupIndex);
        destination->setJointGroupLODs(jointGroupIndex, jointGroupLODs.data(), static_cast<std::uint16_t>(jointGroupLODs.size()));

        auto jointGroupInputIndices = source->getJointGroupInputIndices(jointGroupIndex);
        destination->setJointGroupInputIndices(jointGroupIndex, jointGroupInputIndices.data(),
                                               static_cast<std::uint16_t>(jointGroupInputIndices.size()));

        auto jointGroupOutputIndices = source->getJointGroupOutputIndices(jointGroupIndex);
        destination->setJointGroupOutputIndices(jointGroupIndex, jointGroupOutputIndices.data(),
                                                static_cast<std::uint16_t>(jointGroupOutputIndices.size()));

        auto jointGroupValues = source->getJointGroupValues(jointGroupIndex);
        destination->setJointGroupValues(jointGroupIndex, jointGroupValues.data(),
                                         static_cast<std::uint32_t>(jointGroupValues.size()));

        auto jointGroupJointIndices = source->getJointGroupJointIndices(jointGroupIndex);
        destination->setJointGroupJointIndices(jointGroupIndex, jointGroupJointIndices.data(),
                                               static_cast<std::uint16_t>(jointGroupJointIndices.size()));
    }

    auto blendShapeLODs = source->getBlendShapeChannelLODs();
    destination->setBlendShapeChannelLODs(blendShapeLODs.data(), static_cast<std::uint16_t>(blendShapeLODs.size()));

    auto blendShapeInputIndices = source->getBlendShapeChannelInputIndices();
    destination->setBlendShapeChannelInputIndices(blendShapeInputIndices.data(),
                                                  static_cast<std::uint16_t>(blendShapeInputIndices.size()));

    auto blendShapeOutputIndices = source->getBlendShapeChannelOutputIndices();
    destination->setBlendShapeChannelOutputIndices(blendShapeOutputIndices.data(),
                                                   static_cast<std::uint16_t>(blendShapeOutputIndices.size()));

    auto animatedMapLODs = source->getAnimatedMapLODs();
    destination->setAnimatedMapLODs(animatedMapLODs.data(), static_cast<std::uint16_t>(animatedMapLODs.size()));

    auto animatedMapInputIndices = source->getAnimatedMapInputIndices();
    destination->setAnimatedMapInputIndices(animatedMapInputIndices.data(),
                                            static_cast<std::uint16_t>(animatedMapInputIndices.size()));

    auto animatedMapOutputIndices = source->getAnimatedMapOutputIndices();
    destination->setAnimatedMapOutputIndices(animatedMapOutputIndices.data(),
                                             static_cast<std::uint16_t>(animatedMapOutputIndices.size()));

    auto animatedMapFromValues = source->getAnimatedMapFromValues();
    destination->setAnimatedMapFromValues(animatedMapFromValues.data(), static_cast<std::uint16_t>(animatedMapFromValues.size()));

    auto animatedMapToValues = source->getAnimatedMapToValues();
    destination->setAnimatedMapToValues(animatedMapToValues.data(), static_cast<std::uint16_t>(animatedMapToValues.size()));

    auto animatedMapSlopeValues = source->getAnimatedMapSlopeValues();
    destination->setAnimatedMapSlopeValues(animatedMapSlopeValues.data(),
                                           static_cast<std::uint16_t>(animatedMapSlopeValues.size()));

    auto animatedMapCutValues = source->getAnimatedMapCutValues();
    destination->setAnimatedMapCutValues(animatedMapCutValues.data(), static_cast<std::uint16_t>(animatedMapCutValues.size()));
}

static bool hasGeometry(const GeometryReader* source) {
    // Heuristic for determining whether source DNA actually has any geometry data, or mesh count is non-zero only
    // because of mesh names stored in definition layer
    std::uint32_t totalVertexCount = {};
    std::uint32_t totalVertexNormalCount = {};
    std::uint32_t totalTextureCoordCount = {};
    std::uint32_t totalVertexLayoutCount = {};
    std::uint32_t totalSkinWeightCount = {};
    for (std::uint16_t meshIndex = {}; meshIndex < source->getMeshCount(); ++meshIndex) {
        totalVertexCount += source->getVertexPositionCount(meshIndex);
        totalVertexNormalCount += source->getVertexNormalCount(meshIndex);
        totalTextureCoordCount += source->getVertexTextureCoordinateCount(meshIndex);
        totalVertexLayoutCount += source->getVertexLayoutCount(meshIndex);
        totalSkinWeightCount += source->getSkinWeightsCount(meshIndex);
    }
    return ((totalVertexCount != 0u) || (totalVertexNormalCount != 0u) || (totalTextureCoordCount != 0u) ||
            (totalVertexLayoutCount != 0u) || (totalSkinWeightCount != 0u));
}

static void copyGeometry(const GeometryReader* source, GeometryWriter* destination, MemoryResource* memRes) {
    destination->clearMeshes();

    if (!hasGeometry(source)) {
        // Source DNA was loaded without geometry layer
        return;
    }

    for (std::uint16_t meshIndexPlusOne = source->getMeshCount(); meshIndexPlusOne > 0u; --meshIndexPlusOne) {
        const auto meshIndex = static_cast<std::uint16_t>(meshIndexPlusOne - 1u);
        auto vertexCount = source->getVertexPositionCount(meshIndex);
        auto positions = collect_n<Vector3Vector>(vertexCount, [source, meshIndex](std::size_t index) {
                return source->getVertexPosition(meshIndex, static_cast<std::uint32_t>(index));
            }, memRes);
        destination->setVertexPositions(meshIndex, positions.data(), static_cast<std::uint32_t>(positions.size()));

        auto textureCoordinateCount = source->getVertexTextureCoordinateCount(meshIndex);
        auto textureCoordinates = collect_n<TextureCoordinateVector>(textureCoordinateCount,
                                                                     [source, meshIndex](std::size_t index) {
                return source->getVertexTextureCoordinate(meshIndex, static_cast<std::uint32_t>(index));
            }, memRes);
        destination->setVertexTextureCoordinates(meshIndex, textureCoordinates.data(),
                                                 static_cast<std::uint32_t>(textureCoordinates.size()));

        auto normalCount = source->getVertexNormalCount(meshIndex);
        auto normals = collect_n<Vector3Vector>(normalCount, [source, meshIndex](std::size_t index) {
                return source->getVertexNormal(meshIndex, static_cast<std::uint32_t>(index));
            }, memRes);
        destination->setVertexNormals(meshIndex, normals.data(), static_cast<std::uint32_t>(normals.size()));

        auto layoutCount = source->getVertexLayoutCount(meshIndex);
        auto layouts = collect_n<VertexLayoutVector>(layoutCount, [source, meshIndex](std::size_t index) {
                return source->getVertexLayout(meshIndex, static_cast<std::uint32_t>(index));
            }, memRes);
        destination->setVertexLayouts(meshIndex, layouts.data(), static_cast<std::uint32_t>(layouts.size()));

        for (std::uint32_t faceIndexPlusOne = source->getFaceCount(meshIndex); faceIndexPlusOne > 0u; --faceIndexPlusOne) {
            const auto faceIndex = faceIndexPlusOne - 1u;
            auto faceVertices = source->getFaceVertexLayoutIndices(meshIndex, faceIndex);
            destination->setFaceVertexLayoutIndices(meshIndex, faceIndex, faceVertices.data(),
                                                    static_cast<std::uint32_t>(faceVertices.size()));
        }

        destination->setMaximumInfluencePerVertex(meshIndex, source->getMaximumInfluencePerVertex(meshIndex));

        const auto skinWeightsCount = source->getSkinWeightsCount(meshIndex);
        for (std::uint32_t skinWeightsIndexPlusOne = skinWeightsCount; skinWeightsIndexPlusOne > 0u; --skinWeightsIndexPlusOne) {
            const auto skinWeightsIndex = skinWeightsIndexPlusOne - 1u;
            auto skinWeights = source->getSkinWeightsValues(meshIndex, skinWeightsIndex);
            destination->setSkinWeightsValues(meshIndex, skinWeightsIndex, skinWeights.data(),
                                              static_cast<std::uint16_t>(skinWeights.size()));

            auto skinWeightsJoints = source->getSkinWeightsJointIndices(meshIndex, skinWeightsIndex);
            destination->setSkinWeightsJointIndices(meshIndex, skinWeightsIndex, skinWeightsJoints.data(),
                                                    static_cast<std::uint16_t>(skinWeightsJoints.size()));
        }
    }
}

static bool hasBlendShapeTargets(const GeometryReader* source) {
    // Heuristic for determining whether source DNA actually has any blend shape target data, or mesh count is non-zero only
    // because of mesh names stored in definition layer
    std::uint32_t totalBlendShapeTargetCount = {};
    for (std::uint16_t meshIndex = {}; meshIndex < source->getMeshCount(); ++meshIndex) {
        totalBlendShapeTargetCount += source->getBlendShapeTargetCount(meshIndex);
    }
    return (totalBlendShapeTargetCount != 0u);
}

static void copyBlendShapeTargets(const GeometryReader* source, GeometryWriter* destination, MemoryResource* memRes) {
    if (!hasBlendShapeTargets(source)) {
        // Source DNA was loaded without blend shape targets
        return;
    }

    for (std::uint16_t meshIndexPlusOne = source->getMeshCount(); meshIndexPlusOne > 0u; --meshIndexPlusOne) {
        const auto meshIndex = static_cast<std::uint16_t>(meshIndexPlusOne - 1u);
        for (std::uint16_t blendShapeTargetIndexPlusOne = source->getBlendShapeTargetCount(meshIndex);
             blendShapeTargetIndexPlusOne > 0u;
             --blendShapeTargetIndexPlusOne) {
            const auto blendShapeTargetIndex = static_cast<std::uint16_t>(blendShapeTargetIndexPlusOne - 1u);
            auto channelIndex = source->getBlendShapeChannelIndex(meshIndex, blendShapeTargetIndex);
            destination->setBlendShapeChannelIndex(meshIndex, blendShapeTargetIndex, channelIndex);
            auto deltaCount = source->getBlendShapeTargetDeltaCount(meshIndex, blendShapeTargetIndex);
            auto deltas = collect_n<Vector3Vector>(deltaCount, [source, meshIndex, blendShapeTargetIndex](std::size_t index) {
                    return source->getBlendShapeTargetDelta(meshIndex, blendShapeTargetIndex,
                                                            static_cast<std::uint32_t>(index));
                }, memRes);
            destination->setBlendShapeTargetDeltas(meshIndex, blendShapeTargetIndex, deltas.data(),
                                                   static_cast<std::uint32_t>(deltas.size()));

            auto deltasVertices = source->getBlendShapeTargetVertexIndices(meshIndex, blendShapeTargetIndex);
            destination->setBlendShapeTargetVertexIndices(meshIndex, blendShapeTargetIndex, deltasVertices.data(),
                                                          static_cast<std::uint32_t>(deltasVertices.size()));
        }
    }
}

void Writer::setFrom(const Reader* source, DataLayer layer, MemoryResource* memRes) {
    if (source == nullptr) {
        return;
    }

    const auto bitmask = computeDataLayerBitmask(layer);
    copyDescriptor(source, this, memRes);
    if (contains(bitmask, DataLayerBitmask::Definition)) {
        copyDefinition(source, this, memRes);
    }
    if (contains(bitmask, DataLayerBitmask::Behavior)) {
        copyBehavior(source, this, memRes);
    }
    if (contains(bitmask, DataLayerBitmask::GeometryRest)) {
        copyGeometry(source, this, memRes);
    }
    if (contains(bitmask, DataLayerBitmask::GeometryBlendShapesOnly)) {
        copyBlendShapeTargets(source, this, memRes);
    }
}

}  // namespace dna
