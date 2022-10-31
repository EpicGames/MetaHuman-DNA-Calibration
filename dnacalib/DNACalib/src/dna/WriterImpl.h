// Copyright Epic Games, Inc. All Rights Reserved.

#pragma once

#include "dna/BaseImpl.h"
#include "dna/TypeDefs.h"
#include "dna/utils/Extd.h"

#ifdef _MSC_VER
    #pragma warning(push)
    #pragma warning(disable : 4365 4987)
#endif
#include <cassert>
#include <cstddef>
#include <cstring>
#include <tuple>
#include <utility>
#ifdef _MSC_VER
    #pragma warning(pop)
#endif

namespace dna {

template<class TContainer, typename ... Args>
void ensureHasSize(TContainer& target,
                   std::size_t size,
                   Args&& ... args) {
    target.reserve(size);
    while (target.size() < size) {
        target.push_back(typename TContainer::value_type(std::forward<Args>(args)...));
    }
}

template<class TWriterBase>
class WriterImpl : public TWriterBase, public virtual BaseImpl {
    public:
        explicit WriterImpl(MemoryResource* memRes_);

        // DescriptorWriter methods
        void setName(const char* name) override;
        void setArchetype(Archetype archetype) override;
        void setGender(Gender gender) override;
        void setAge(std::uint16_t age) override;
        void clearMetaData() override;
        void setMetaData(const char* key, const char* value) override;
        void setTranslationUnit(TranslationUnit unit) override;
        void setRotationUnit(RotationUnit unit) override;
        void setCoordinateSystem(CoordinateSystem system) override;
        void setLODCount(std::uint16_t lodCount) override;
        void setDBMaxLOD(std::uint16_t lod) override;
        void setDBComplexity(const char* name) override;
        void setDBName(const char* name) override;

        // DefinitionWriter methods
        void clearGUIControlNames() override;
        void setGUIControlName(std::uint16_t index, const char* name) override;
        void clearRawControlNames() override;
        void setRawControlName(std::uint16_t index, const char* name) override;
        void clearJointNames() override;
        void setJointName(std::uint16_t index, const char* name) override;
        void clearJointIndices() override;
        void setJointIndices(std::uint16_t index, const std::uint16_t* jointIndices, std::uint16_t count) override;
        void clearLODJointMappings() override;
        void setLODJointMapping(std::uint16_t lod, std::uint16_t index) override;
        void clearBlendShapeChannelNames() override;
        void setJointHierarchy(const std::uint16_t* jointIndices, std::uint16_t count) override;
        void setBlendShapeChannelName(std::uint16_t index, const char* name) override;
        void clearBlendShapeChannelIndices() override;
        void setBlendShapeChannelIndices(std::uint16_t index, const std::uint16_t* blendShapeChannelIndices,
                                         std::uint16_t count) override;
        void clearLODBlendShapeChannelMappings() override;
        void setLODBlendShapeChannelMapping(std::uint16_t lod, std::uint16_t index) override;
        void clearAnimatedMapNames() override;
        void setAnimatedMapName(std::uint16_t index, const char* name) override;
        void clearAnimatedMapIndices() override;
        void setAnimatedMapIndices(std::uint16_t index, const std::uint16_t* animatedMapIndices, std::uint16_t count) override;
        void clearLODAnimatedMapMappings() override;
        void setLODAnimatedMapMapping(std::uint16_t lod, std::uint16_t index) override;
        void clearMeshNames() override;
        void setMeshName(std::uint16_t index, const char* name) override;
        void clearMeshIndices() override;
        void setMeshIndices(std::uint16_t index, const std::uint16_t* meshIndices, std::uint16_t count) override;
        void clearLODMeshMappings() override;
        void setLODMeshMapping(std::uint16_t lod, std::uint16_t index) override;
        void clearMeshBlendShapeChannelMappings() override;
        void setMeshBlendShapeChannelMapping(std::uint32_t index, std::uint16_t meshIndex,
                                             std::uint16_t blendShapeChannelIndex) override;
        void setNeutralJointTranslations(const Vector3* translations, std::uint16_t count) override;
        void setNeutralJointRotations(const Vector3* rotations, std::uint16_t count) override;

