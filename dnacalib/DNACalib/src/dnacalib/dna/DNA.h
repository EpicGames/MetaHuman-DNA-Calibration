// Copyright Epic Games, Inc. All Rights Reserved.

#pragma once

#include "dnacalib/TypeDefs.h"
#include "dnacalib/dna/LODMapping.h"
#include "dnacalib/dna/SurjectiveMapping.h"

#include <terse/types/ArchiveOffset.h>

#ifdef _MSC_VER
    #pragma warning(push)
    #pragma warning(disable : 4365 4987)
#endif
#include <algorithm>
#include <array>
#include <cassert>
#include <cstddef>
#include <cstdint>
#include <iterator>
#include <memory>
#include <tuple>
#ifdef _MSC_VER
    #pragma warning(pop)
#endif

namespace dnac {

template<typename TFrom, typename TTo = TFrom>
struct RawSurjectiveMapping : public SurjectiveMapping<TFrom, TTo> {
    using SurjectiveMapping<TFrom, TTo>::SurjectiveMapping;

    template<class Archive>
    void serialize(Archive& archive) {
        archive.label("from");
        archive(this->from);
        archive.label("to");
        archive(this->to);
    }

};

template<typename T>
struct ExpectedValue {
    T expected;
    T got;

    explicit ExpectedValue(const T& value) : expected{value}, got{} {
    }

    template<class Archive>
    void load(Archive& archive) {
        archive.label("value");
        archive(got);
    }

    template<class Archive>
    void save(Archive& archive) {
        archive.label("value");
        archive(expected);
    }

    bool matches() const {
        return (expected == got);
    }

};

template<std::size_t Size>
struct Signature {
    using SignatureValueType = std::array<char, Size>;

    ExpectedValue<SignatureValueType> value;

    explicit Signature(SignatureValueType bytes) : value{bytes} {
    }

    template<class Archive>
    void serialize(Archive& archive) {
        archive.label("data");
        archive(value);
    }

    bool matches() const {
        return value.matches();
    }

};

struct Version {
    ExpectedValue<std::uint16_t> generation;
    ExpectedValue<std::uint16_t> version;

    Version(std::uint16_t generation_, std::uint16_t version_) :
        generation{generation_},
        version{version_} {
    }

    template<class Archive>
    void serialize(Archive& archive) {
        archive.label("generation");
        archive(generation);
        archive.label("version");
        archive(version);
    }

    bool matches() const {
        return (generation.matches() && version.matches());
    }

};

struct SectionLookupTable {
    terse::ArchiveOffset<std::uint32_t> descriptor;
    terse::ArchiveOffset<std::uint32_t> definition;
    terse::ArchiveOffset<std::uint32_t> behavior;
    terse::ArchiveOffset<std::uint32_t> controls;
    terse::ArchiveOffset<std::uint32_t> joints;
    terse::ArchiveOffset<std::uint32_t> blendShapeChannels;
    terse::ArchiveOffset<std::uint32_t> animatedMaps;
    terse::ArchiveOffset<std::uint32_t> geometry;

    template<class Archive>
    void serialize(Archive& archive) {
        archive.label("descriptor");
        archive(descriptor);
        archive.label("definition");
        archive(definition);
        archive.label("behavior");
        archive(behavior);
        archive.label("controls");
        archive(controls);
        archive.label("joints");
        archive(joints);
        archive.label("blendShapeChannels");
        archive(blendShapeChannels);
        archive.label("animatedMaps");
        archive(animatedMaps);
        archive.label("geometry");
        archive(geometry);
    }

};

struct RawCoordinateSystem {
    std::uint16_t xAxis;
    std::uint16_t yAxis;
    std::uint16_t zAxis;

    template<class Archive>
    void serialize(Archive& archive) {
        archive.label("xAxis");
        archive(xAxis);
        archive.label("yAxis");
        archive(yAxis);
        archive.label("zAxis");
        archive(zAxis);
    }

};

struct RawLODMapping : public LODMapping {
    using LODMapping::LODMapping;

