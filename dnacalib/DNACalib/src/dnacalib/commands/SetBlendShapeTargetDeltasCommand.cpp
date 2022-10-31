// Copyright Epic Games, Inc. All Rights Reserved.

#include "dnacalib/commands/SetBlendShapeTargetDeltasCommand.h"

#include "dnacalib/CommandImplBase.h"
#include "dnacalib/commands/SupportFactories.h"
#include "dnacalib/dna/DNA.h"
#include "dnacalib/dna/DNACalibDNAReaderImpl.h"
#include "dnacalib/types/Aliases.h"

namespace dnac {

class SetBlendShapeTargetDeltasCommand::Impl : public CommandImplBase<Impl> {
    private:
        using Super = CommandImplBase<Impl>;

    public:
        explicit Impl(MemoryResource* memRes_) :
            Super{memRes_},
            deltas{memRes_},
            masks{memRes_},
            operation{VectorOperation::Interpolate},
            meshIndex{},
            blendShapeTargetIndex{} {
        }

        void setMeshIndex(std::uint16_t meshIndex_) {
            meshIndex = meshIndex_;
        }

        void setBlendShapeTargetIndex(std::uint16_t blendShapeTargetIndex_) {
            blendShapeTargetIndex = blendShapeTargetIndex_;
        }

        void setDeltas(ConstArrayView<Vector3> deltas_) {
            deltas.assign(deltas_.begin(), deltas_.end());
        }

        void setDeltas(ConstArrayView<float> xs, ConstArrayView<float> ys, ConstArrayView<float> zs) {
            deltas.xs.assign(xs.begin(), xs.end());
            deltas.ys.assign(ys.begin(), ys.end());
            deltas.zs.assign(zs.begin(), zs.end());
        }

        void setMasks(ConstArrayView<float> masks_) {
            masks.assign(masks_.begin(), masks_.end());
        }

        void setOperation(VectorOperation operation_) {
            operation = operation_;
        }

        void run(DNACalibDNAReaderImpl* output) {
            auto getWeight = WeightGetterFactory::create(masks);
            auto op = OperationFactory::create(operation);
            computeBlendShapeTargetDeltas(op, getWeight, output);
        }

    private:
        template<typename FOperation, typename FWeightGetter>
        void computeBlendShapeTargetDeltas(FOperation op, FWeightGetter getWeight, DNACalibDNAReaderImpl* output) {
            const auto xs = output->getBlendShapeTargetDeltaXs(meshIndex, blendShapeTargetIndex);
            const auto ys = output->getBlendShapeTargetDeltaYs(meshIndex, blendShapeTargetIndex);
            const auto zs = output->getBlendShapeTargetDeltaZs(meshIndex, blendShapeTargetIndex);
            assert((xs.size() == ys.size()) && (ys.size() == zs.size()));
            RawVector3Vector result{xs, ys, zs, output->getMemoryResource()};
            // This accounts for the case when output is empty
            result.resize(deltas.size(), 0.0f);
            assert(masks.empty() || (deltas.size() == masks.size()));
            for (std::uint32_t i = 0u; i < deltas.size(); ++i) {
                const float weight = getWeight(masks.data(), i);
                result.xs[i] = op(result.xs[i], deltas.xs[i], weight);
                result.ys[i] = op(result.ys[i], deltas.ys[i], weight);
                result.zs[i] = op(result.zs[i], deltas.zs[i], weight);
            }
            output->setBlendShapeTargetDeltas(meshIndex, blendShapeTargetIndex, std::move(result));
        }

