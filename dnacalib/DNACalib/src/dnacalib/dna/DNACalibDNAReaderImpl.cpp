// Copyright Epic Games, Inc. All Rights Reserved.

#include "dnacalib/dna/DNACalibDNAReaderImpl.h"

#include "dnacalib/TypeDefs.h"
#include "dnacalib/dna/filters/JointFilter.h"
#include "dnacalib/dna/filters/MeshFilter.h"
#include "dnacalib/utils/Extd.h"

namespace dnac {

DNACalibDNAReader::~DNACalibDNAReader() = default;

DNACalibDNAReaderImpl::~DNACalibDNAReaderImpl() = default;

DNACalibDNAReader* DNACalibDNAReader::create(MemoryResource* memRes) {
    PolyAllocator<DNACalibDNAReaderImpl> alloc{memRes};
    return alloc.newObject(memRes);
}

DNACalibDNAReader* DNACalibDNAReader::create(const dna::Reader* reader, MemoryResource* memRes) {
    auto instance = static_cast<DNACalibDNAReaderImpl*>(create(memRes));
    instance->setFrom(reader, dna::DataLayer::All, memRes);
    return instance;
}

void DNACalibDNAReader::destroy(DNACalibDNAReader* instance) {
    // NOLINTNEXTLINE(cppcoreguidelines-pro-type-static-cast-downcast)
    auto ptr = static_cast<DNACalibDNAReaderImpl*>(instance);
    PolyAllocator<DNACalibDNAReaderImpl> alloc{ptr->getMemoryResource()};
    alloc.deleteObject(ptr);
}

DNACalibDNAReaderImpl::DNACalibDNAReaderImpl(MemoryResource* memRes_) :
    BaseImpl{memRes_},
    ReaderImpl{memRes_},
    WriterImpl{memRes_} {
}

void DNACalibDNAReaderImpl::setLODCount(std::uint16_t lodCount) {
    dna.descriptor.lodCount = lodCount;
}

void DNACalibDNAReaderImpl::setNeutralJointTranslations(ConstArrayView<float> xs,
                                                        ConstArrayView<float> ys,
                                                        ConstArrayView<float> zs) {
    dna.definition.neutralJointTranslations.xs.assign(xs.begin(), xs.end());
    dna.definition.neutralJointTranslations.ys.assign(ys.begin(), ys.end());
    dna.definition.neutralJointTranslations.zs.assign(zs.begin(), zs.end());
}

void DNACalibDNAReaderImpl::setNeutralJointTranslations(RawVector3Vector&& translations) {
    dna.definition.neutralJointTranslations = std::move(translations);
}

void DNACalibDNAReaderImpl::setNeutralJointTranslation(std::uint16_t index, const Vector3& translation) {
    if (index >= dna.definition.neutralJointTranslations.size()) {
        dna.definition.neutralJointTranslations.xs.resize(index + 1ul, 0.0f);
        dna.definition.neutralJointTranslations.ys.resize(index + 1ul, 0.0f);
        dna.definition.neutralJointTranslations.zs.resize(index + 1ul, 0.0f);
    }
    dna.definition.neutralJointTranslations.xs[index] = translation.x;
    dna.definition.neutralJointTranslations.ys[index] = translation.y;
    dna.definition.neutralJointTranslations.zs[index] = translation.z;
}

void DNACalibDNAReaderImpl::setNeutralJointRotations(ConstArrayView<float> xs, ConstArrayView<float> ys,
                                                     ConstArrayView<float> zs) {
    dna.definition.neutralJointRotations.xs.assign(xs.begin(), xs.end());
    dna.definition.neutralJointRotations.ys.assign(ys.begin(), ys.end());
    dna.definition.neutralJointRotations.zs.assign(zs.begin(), zs.end());
}

void DNACalibDNAReaderImpl::setNeutralJointRotations(RawVector3Vector&& rotations) {
    dna.definition.neutralJointRotations = std::move(rotations);
}

void DNACalibDNAReaderImpl::setNeutralJointRotation(std::uint16_t index, const Vector3& rotation) {
    if (index >= dna.definition.neutralJointTranslations.size()) {
        dna.definition.neutralJointRotations.xs.resize(index + 1ul, 0.0f);
        dna.definition.neutralJointRotations.ys.resize(index + 1ul, 0.0f);
        dna.definition.neutralJointRotations.zs.resize(index + 1ul, 0.0f);
    }
    dna.definition.neutralJointRotations.xs[index] = rotation.x;
    dna.definition.neutralJointRotations.ys[index] = rotation.y;
    dna.definition.neutralJointRotations.zs[index] = rotation.z;
}

void DNACalibDNAReaderImpl::setJointGroupValues(std::uint16_t jointGroupIndex, AlignedDynArray<float>&& values) {
    ensureHasSize(dna.behavior.joints.jointGroups, jointGroupIndex + 1ul, memRes);
    dna.behavior.joints.jointGroups[jointGroupIndex].values = std::move(values);
}

void DNACalibDNAReaderImpl::setVertexPositions(std::uint16_t meshIndex,
                                               ConstArrayView<float> xs,
                                               ConstArrayView<float> ys,
                                               ConstArrayView<float> zs) {
    ensureHasSize(dna.geometry.meshes, meshIndex + 1ul, memRes);
    dna.geometry.meshes[meshIndex].positions.xs.assign(xs.begin(), xs.end());
    dna.geometry.meshes[meshIndex].positions.ys.assign(ys.begin(), ys.end());
    dna.geometry.meshes[meshIndex].positions.zs.assign(zs.begin(), zs.end());
}

void DNACalibDNAReaderImpl::setVertexPositions(std::uint16_t meshIndex, RawVector3Vector&& positions) {
    ensureHasSize(dna.geometry.meshes, meshIndex + 1ul, memRes);
    dna.geometry.meshes[meshIndex].positions = std::move(positions);
}

void DNACalibDNAReaderImpl::setBlendShapeTargetDeltas(std::uint16_t meshIndex,
                                                      std::uint16_t blendShapeTargetIndex,
                                                      ConstArrayView<float> xs,
                                                      ConstArrayView<float> ys,
                                                      ConstArrayView<float> zs) {
    ensureHasSize(dna.geometry.meshes, meshIndex + 1ul, memRes);
    ensureHasSize(dna.geometry.meshes[meshIndex].blendShapeTargets, blendShapeTargetIndex + 1ul, memRes);
    dna.geometry.meshes[meshIndex].blendShapeTargets[blendShapeTargetIndex].deltas.xs.assign(xs.begin(), xs.end());
    dna.geometry.meshes[meshIndex].blendShapeTargets[blendShapeTargetIndex].deltas.ys.assign(ys.begin(), ys.end());
    dna.geometry.meshes[meshIndex].blendShapeTargets[blendShapeTargetIndex].deltas.zs.assign(zs.begin(), zs.end());
}

void DNACalibDNAReaderImpl::setBlendShapeTargetDeltas(std::uint16_t meshIndex,
                                                      std::uint16_t blendShapeTargetIndex,
                                                      RawVector3Vector&& deltas) {
    ensureHasSize(dna.geometry.meshes, meshIndex + 1ul, memRes);
    ensureHasSize(dna.geometry.meshes[meshIndex].blendShapeTargets, blendShapeTargetIndex + 1ul, memRes);
    dna.geometry.meshes[meshIndex].blendShapeTargets[blendShapeTargetIndex].deltas = std::move(deltas);
}

void DNACalibDNAReaderImpl::pruneBlendShapeTargets(float threshold) {
    const float threshold2 = threshold * threshold;
    for (auto& mesh : dna.geometry.meshes) {
        for (auto& bst : mesh.blendShapeTargets) {
            std::size_t di{};
            for (std::size_t si{}; si < bst.deltas.size(); ++si) {
                const float magnitude2 = (bst.deltas.xs[si] * bst.deltas.xs[si]) +
                    (bst.deltas.ys[si] * bst.deltas.ys[si]) +
                    (bst.deltas.zs[si] * bst.deltas.zs[si]);
                if (magnitude2 > threshold2) {
                    bst.deltas.xs[di] = bst.deltas.xs[si];
                    bst.deltas.ys[di] = bst.deltas.ys[si];
                    bst.deltas.zs[di] = bst.deltas.zs[si];
                    bst.vertexIndices[di] = bst.vertexIndices[si];
                    ++di;
                }
            }
            bst.deltas.resize(di);
            bst.vertexIndices.resize(di);
        }
    }
}

void DNACalibDNAReaderImpl::removeMesh(std::uint16_t meshIndex) {
    // Filter and remap mesh names and indices
    dna.definition.lodMeshMapping.filterIndices([meshIndex](std::uint16_t value) {
            return (value != meshIndex);
        });
    // Collect all distinct element position indices that are referenced by the present LODs
    UnorderedSet<std::uint16_t> allowedMeshIndices = dna.definition.lodMeshMapping.getCombinedDistinctIndices(memRes);

    MeshFilter meshFilter{memRes};
    meshFilter.configure(static_cast<std::uint16_t>(dna.definition.meshNames.size()), std::move(allowedMeshIndices));
    meshFilter.apply(dna.definition);
    // Remove mesh geometry
    extd::filter(dna.geometry.meshes, [&meshFilter](const RawMesh&  /*unused*/, std::size_t index) {
            return meshFilter.passes(static_cast<std::uint16_t>(index));
        });
    // Repopulate cache of (mesh, blend shape) mapping per LOD
    cache.meshBlendShapeMappingIndices.reset();
    cache.populate(this);
}

void DNACalibDNAReaderImpl::removeJoint(std::uint16_t jointIndex) {
    // To find joints that are not in any LOD, find the joints that are not in LOD 0 (the current max LOD, at index 0), as it
    // contains joints from all lower LODs.
    Vector<std::uint16_t> jointsNotInLOD0{memRes};
    const auto jointIndicesForLOD0 = dna.definition.lodJointMapping.getIndices(0);
    for (std::uint16_t idx = 0; idx < dna.definition.jointNames.size(); ++idx) {
        if (idx == jointIndex) {
            // Do not add the joint to remove.
            continue;
        }
        if (std::find(jointIndicesForLOD0.begin(), jointIndicesForLOD0.end(), idx) == jointIndicesForLOD0.end()) {
            jointsNotInLOD0.push_back(idx);
        }
    }
    // Filter and remap joint names and indices
    dna.definition.lodJointMapping.filterIndices([jointIndex](std::uint16_t value) {
            return (value != jointIndex);
        });
    // Collect all distinct element position indices that are referenced by the present LODs
    UnorderedSet<std::uint16_t> allowedJointIndices = dna.definition.lodJointMapping.getCombinedDistinctIndices(memRes);

    // In order to keep joints that are not in any LOD, add them to the list of joints to keep when filtering.
    allowedJointIndices.insert(jointsNotInLOD0.begin(), jointsNotInLOD0.end());

    JointFilter jointFilter{memRes};
    jointFilter.configure(static_cast<std::uint16_t>(dna.definition.jointNames.size()), std::move(allowedJointIndices));
    jointFilter.apply(dna.definition);
    // Filter and remap related joint behavior data
    jointFilter.apply(dna.behavior);
    // Remove skin weights related to this joint and normalize them
    for (auto& mesh : dna.geometry.meshes) {
        for (auto& skinWeights : mesh.skinWeights) {
            jointFilter.apply(skinWeights);
        }
    }
}

void DNACalibDNAReaderImpl::removeJointAnimation(std::uint16_t jointIndex) {
    UnorderedSet<std::uint16_t> allowedJointIndices = dna.definition.lodJointMapping.getCombinedDistinctIndices(memRes);
    allowedJointIndices.erase(jointIndex);

    JointFilter jointFilter{memRes};
    jointFilter.configure(static_cast<std::uint16_t>(dna.definition.jointNames.size()),
                          std::move(allowedJointIndices),
                          JointFilter::Option::AnimationOnly);
    jointFilter.apply(dna.behavior);
}

}  // namespace dnac