    template<class Archive>
    void serialize(Archive& archive) {
        archive.label("lods");
        archive(lods);
        archive.label("indices");
        archive(indices);
    }

};

struct RawDescriptor {
    using StringPair = std::tuple<String<char>, String<char> >;

    terse::ArchiveOffset<std::uint32_t>::Proxy marker;
    String<char> name;
    std::uint16_t archetype;
    std::uint16_t gender;
    std::uint16_t age;
    Vector<StringPair> metadata;
    std::uint16_t translationUnit;
    std::uint16_t rotationUnit;
    RawCoordinateSystem coordinateSystem;
    std::uint16_t lodCount;
    std::uint16_t maxLOD;
    String<char> complexity;
    String<char> dbName;

    RawDescriptor(terse::ArchiveOffset<std::uint32_t>& markerTarget, MemoryResource* memRes) :
        marker{markerTarget},
        name{memRes},
        archetype{},
        gender{},
        age{},
        metadata{memRes},
        translationUnit{},
        rotationUnit{},
        coordinateSystem{},
        lodCount{},
        maxLOD{},
        complexity{memRes},
        dbName{memRes} {
    }

    template<class Archive>
    void serialize(Archive& archive) {
        archive(marker);
        archive.label("name");
        archive(name);
        archive.label("archetype");
        archive(archetype);
        archive.label("gender");
        archive(gender);
        archive.label("age");
        archive(age);
        archive.label("metadata");
        archive(metadata);
        archive.label("translationUnit");
        archive(translationUnit);
        archive.label("rotationUnit");
        archive(rotationUnit);
        archive.label("coordinateSystem");
        archive(coordinateSystem);
        archive.label("lodCount");
        archive(lodCount);
        archive.label("maxLOD");
        archive(maxLOD);
        archive.label("complexity");
        archive(complexity);
        archive.label("dbName");
        archive(dbName);
    }

};

struct RawVector3Vector {
    AlignedDynArray<float> xs;
    AlignedDynArray<float> ys;
    AlignedDynArray<float> zs;

    explicit RawVector3Vector(MemoryResource* memRes) :
        xs{memRes},
        ys{memRes},
        zs{memRes} {
    }

    RawVector3Vector(std::size_t size_, float initial, MemoryResource* memRes) :
        xs{size_, initial, memRes},
        ys{size_, initial, memRes},
        zs{size_, initial, memRes} {
    }

    RawVector3Vector(ConstArrayView<float> xs_, ConstArrayView<float> ys_, ConstArrayView<float> zs_, MemoryResource* memRes) :
        xs{xs_.begin(), xs_.end(), memRes},
        ys{ys_.begin(), ys_.end(), memRes},
        zs{zs_.begin(), zs_.end(), memRes} {
    }

    template<class Archive>
    void serialize(Archive& archive) {
        archive.label("xs");
        archive(xs);
        archive.label("ys");
        archive(ys);
        archive.label("zs");
        archive(zs);
    }

    std::size_t size() const {
        assert(xs.size() == ys.size() && ys.size() == zs.size());
        return xs.size();
    }

    void reserve(std::size_t count) {
        xs.resize_uninitialized(count);
        ys.resize_uninitialized(count);
        zs.resize_uninitialized(count);
    }

    void resize(std::size_t count) {
        xs.resize(count);
        ys.resize(count);
        zs.resize(count);
    }

    void resize(std::size_t count, float value) {
        xs.resize(count, value);
        ys.resize(count, value);
        zs.resize(count, value);
    }

    void clear() {
        xs.clear();
        ys.clear();
        zs.clear();
    }

