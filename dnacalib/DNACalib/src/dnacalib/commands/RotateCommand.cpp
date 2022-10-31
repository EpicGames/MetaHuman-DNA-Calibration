// Copyright Epic Games, Inc. All Rights Reserved.

#include "dnacalib/commands/RotateCommand.h"

#include "dnacalib/CommandImplBase.h"
#include "dnacalib/dna/DNA.h"
#include "dnacalib/dna/DNACalibDNAReaderImpl.h"
#include "dnacalib/types/Aliases.h"
#include "dnacalib/utils/Algorithm.h"

#include <tdm/TDM.h>

namespace dnac {

class RotateCommand::Impl : public CommandImplBase<Impl> {
    private:
        using Super = CommandImplBase<Impl>;

    public:
        explicit Impl(MemoryResource* memRes_) :
            Super{memRes_},
            degrees{},
            origin{} {
        }

        void setRotation(Vector3 degrees_) {
            degrees = degrees_;
        }

        void setOrigin(Vector3 origin_) {
            origin = origin_;
        }

        void run(DNACalibDNAReaderImpl* output) {
            if (degrees != Vector3{}) {
                rotateNeutralJoints(output);
                rotateVertexPositions(output);
            }
        }

    private:
        tdm::mat4<float> getRotationTransformationMatrix() const {
            const auto inverseTranslationMatrix = tdm::translate(tdm::fvec3{-origin.x, -origin.y, -origin.z});
            const auto rotationMatrix = tdm::rotate(tdm::radians(degrees.x), tdm::radians(degrees.y), tdm::radians(degrees.z));
            const auto translationMatrix = tdm::translate(tdm::fvec3{origin.x, origin.y, origin.z});
            return inverseTranslationMatrix * rotationMatrix * translationMatrix;
        }

        void rotateNeutralJoints(DNACalibDNAReaderImpl* output) {
            const auto rotationMatrix = getRotationTransformationMatrix();
            for (std::uint16_t jointIndex = 0u; jointIndex < output->getJointCount(); ++jointIndex) {
                const auto parentIndex = output->getJointParentIndex(jointIndex);
                // Only root joints are rotated
                if (jointIndex == parentIndex) {
                    const auto jointNeutralRotation = output->getNeutralJointRotation(jointIndex);
                    const auto jointNeutralTranslation = output->getNeutralJointTranslation(jointIndex);

                    const auto jointRotationMatrix = tdm::rotate(tdm::radians(jointNeutralRotation.x),
                                                                 tdm::radians(jointNeutralRotation.y),
                                                                 tdm::radians(jointNeutralRotation.z));
                    const auto jointTranslationMatrix = tdm::translate(fvec3{jointNeutralTranslation.x,
                                                                             jointNeutralTranslation.y,
                                                                             jointNeutralTranslation.z});

                    const auto transformMatrix = jointRotationMatrix * jointTranslationMatrix * rotationMatrix;
                    const auto t = extractTranslationVector(transformMatrix);
                    const auto r = extractRotationVector(transformMatrix);

                    output->setNeutralJointRotation(jointIndex,
                                                    Vector3{tdm::degrees(r[0]), tdm::degrees(r[1]), tdm::degrees(r[2])});
                    output->setNeutralJointTranslation(jointIndex, Vector3{t[0], t[1], t[2]});
                }
            }
        }

        void rotateVertexPositions(DNACalibDNAReaderImpl* output) {
            const auto rotationMatrix = getRotationTransformationMatrix();
            for (std::uint16_t meshIndex = 0u; meshIndex < output->getMeshCount(); ++meshIndex) {
                const auto xs = output->getVertexPositionXs(meshIndex);
                const auto ys = output->getVertexPositionYs(meshIndex);
                const auto zs = output->getVertexPositionZs(meshIndex);
                assert((xs.size() == ys.size()) && (ys.size() == zs.size()));
                RawVector3Vector mesh{xs, ys, zs, output->getMemoryResource()};
                for (std::size_t i = 0ul; i < mesh.size(); ++i) {
                    const tdm::fvec4 vertex{mesh.xs[i], mesh.ys[i], mesh.zs[i], 1.0f};
                    const tdm::fvec4 rotatedVertex = vertex * rotationMatrix;
                    mesh.xs[i] = rotatedVertex[0];
                    mesh.ys[i] = rotatedVertex[1];
                    mesh.zs[i] = rotatedVertex[2];
                }
                output->setVertexPositions(meshIndex, std::move(mesh));
            }
        }

    private:
        Vector3 degrees;
        Vector3 origin;

};

RotateCommand::RotateCommand(MemoryResource* memRes) : pImpl{makeScoped<Impl>(memRes)} {
}

RotateCommand::RotateCommand(Vector3 degrees, Vector3 origin, MemoryResource* memRes) :
    pImpl{makeScoped<Impl>(memRes)} {

    pImpl->setRotation(degrees);
    pImpl->setOrigin(origin);
}

RotateCommand::~RotateCommand() = default;
RotateCommand::RotateCommand(RotateCommand&&) = default;
RotateCommand& RotateCommand::operator=(RotateCommand&&) = default;

void RotateCommand::setRotation(Vector3 degrees) {
    pImpl->setRotation(degrees);
}

void RotateCommand::setOrigin(Vector3 origin) {
    pImpl->setOrigin(origin);
}

void RotateCommand::run(DNACalibDNAReader* output) {
    pImpl->run(static_cast<DNACalibDNAReaderImpl*>(output));
}

}  // namespace dnac