        // BehaviorWriter methods
        void setGUIToRawInputIndices(const std::uint16_t* inputIndices, std::uint16_t count) override;
        void setGUIToRawOutputIndices(const std::uint16_t* outputIndices, std::uint16_t count) override;
        void setGUIToRawFromValues(const float* fromValues, std::uint16_t count) override;
        void setGUIToRawToValues(const float* toValues, std::uint16_t count) override;
        void setGUIToRawSlopeValues(const float* slopeValues, std::uint16_t count) override;
        void setGUIToRawCutValues(const float* cutValues, std::uint16_t count) override;
        void setPSDCount(std::uint16_t count) override;
        void setPSDRowIndices(const std::uint16_t* rowIndices, std::uint16_t count) override;
        void setPSDColumnIndices(const std::uint16_t* columnIndices, std::uint16_t count) override;
        void setPSDValues(const float* weights, std::uint16_t count) override;
        void setJointRowCount(std::uint16_t rowCount) override;
        void setJointColumnCount(std::uint16_t columnCount) override;
        void clearJointGroups() override;
        void deleteJointGroup(std::uint16_t jointGroupIndex) override;
        void setJointGroupLODs(std::uint16_t jointGroupIndex, const std::uint16_t* lods, std::uint16_t count) override;
        void setJointGroupInputIndices(std::uint16_t jointGroupIndex, const std::uint16_t* inputIndices,
                                       std::uint16_t count) override;
        void setJointGroupOutputIndices(std::uint16_t jointGroupIndex, const std::uint16_t* outputIndices,
                                        std::uint16_t count) override;
        void setJointGroupValues(std::uint16_t jointGroupIndex, const float* values, std::uint32_t count) override;
        void setJointGroupJointIndices(std::uint16_t jointGroupIndex, const std::uint16_t* jointIndices,
                                       std::uint16_t count) override;
        void setBlendShapeChannelLODs(const std::uint16_t* lods, std::uint16_t count) override;
        void setBlendShapeChannelInputIndices(const std::uint16_t* inputIndices, std::uint16_t count) override;
        void setBlendShapeChannelOutputIndices(const std::uint16_t* outputIndices, std::uint16_t count) override;
        void setAnimatedMapLODs(const std::uint16_t* lods, std::uint16_t count) override;
        void setAnimatedMapInputIndices(const std::uint16_t* inputIndices, std::uint16_t count) override;
        void setAnimatedMapOutputIndices(const std::uint16_t* outputIndices, std::uint16_t count) override;
        void setAnimatedMapFromValues(const float* fromValues, std::uint16_t count) override;
        void setAnimatedMapToValues(const float* toValues, std::uint16_t count) override;
        void setAnimatedMapSlopeValues(const float* slopeValues, std::uint16_t count) override;
        void setAnimatedMapCutValues(const float* cutValues, std::uint16_t count) override;