    template<typename Iterator>
    void assign(Iterator start, Iterator end) {
        reserve(static_cast<std::size_t>(std::distance(start, end)));
        std::size_t i{};
        for (auto it = start; it != end; ++it, ++i) {
            xs[i] = it->x;
            ys[i] = it->y;
            zs[i] = it->z;
        }
    }

};

struct RawDefinition {
    terse::ArchiveOffset<std::uint32_t>::Proxy marker;
    RawLODMapping lodJointMapping;
    RawLODMapping lodBlendShapeMapping;
    RawLODMapping lodAnimatedMapMapping;
    RawLODMapping lodMeshMapping;
    Vector<String<char> > guiControlNames;
    Vector<String<char> > rawControlNames;
    Vector<String<char> > jointNames;
    Vector<String<char> > blendShapeChannelNames;
    Vector<String<char> > animatedMapNames;
    Vector<String<char> > meshNames;
    RawSurjectiveMapping<std::uint16_t> meshBlendShapeChannelMapping;
    DynArray<std::uint16_t> jointHierarchy;
    RawVector3Vector neutralJointTranslations;
    RawVector3Vector neutralJointRotations;

    RawDefinition(terse::ArchiveOffset<std::uint32_t>& markerTarget, MemoryResource* memRes) :
        marker{markerTarget},
        lodJointMapping{memRes},
        lodBlendShapeMapping{memRes},
        lodAnimatedMapMapping{memRes},
        lodMeshMapping{memRes},
        guiControlNames{memRes},
        rawControlNames{memRes},
        jointNames{memRes},
        blendShapeChannelNames{memRes},
        animatedMapNames{memRes},
        meshNames{memRes},
        meshBlendShapeChannelMapping{memRes},
        jointHierarchy{memRes},
        neutralJointTranslations{memRes},
        neutralJointRotations{memRes} {
    }

    template<class Archive>
    void serialize(Archive& archive) {
        archive(marker);
        archive.label("lodJointMapping");
        archive(lodJointMapping);
        archive.label("lodBlendShapeMapping");
        archive(lodBlendShapeMapping);
        archive.label("lodAnimatedMapMapping");
        archive(lodAnimatedMapMapping);
        archive.label("lodMeshMapping");
        archive(lodMeshMapping);
        archive.label("guiControlNames");
        archive(guiControlNames);
        archive.label("rawControlNames");
        archive(rawControlNames);
        archive.label("jointNames");
        archive(jointNames);
        archive.label("blendShapeChannelNames");
        archive(blendShapeChannelNames);
        archive.label("animatedMapNames");
        archive(animatedMapNames);
        archive.label("meshNames");
        archive(meshNames);
        archive.label("meshBlendShapeChannelMapping");
        archive(meshBlendShapeChannelMapping);
        archive.label("jointHierarchy");
        archive(jointHierarchy);
        archive.label("neutralJointTranslations");
        archive(neutralJointTranslations);
        archive.label("neutralJointRotations");
        archive(neutralJointRotations);
    }

};

struct RawConditionalTable {
    DynArray<std::uint16_t> inputIndices;
    DynArray<std::uint16_t> outputIndices;
    DynArray<float> fromValues;
    DynArray<float> toValues;
    DynArray<float> slopeValues;
    DynArray<float> cutValues;

    explicit RawConditionalTable(MemoryResource* memRes) :
        inputIndices{memRes},
        outputIndices{memRes},
        fromValues{memRes},
        toValues{memRes},
        slopeValues{memRes},
        cutValues{memRes} {
    }

    template<class Archive>
    void serialize(Archive& archive) {
        archive.label("inputIndices");
        archive(inputIndices);
        archive.label("outputIndices");
        archive(outputIndices);
        archive.label("fromValues");
        archive(fromValues);
        archive.label("toValues");
        archive(toValues);
        archive.label("slopeValues");
        archive(slopeValues);
        archive.label("cutValues");
        archive(cutValues);
    }

};

struct RawPSDMatrix {
    DynArray<std::uint16_t> rows;
    DynArray<std::uint16_t> columns;
    DynArray<float> values;

    explicit RawPSDMatrix(MemoryResource* memRes) :
        rows{memRes},
        columns{memRes},
        values{memRes} {
    }

    template<class Archive>
    void serialize(Archive& archive) {
        archive.label("rows");
        archive(rows);
        archive.label("columns");
        archive(columns);
        archive.label("values");
        archive(values);
    }

};

struct RawControls {
    std::uint16_t psdCount;
    RawConditionalTable conditionals;
    RawPSDMatrix psds;