    private:
        RawVector3Vector deltas;
        Vector<float> masks;
        VectorOperation operation;
        std::uint16_t meshIndex;
        std::uint16_t blendShapeTargetIndex;

};

SetBlendShapeTargetDeltasCommand::SetBlendShapeTargetDeltasCommand(MemoryResource* memRes) : pImpl{makeScoped<Impl>(memRes)} {
}

SetBlendShapeTargetDeltasCommand::SetBlendShapeTargetDeltasCommand(std::uint16_t meshIndex,
                                                                   std::uint16_t blendShapeTargetIndex,
                                                                   ConstArrayView<Vector3> deltas,
                                                                   VectorOperation operation,
                                                                   MemoryResource* memRes) :
    pImpl{makeScoped<Impl>(memRes)} {

    pImpl->setMeshIndex(meshIndex);
    pImpl->setBlendShapeTargetIndex(blendShapeTargetIndex);
    pImpl->setDeltas(deltas);
    pImpl->setOperation(operation);
}

SetBlendShapeTargetDeltasCommand::SetBlendShapeTargetDeltasCommand(std::uint16_t meshIndex,
                                                                   std::uint16_t blendShapeTargetIndex,
                                                                   ConstArrayView<float> xs,
                                                                   ConstArrayView<float> ys,
                                                                   ConstArrayView<float> zs,
                                                                   VectorOperation operation,
                                                                   MemoryResource* memRes) :
    pImpl{makeScoped<Impl>(memRes)} {

    pImpl->setMeshIndex(meshIndex);
    pImpl->setBlendShapeTargetIndex(blendShapeTargetIndex);
    pImpl->setDeltas(xs, ys, zs);
    pImpl->setOperation(operation);
}

SetBlendShapeTargetDeltasCommand::SetBlendShapeTargetDeltasCommand(std::uint16_t meshIndex,
                                                                   std::uint16_t blendShapeTargetIndex,
                                                                   ConstArrayView<Vector3> deltas,
                                                                   ConstArrayView<float> masks,
                                                                   VectorOperation operation,
                                                                   MemoryResource* memRes) :
    pImpl{makeScoped<Impl>(memRes)} {

    pImpl->setMeshIndex(meshIndex);
    pImpl->setBlendShapeTargetIndex(blendShapeTargetIndex);
    pImpl->setDeltas(deltas);
    pImpl->setMasks(masks);
    pImpl->setOperation(operation);
}

SetBlendShapeTargetDeltasCommand::SetBlendShapeTargetDeltasCommand(std::uint16_t meshIndex,
                                                                   std::uint16_t blendShapeTargetIndex,
                                                                   ConstArrayView<float> xs,
                                                                   ConstArrayView<float> ys,
                                                                   ConstArrayView<float> zs,
                                                                   ConstArrayView<float> masks,
                                                                   VectorOperation operation,
                                                                   MemoryResource* memRes) :
    pImpl{makeScoped<Impl>(memRes)} {

    pImpl->setMeshIndex(meshIndex);
    pImpl->setBlendShapeTargetIndex(blendShapeTargetIndex);
    pImpl->setDeltas(xs, ys, zs);
    pImpl->setMasks(masks);
    pImpl->setOperation(operation);
}

SetBlendShapeTargetDeltasCommand::~SetBlendShapeTargetDeltasCommand() = default;
SetBlendShapeTargetDeltasCommand::SetBlendShapeTargetDeltasCommand(SetBlendShapeTargetDeltasCommand&&) = default;
SetBlendShapeTargetDeltasCommand& SetBlendShapeTargetDeltasCommand::operator=(SetBlendShapeTargetDeltasCommand&&) = default;

void SetBlendShapeTargetDeltasCommand::setMeshIndex(std::uint16_t meshIndex) {
    pImpl->setMeshIndex(meshIndex);
}

void SetBlendShapeTargetDeltasCommand::setBlendShapeTargetIndex(std::uint16_t blendShapeTargetIndex) {
    pImpl->setBlendShapeTargetIndex(blendShapeTargetIndex);
}

void SetBlendShapeTargetDeltasCommand::setDeltas(ConstArrayView<Vector3> deltas) {
    pImpl->setDeltas(deltas);
}

void SetBlendShapeTargetDeltasCommand::setDeltas(ConstArrayView<float> xs, ConstArrayView<float> ys, ConstArrayView<float> zs) {
    pImpl->setDeltas(xs, ys, zs);
}

void SetBlendShapeTargetDeltasCommand::setMasks(ConstArrayView<float> masks) {
    pImpl->setMasks(masks);
}

void SetBlendShapeTargetDeltasCommand::setOperation(VectorOperation operation) {
    pImpl->setOperation(operation);
}

void SetBlendShapeTargetDeltasCommand::run(DNACalibDNAReader* output) {
    pImpl->run(static_cast<DNACalibDNAReaderImpl*>(output));
}

}  // namespace dnac