        // GeometryWriter methods
        void clearMeshes() override;
        void deleteMesh(std::uint16_t meshIndex) override;
        void setVertexPositions(std::uint16_t meshIndex, const Position* positions, std::uint32_t count) override;
        void setVertexTextureCoordinates(std::uint16_t meshIndex, const TextureCoordinate* textureCoordinates,
                                         std::uint32_t count) override;
        void setVertexNormals(std::uint16_t meshIndex, const Normal* normals, std::uint32_t count) override;
        void setVertexLayouts(std::uint16_t meshIndex, const VertexLayout* layouts, std::uint32_t count) override;
        void clearFaceVertexLayoutIndices(std::uint16_t meshIndex) override;
        void setFaceVertexLayoutIndices(std::uint16_t meshIndex,
                                        std::uint32_t faceIndex,
                                        const std::uint32_t* layoutIndices,
                                        std::uint32_t count) override;
        void setMaximumInfluencePerVertex(std::uint16_t meshIndex, std::uint16_t maxInfluenceCount) override;
        void clearSkinWeights(std::uint16_t meshIndex) override;
        void setSkinWeightsValues(std::uint16_t meshIndex, std::uint32_t vertexIndex, const float* weights,
                                  std::uint16_t count) override;
        void setSkinWeightsJointIndices(std::uint16_t meshIndex,
                                        std::uint32_t vertexIndex,
                                        const std::uint16_t* jointIndices,
                                        std::uint16_t count) override;
        void clearBlendShapeTargets(std::uint16_t meshIndex) override;
        void setBlendShapeChannelIndex(std::uint16_t meshIndex,
                                       std::uint16_t blendShapeTargetIndex,
                                       std::uint16_t blendShapeChannelIndex) override;
        void setBlendShapeTargetDeltas(std::uint16_t meshIndex,
                                       std::uint16_t blendShapeTargetIndex,
                                       const Delta* deltas,
                                       std::uint32_t count) override;
        void setBlendShapeTargetVertexIndices(std::uint16_t meshIndex,
                                              std::uint16_t blendShapeTargetIndex,
                                              const std::uint32_t* vertexIndices,
                                              std::uint32_t count) override;

};


#ifdef _MSC_VER
    #pragma warning(push)
    #pragma warning(disable : 4589)
#endif
template<class TWriterBase>
WriterImpl<TWriterBase>::WriterImpl(MemoryResource* memRes_) : BaseImpl{memRes_} {
}

#ifdef _MSC_VER
    #pragma warning(pop)
#endif

#ifdef _MSC_VER
    #pragma warning(push)
    #pragma warning(disable : 4505)
#endif
template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setName(const char* name) {
    dna.descriptor.name = name;
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setArchetype(Archetype archetype) {
    dna.descriptor.archetype = static_cast<std::uint16_t>(archetype);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setGender(Gender gender) {
    dna.descriptor.gender = static_cast<std::uint16_t>(gender);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setAge(std::uint16_t age) {
    dna.descriptor.age = age;
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::clearMetaData() {
    dna.descriptor.metadata.clear();
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setMetaData(const char* key, const char* value) {
    using CharStringPair = std::tuple<String<char>, String<char> >;
    auto it = std::find_if(dna.descriptor.metadata.begin(), dna.descriptor.metadata.end(), [&key](const CharStringPair& kv) {
            auto& k = std::get<0>(kv);
            return (std::strlen(key) == k.size() && std::strncmp(k.data(), key, k.size()) == 0);
        });
    if (it == dna.descriptor.metadata.end()) {
        if (value != nullptr) {
            dna.descriptor.metadata.emplace_back(String<char>{key, memRes}, String<char>{value, memRes});
        }
    } else {
        if (value == nullptr) {
            dna.descriptor.metadata.erase(it);
        } else {
            std::get<1>(*it) = value;
        }
    }
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setTranslationUnit(TranslationUnit unit) {
    dna.descriptor.translationUnit = static_cast<std::uint16_t>(unit);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setRotationUnit(RotationUnit unit) {
    dna.descriptor.rotationUnit = static_cast<std::uint16_t>(unit);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setCoordinateSystem(CoordinateSystem system) {
    dna.descriptor.coordinateSystem.xAxis = static_cast<std::uint16_t>(system.xAxis);
    dna.descriptor.coordinateSystem.yAxis = static_cast<std::uint16_t>(system.yAxis);
    dna.descriptor.coordinateSystem.zAxis = static_cast<std::uint16_t>(system.zAxis);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setLODCount(std::uint16_t lodCount) {
    dna.descriptor.lodCount = lodCount;
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setDBMaxLOD(std::uint16_t lod) {
    dna.descriptor.maxLOD = lod;
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setDBComplexity(const char* name) {
    dna.descriptor.complexity = name;
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setDBName(const char* name) {
    dna.descriptor.dbName = name;
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::clearGUIControlNames() {
    dna.definition.guiControlNames.clear();
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setGUIControlName(std::uint16_t index, const char* name) {
    ensureHasSize(dna.definition.guiControlNames, index + 1ul, memRes);
    dna.definition.guiControlNames[index] = name;
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::clearRawControlNames() {
    dna.definition.rawControlNames.clear();
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setRawControlName(std::uint16_t index, const char* name) {
    ensureHasSize(dna.definition.rawControlNames, index + 1ul, memRes);
    dna.definition.rawControlNames[index] = name;
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::clearJointNames() {
    dna.definition.jointNames.clear();
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setJointName(std::uint16_t index, const char* name) {
    ensureHasSize(dna.definition.jointNames, index + 1ul, memRes);
    dna.definition.jointNames[index] = name;
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::clearJointIndices() {
    dna.definition.lodJointMapping.resetIndices();
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setJointIndices(std::uint16_t index, const std::uint16_t* jointIndices,
                                                     std::uint16_t count) {
    dna.definition.lodJointMapping.clearIndices(index);
    dna.definition.lodJointMapping.addIndices(index, jointIndices, count);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::clearLODJointMappings() {
    dna.definition.lodJointMapping.resetLODs();
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setLODJointMapping(std::uint16_t lod, std::uint16_t index) {
    dna.definition.lodJointMapping.associateLODWithIndices(lod, index);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setJointHierarchy(const std::uint16_t* jointIndices, std::uint16_t count) {
    dna.definition.jointHierarchy.assign(jointIndices, jointIndices + count);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::clearBlendShapeChannelNames() {
    dna.definition.blendShapeChannelNames.clear();
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setBlendShapeChannelName(std::uint16_t index, const char* name) {
    ensureHasSize(dna.definition.blendShapeChannelNames, index + 1ul, memRes);
    dna.definition.blendShapeChannelNames[index] = name;
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::clearBlendShapeChannelIndices() {
    dna.definition.lodBlendShapeMapping.resetIndices();
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setBlendShapeChannelIndices(std::uint16_t index,
                                                                 const std::uint16_t* blendShapeChannelIndices,
                                                                 std::uint16_t count) {
    dna.definition.lodBlendShapeMapping.clearIndices(index);
    dna.definition.lodBlendShapeMapping.addIndices(index, blendShapeChannelIndices, count);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::clearLODBlendShapeChannelMappings() {
    dna.definition.lodBlendShapeMapping.resetLODs();
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setLODBlendShapeChannelMapping(std::uint16_t lod, std::uint16_t index) {
    dna.definition.lodBlendShapeMapping.associateLODWithIndices(lod, index);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::clearAnimatedMapNames() {
    dna.definition.animatedMapNames.clear();
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setAnimatedMapName(std::uint16_t index, const char* name) {
    ensureHasSize(dna.definition.animatedMapNames, index + 1ul, memRes);
    dna.definition.animatedMapNames[index] = name;
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::clearAnimatedMapIndices() {
    dna.definition.lodAnimatedMapMapping.resetIndices();
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setAnimatedMapIndices(std::uint16_t index,
                                                           const std::uint16_t* animatedMapIndices,
                                                           std::uint16_t count) {
    dna.definition.lodAnimatedMapMapping.clearIndices(index);
    dna.definition.lodAnimatedMapMapping.addIndices(index, animatedMapIndices, count);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::clearLODAnimatedMapMappings() {
    dna.definition.lodAnimatedMapMapping.resetLODs();
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setLODAnimatedMapMapping(std::uint16_t lod, std::uint16_t index) {
    dna.definition.lodAnimatedMapMapping.associateLODWithIndices(lod, index);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::clearMeshNames() {
    dna.definition.meshNames.clear();
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setMeshName(std::uint16_t index, const char* name) {
    ensureHasSize(dna.definition.meshNames, index + 1ul, memRes);
    dna.definition.meshNames[index] = name;
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::clearMeshIndices() {
    dna.definition.lodMeshMapping.resetIndices();
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setMeshIndices(std::uint16_t index, const std::uint16_t* meshIndices, std::uint16_t count) {
    dna.definition.lodMeshMapping.clearIndices(index);
    dna.definition.lodMeshMapping.addIndices(index, meshIndices, count);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::clearLODMeshMappings() {
    dna.definition.lodMeshMapping.resetLODs();
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setLODMeshMapping(std::uint16_t lod, std::uint16_t index) {
    dna.definition.lodMeshMapping.associateLODWithIndices(lod, index);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::clearMeshBlendShapeChannelMappings() {
    dna.definition.meshBlendShapeChannelMapping.clear();
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setMeshBlendShapeChannelMapping(std::uint32_t index,
                                                                     std::uint16_t meshIndex,
                                                                     std::uint16_t blendShapeChannelIndex) {
    dna.definition.meshBlendShapeChannelMapping.set(index, meshIndex, blendShapeChannelIndex);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setNeutralJointTranslations(const Vector3* translations, std::uint16_t count) {
    dna.definition.neutralJointTranslations.assign(translations, translations + count);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setNeutralJointRotations(const Vector3* rotations, std::uint16_t count) {
    dna.definition.neutralJointRotations.assign(rotations, rotations + count);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setGUIToRawInputIndices(const std::uint16_t* inputIndices, std::uint16_t count) {
    dna.behavior.controls.conditionals.inputIndices.assign(inputIndices, inputIndices + count);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setGUIToRawOutputIndices(const std::uint16_t* outputIndices, std::uint16_t count) {
    dna.behavior.controls.conditionals.outputIndices.assign(outputIndices, outputIndices + count);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setGUIToRawFromValues(const float* fromValues, std::uint16_t count) {
    dna.behavior.controls.conditionals.fromValues.assign(fromValues, fromValues + count);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setGUIToRawToValues(const float* toValues, std::uint16_t count) {
    dna.behavior.controls.conditionals.toValues.assign(toValues, toValues + count);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setGUIToRawSlopeValues(const float* slopeValues, std::uint16_t count) {
    dna.behavior.controls.conditionals.slopeValues.assign(slopeValues, slopeValues + count);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setGUIToRawCutValues(const float* cutValues, std::uint16_t count) {
    dna.behavior.controls.conditionals.cutValues.assign(cutValues, cutValues + count);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setPSDCount(std::uint16_t count) {
    dna.behavior.controls.psdCount = count;
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setPSDRowIndices(const std::uint16_t* rowIndices, std::uint16_t count) {
    dna.behavior.controls.psds.rows.assign(rowIndices, rowIndices + count);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setPSDColumnIndices(const std::uint16_t* columnIndices, std::uint16_t count) {
    dna.behavior.controls.psds.columns.assign(columnIndices, columnIndices + count);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setPSDValues(const float* weights, std::uint16_t count) {
    dna.behavior.controls.psds.values.assign(weights, weights + count);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setJointRowCount(std::uint16_t rowCount) {
    dna.behavior.joints.rowCount = rowCount;
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setJointColumnCount(std::uint16_t columnCount) {
    dna.behavior.joints.colCount = columnCount;
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::clearJointGroups() {
    dna.behavior.joints.jointGroups.clear();
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::deleteJointGroup(std::uint16_t jointGroupIndex) {
    if (jointGroupIndex < dna.behavior.joints.jointGroups.size()) {
        auto it = extd::advanced(dna.behavior.joints.jointGroups.begin(), jointGroupIndex);
        dna.behavior.joints.jointGroups.erase(it);
    }
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setJointGroupLODs(std::uint16_t jointGroupIndex,
                                                       const std::uint16_t* lods,
                                                       std::uint16_t count) {
    auto& jointGroups = dna.behavior.joints.jointGroups;
    ensureHasSize(jointGroups, jointGroupIndex + 1ul, memRes);
    jointGroups[jointGroupIndex].lods.assign(lods, lods + count);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setJointGroupInputIndices(std::uint16_t jointGroupIndex,
                                                               const std::uint16_t* inputIndices,
                                                               std::uint16_t count) {
    auto& jointGroups = dna.behavior.joints.jointGroups;
    ensureHasSize(jointGroups, jointGroupIndex + 1ul, memRes);
    jointGroups[jointGroupIndex].inputIndices.assign(inputIndices, inputIndices + count);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setJointGroupOutputIndices(std::uint16_t jointGroupIndex,
                                                                const std::uint16_t* outputIndices,
                                                                std::uint16_t count) {
    auto& jointGroups = dna.behavior.joints.jointGroups;
    ensureHasSize(jointGroups, jointGroupIndex + 1ul, memRes);
    jointGroups[jointGroupIndex].outputIndices.assign(outputIndices, outputIndices + count);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setJointGroupValues(std::uint16_t jointGroupIndex, const float* values,
                                                         std::uint32_t count) {
    auto& jointGroups = dna.behavior.joints.jointGroups;
    ensureHasSize(jointGroups, jointGroupIndex + 1ul, memRes);
    jointGroups[jointGroupIndex].values.assign(values, values + count);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setJointGroupJointIndices(std::uint16_t jointGroupIndex,
                                                               const std::uint16_t* jointIndices,
                                                               std::uint16_t count) {
    auto& jointGroups = dna.behavior.joints.jointGroups;
    ensureHasSize(jointGroups, jointGroupIndex + 1ul, memRes);
    jointGroups[jointGroupIndex].jointIndices.assign(jointIndices, jointIndices + count);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setBlendShapeChannelLODs(const std::uint16_t* lods, std::uint16_t count) {
    dna.behavior.blendShapeChannels.lods.assign(lods, lods + count);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setBlendShapeChannelInputIndices(const std::uint16_t* inputIndices, std::uint16_t count) {
    dna.behavior.blendShapeChannels.inputIndices.assign(inputIndices, inputIndices + count);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setBlendShapeChannelOutputIndices(const std::uint16_t* outputIndices, std::uint16_t count) {
    dna.behavior.blendShapeChannels.outputIndices.assign(outputIndices, outputIndices + count);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setAnimatedMapLODs(const std::uint16_t* lods, std::uint16_t count) {
    dna.behavior.animatedMaps.lods.assign(lods, lods + count);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setAnimatedMapInputIndices(const std::uint16_t* inputIndices, std::uint16_t count) {
    dna.behavior.animatedMaps.conditionals.inputIndices.assign(inputIndices, inputIndices + count);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setAnimatedMapOutputIndices(const std::uint16_t* outputIndices, std::uint16_t count) {
    dna.behavior.animatedMaps.conditionals.outputIndices.assign(outputIndices, outputIndices + count);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setAnimatedMapFromValues(const float* fromValues, std::uint16_t count) {
    dna.behavior.animatedMaps.conditionals.fromValues.assign(fromValues, fromValues + count);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setAnimatedMapToValues(const float* toValues, std::uint16_t count) {
    dna.behavior.animatedMaps.conditionals.toValues.assign(toValues, toValues + count);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setAnimatedMapSlopeValues(const float* slopeValues, std::uint16_t count) {
    dna.behavior.animatedMaps.conditionals.slopeValues.assign(slopeValues, slopeValues + count);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setAnimatedMapCutValues(const float* cutValues, std::uint16_t count) {
    dna.behavior.animatedMaps.conditionals.cutValues.assign(cutValues, cutValues + count);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::clearMeshes() {
    dna.geometry.meshes.clear();
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::deleteMesh(std::uint16_t meshIndex) {
    if (meshIndex < dna.geometry.meshes.size()) {
        auto it = extd::advanced(dna.geometry.meshes.begin(), meshIndex);
        dna.geometry.meshes.erase(it);
    }
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setVertexPositions(std::uint16_t meshIndex, const Position* positions, std::uint32_t count) {
    ensureHasSize(dna.geometry.meshes, meshIndex + 1ul, memRes);
    dna.geometry.meshes[meshIndex].positions.assign(positions, positions + count);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setVertexTextureCoordinates(std::uint16_t meshIndex,
                                                                 const TextureCoordinate* textureCoordinates,
                                                                 std::uint32_t count) {
    ensureHasSize(dna.geometry.meshes, meshIndex + 1ul, memRes);
    auto& destination = dna.geometry.meshes[meshIndex].textureCoordinates;
    destination.clear();
    destination.us.resize_uninitialized(count);
    destination.vs.resize_uninitialized(count);
    for (std::size_t i = 0ul; i < count; ++i) {
        destination.us[i] = textureCoordinates[i].u;
        destination.vs[i] = textureCoordinates[i].v;
    }
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setVertexNormals(std::uint16_t meshIndex, const Normal* normals, std::uint32_t count) {
    ensureHasSize(dna.geometry.meshes, meshIndex + 1ul, memRes);
    dna.geometry.meshes[meshIndex].normals.assign(normals, normals + count);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setVertexLayouts(std::uint16_t meshIndex, const VertexLayout* layouts, std::uint32_t count) {
    ensureHasSize(dna.geometry.meshes, meshIndex + 1ul, memRes);
    auto& destination = dna.geometry.meshes[meshIndex].layouts;
    destination.clear();
    destination.positions.resize_uninitialized(count);
    destination.textureCoordinates.resize_uninitialized(count);
    destination.normals.resize_uninitialized(count);
    for (std::size_t i = 0ul; i < count; ++i) {
        destination.positions[i] = layouts[i].position;
        destination.textureCoordinates[i] = layouts[i].textureCoordinate;
        destination.normals[i] = layouts[i].normal;
    }
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::clearFaceVertexLayoutIndices(std::uint16_t meshIndex) {
    if (meshIndex < dna.geometry.meshes.size()) {
        dna.geometry.meshes[meshIndex].faces.clear();
    }
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setFaceVertexLayoutIndices(std::uint16_t meshIndex,
                                                                std::uint32_t faceIndex,
                                                                const std::uint32_t* layoutIndices,
                                                                std::uint32_t count) {
    ensureHasSize(dna.geometry.meshes, meshIndex + 1ul, memRes);
    auto& faces = dna.geometry.meshes[meshIndex].faces;
    ensureHasSize(faces, faceIndex + 1ul, memRes);
    faces[faceIndex].layoutIndices.assign(layoutIndices, layoutIndices + count);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setMaximumInfluencePerVertex(std::uint16_t meshIndex, std::uint16_t maxInfluenceCount) {
    ensureHasSize(dna.geometry.meshes, meshIndex + 1ul, memRes);
    dna.geometry.meshes[meshIndex].maximumInfluencePerVertex = maxInfluenceCount;
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::clearSkinWeights(std::uint16_t meshIndex) {
    if (meshIndex < dna.geometry.meshes.size()) {
        dna.geometry.meshes[meshIndex].skinWeights.clear();
    }
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setSkinWeightsValues(std::uint16_t meshIndex,
                                                          std::uint32_t vertexIndex,
                                                          const float* weights,
                                                          std::uint16_t count) {
    ensureHasSize(dna.geometry.meshes, meshIndex + 1ul, memRes);
    auto& skinWeights = dna.geometry.meshes[meshIndex].skinWeights;
    ensureHasSize(skinWeights, vertexIndex + 1ul, memRes);
    skinWeights[vertexIndex].weights.assign(weights, weights + count);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setSkinWeightsJointIndices(std::uint16_t meshIndex,
                                                                std::uint32_t vertexIndex,
                                                                const std::uint16_t* jointIndices,
                                                                std::uint16_t count) {
    ensureHasSize(dna.geometry.meshes, meshIndex + 1ul, memRes);
    auto& skinWeights = dna.geometry.meshes[meshIndex].skinWeights;
    ensureHasSize(skinWeights, vertexIndex + 1ul, memRes);
    skinWeights[vertexIndex].jointIndices.assign(jointIndices, jointIndices + count);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::clearBlendShapeTargets(std::uint16_t meshIndex) {
    if (meshIndex < dna.geometry.meshes.size()) {
        dna.geometry.meshes[meshIndex].blendShapeTargets.clear();
    }
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setBlendShapeChannelIndex(std::uint16_t meshIndex,
                                                               std::uint16_t blendShapeTargetIndex,
                                                               std::uint16_t blendShapeChannelIndex) {
    ensureHasSize(dna.geometry.meshes, meshIndex + 1ul, memRes);
    ensureHasSize(dna.geometry.meshes[meshIndex].blendShapeTargets, blendShapeTargetIndex + 1ul, memRes);
    dna.geometry.meshes[meshIndex].blendShapeTargets[blendShapeTargetIndex].blendShapeChannelIndex = blendShapeChannelIndex;
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setBlendShapeTargetDeltas(std::uint16_t meshIndex,
                                                               std::uint16_t blendShapeTargetIndex,
                                                               const Delta* deltas,
                                                               std::uint32_t count) {
    ensureHasSize(dna.geometry.meshes, meshIndex + 1ul, memRes);
    ensureHasSize(dna.geometry.meshes[meshIndex].blendShapeTargets, blendShapeTargetIndex + 1ul, memRes);
    dna.geometry.meshes[meshIndex].blendShapeTargets[blendShapeTargetIndex].deltas.assign(deltas, deltas + count);
}

template<class TWriterBase>
inline void WriterImpl<TWriterBase>::setBlendShapeTargetVertexIndices(std::uint16_t meshIndex,
                                                                      std::uint16_t blendShapeTargetIndex,
                                                                      const std::uint32_t* vertexIndices,
                                                                      std::uint32_t count) {
    ensureHasSize(dna.geometry.meshes, meshIndex + 1ul, memRes);
    auto& blendShapeTargets = dna.geometry.meshes[meshIndex].blendShapeTargets;
    ensureHasSize(blendShapeTargets, blendShapeTargetIndex + 1ul, memRes);
    blendShapeTargets[blendShapeTargetIndex].vertexIndices.assign(vertexIndices, vertexIndices + count);
}

#ifdef _MSC_VER
    #pragma warning(pop)
#endif

}  // namespace dna