    explicit RawControls(MemoryResource* memRes) :
        psdCount{},
        conditionals{memRes},
        psds{memRes} {
    }

    template<class Archive>
    void serialize(Archive& archive) {
        archive.label("psdCount");
        archive(psdCount);
        archive.label("conditionals");
        archive(conditionals);
        archive.label("psds");
        archive(psds);
    }

};

struct RawJointGroup {
    // Row count of each LOD
    // 12, 9, 3,
    // |  |  + LOD-2 contains first 3 rows
    // |  + LOD-1 contains first 9 rows
    // + LOD-0 contains first 12 rows
    DynArray<std::uint16_t> lods;
    // Sub-matrix col -> input vector
    DynArray<std::uint16_t> inputIndices;
    // Sub-matrix row -> output vector
    DynArray<std::uint16_t> outputIndices;
    // Non-zero values of all sub-matrices
    AlignedDynArray<float> values;

    DynArray<std::uint16_t> jointIndices;

    explicit RawJointGroup(MemoryResource* memRes) :
        lods{memRes},
        inputIndices{memRes},
        outputIndices{memRes},
        values{memRes},
        jointIndices{memRes} {
    }

    template<class Archive>
    void serialize(Archive& archive) {
        archive.label("lods");
        archive(lods);
        archive.label("inputIndices");
        archive(inputIndices);
        archive.label("outputIndices");
        archive(outputIndices);
        archive.label("values");
        archive(values);
        archive.label("jointIndices");
        archive(jointIndices);
    }

};

struct RawJoints {
    std::uint16_t rowCount;
    std::uint16_t colCount;
    Vector<RawJointGroup> jointGroups;

    explicit RawJoints(MemoryResource* memRes) :
        rowCount{},
        colCount{},
        jointGroups{memRes} {
    }

    template<class Archive>
    void serialize(Archive& archive) {
        archive.label("rowCount");
        archive(rowCount);
        archive.label("colCount");
        archive(colCount);
        archive.label("jointGroups");
        archive(jointGroups);
    }

};

struct RawBlendShapeChannels {
    DynArray<std::uint16_t> lods;
    DynArray<std::uint16_t> inputIndices;
    DynArray<std::uint16_t> outputIndices;

    explicit RawBlendShapeChannels(MemoryResource* memRes) :
        lods{memRes},
        inputIndices{memRes},
        outputIndices{memRes} {
    }

    template<class Archive>
    void serialize(Archive& archive) {
        archive.label("lods");
        archive(lods);
        archive.label("inputIndices");
        archive(inputIndices);
        archive.label("outputIndices");
        archive(outputIndices);
    }

};

struct RawAnimatedMaps {
    DynArray<std::uint16_t> lods;
    RawConditionalTable conditionals;

    explicit RawAnimatedMaps(MemoryResource* memRes) :
        lods{memRes},
        conditionals{memRes} {
    }

    template<class Archive>
    void serialize(Archive& archive) {
        archive.label("lods");
        archive(lods);
        archive.label("conditionals");
        archive(conditionals);
    }

};

struct RawBehavior {
    terse::ArchiveOffset<std::uint32_t>::Proxy marker;

    terse::ArchiveOffset<std::uint32_t>::Proxy controlsMarker;
    RawControls controls;

    terse::ArchiveOffset<std::uint32_t>::Proxy jointsMarker;
    RawJoints joints;

    terse::ArchiveOffset<std::uint32_t>::Proxy blendShapeChannelsMarker;
    RawBlendShapeChannels blendShapeChannels;

    terse::ArchiveOffset<std::uint32_t>::Proxy animatedMapsMarker;
    RawAnimatedMaps animatedMaps;

    RawBehavior(terse::ArchiveOffset<std::uint32_t>& markerTarget,
                terse::ArchiveOffset<std::uint32_t>& controlsMarkerTarget,
                terse::ArchiveOffset<std::uint32_t>& jointsMarkerTarget,
                terse::ArchiveOffset<std::uint32_t>& blendShapeChannelsMarkerTarget,
                terse::ArchiveOffset<std::uint32_t>& animatedMapsMarkerTarget,
                MemoryResource* memRes) :
        marker{markerTarget},
        controlsMarker{controlsMarkerTarget},
        controls{memRes},
        jointsMarker{jointsMarkerTarget},
        joints{memRes},
        blendShapeChannelsMarker{blendShapeChannelsMarkerTarget},
        blendShapeChannels{memRes},
        animatedMapsMarker{animatedMapsMarkerTarget},
        animatedMaps{memRes} {
    }

    template<class Archive>
    void serialize(Archive& archive) {
        archive(marker, controlsMarker);
        archive.label("controls");
        archive(controls);
        archive(jointsMarker);
        archive.label("joints");
        archive(joints);
        archive(blendShapeChannelsMarker);
        archive.label("blendShapeChannels");
        archive(blendShapeChannels);
        archive(animatedMapsMarker);
        archive.label("animatedMaps");
        archive(animatedMaps);
    }

};

struct RawTextureCoordinateVector {
    DynArray<float> us;
    DynArray<float> vs;

    explicit RawTextureCoordinateVector(MemoryResource* memRes) :
        us{memRes},
        vs{memRes} {
    }

    template<class Archive>
    void serialize(Archive& archive) {
        archive.label("us");
        archive(us);
        archive.label("vs");
        archive(vs);
    }

    std::size_t size() const {
        assert(us.size() == vs.size());
        return us.size();
    }

    void clear() {
        us.clear();
        vs.clear();
    }

};

struct RawVertexLayoutVector {
    DynArray<std::uint32_t> positions;
    DynArray<std::uint32_t> textureCoordinates;
    DynArray<std::uint32_t> normals;

    explicit RawVertexLayoutVector(MemoryResource* memRes) :
        positions{memRes},
        textureCoordinates{memRes},
        normals{memRes} {
    }

    template<class Archive>
    void serialize(Archive& archive) {
        archive.label("positions");
        archive(positions);
        archive.label("textureCoordinates");
        archive(textureCoordinates);
        archive.label("normals");
        archive(normals);
    }

    std::size_t size() const {
        assert(positions.size() == textureCoordinates.size() && textureCoordinates.size() == normals.size());
        return positions.size();
    }

    void clear() {
        positions.clear();
        textureCoordinates.clear();
        normals.clear();
    }

};

struct RawFace {
    DynArray<std::uint32_t> layoutIndices;

    explicit RawFace(MemoryResource* memRes) :
        layoutIndices{memRes} {
    }

    template<class Archive>
    void serialize(Archive& archive) {
        archive.label("layoutIndices");
        archive(layoutIndices);
    }

};

struct RawVertexSkinWeights {
    AlignedDynArray<float> weights;
    DynArray<std::uint16_t> jointIndices;

    explicit RawVertexSkinWeights(MemoryResource* memRes) :
        weights{memRes},
        jointIndices{memRes} {
    }

    template<class Archive>
    void serialize(Archive& archive) {
        archive.label("weights");
        archive(weights);
        archive.label("jointIndices");
        archive(jointIndices);
    }

};

struct RawBlendShapeTarget {
    RawVector3Vector deltas;
    DynArray<std::uint32_t> vertexIndices;
    std::uint16_t blendShapeChannelIndex;

    explicit RawBlendShapeTarget(MemoryResource* memRes) :
        deltas{memRes},
        vertexIndices{memRes},
        blendShapeChannelIndex{} {
    }

    template<class Archive>
    void serialize(Archive& archive) {
        archive.label("deltas");
        archive(deltas);
        archive.label("vertexIndices");
        archive(vertexIndices);
        archive.label("blendShapeChannelIndex");
        archive(blendShapeChannelIndex);
    }

};

struct RawMesh {
    terse::ArchiveOffset<std::uint32_t> offset;
    RawVector3Vector positions;
    RawTextureCoordinateVector textureCoordinates;
    RawVector3Vector normals;
    RawVertexLayoutVector layouts;
    Vector<RawFace> faces;
    std::uint16_t maximumInfluencePerVertex;
    Vector<RawVertexSkinWeights> skinWeights;
    Vector<RawBlendShapeTarget> blendShapeTargets;
    terse::ArchiveOffset<std::uint32_t>::Proxy marker;

    explicit RawMesh(MemoryResource* memRes) :
        offset{},
        positions{memRes},
        textureCoordinates{memRes},
        normals{memRes},
        layouts{memRes},
        faces{memRes},
        maximumInfluencePerVertex{},
        skinWeights{memRes},
        blendShapeTargets{memRes},
        marker{offset} {
    }

    template<class Archive>
    void serialize(Archive& archive) {
        archive.label("offset");
        archive(offset);
        archive.label("positions");
        archive(positions);
        archive.label("textureCoordinates");
        archive(textureCoordinates);
        archive.label("normals");
        archive(normals);
        archive.label("layouts");
        archive(layouts);
        archive.label("faces");
        archive(faces);
        archive.label("maximumInfluencePerVertex");
        archive(maximumInfluencePerVertex);
        archive.label("skinWeights");
        archive(skinWeights);
        archive.label("blendShapeTargets");
        archive(blendShapeTargets);
        archive(marker);
    }

};

struct RawGeometry {
    terse::ArchiveOffset<std::uint32_t>::Proxy marker;
    Vector<RawMesh> meshes;

    RawGeometry(terse::ArchiveOffset<std::uint32_t>& markerTarget, MemoryResource* memRes) :
        marker{markerTarget},
        meshes{memRes} {
    }

    template<class Archive>
    void serialize(Archive& archive) {
        archive(marker);
        archive.label("meshes");
        archive(meshes);
    }

};

struct DNA {
    MemoryResource* memRes;
    Signature<3> signature{{'D', 'N', 'A'}};
    Version version{2, 1};
    SectionLookupTable sections;
    RawDescriptor descriptor;
    RawDefinition definition;
    RawBehavior behavior;
    RawGeometry geometry;
    Signature<3> eof{{'A', 'N', 'D'}};

    explicit DNA(MemoryResource* memRes_) :
        memRes{memRes_},
        sections{},
        descriptor{sections.descriptor, memRes},
        definition{sections.definition, memRes},
        behavior{sections.behavior,
                 sections.controls,
                 sections.joints,
                 sections.blendShapeChannels,
                 sections.animatedMaps,
                 memRes},
        geometry{sections.geometry, memRes} {
    }

    template<class Archive>
    void load(Archive& archive) {
        archive.label("signature");
        archive(signature);
        archive.label("version");
        archive(version);
        if (signature.matches() && version.matches()) {
            archive.label("sections");
            archive(sections);
            archive.label("descriptor");
            archive(descriptor);
            archive.label("definition");
            archive(definition);
            archive.label("behavior");
            archive(behavior);
            archive.label("geometry");
            archive(geometry);
            archive.label("eof");
            archive(eof);
            assert(eof.matches());
        }
    }

    template<class Archive>
    void save(Archive& archive) {
        archive.label("signature");
        archive(signature);
        archive.label("version");
        archive(version);
        archive.label("sections");
        archive(sections);
        archive.label("descriptor");
        archive(descriptor);
        archive.label("definition");
        archive(definition);
        archive.label("behavior");
        archive(behavior);
        archive.label("geometry");
        archive(geometry);
        archive.label("eof");
        archive(eof);
    }

    void unloadDefinition() {
        definition = RawDefinition{sections.definition, memRes};
    }

    void unloadBehavior() {
        behavior =
            RawBehavior{sections.behavior, sections.controls, sections.joints, sections.blendShapeChannels, sections.animatedMaps,
                        memRes};
    }

    void unloadGeometry() {
        geometry = RawGeometry{sections.geometry, memRes};
    }

};

}  // namespace dnac
