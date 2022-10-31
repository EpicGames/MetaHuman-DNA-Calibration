// Copyright Epic Games, Inc. All Rights Reserved.

#include "dnacalib/commands/RemoveJointAnimationCommand.h"

#include "dnacalib/CommandImplBase.h"
#include "dnacalib/dna/DNA.h"
#include "dnacalib/dna/DNACalibDNAReaderImpl.h"
#include "dnacalib/types/Aliases.h"

namespace dnac {

class RemoveJointAnimationCommand::Impl : public CommandImplBase<Impl> {
    private:
        using Super = CommandImplBase<Impl>;

    public:
        explicit Impl(MemoryResource* memRes_) :
            Super{memRes_},
            jointIndex{std::numeric_limits<std::uint16_t>::max()} {
        }

        void setJointIndex(std::uint16_t jointIndex_) {
            jointIndex = jointIndex_;
        }

        void run(DNACalibDNAReaderImpl* output) {
            output->removeJointAnimation(jointIndex);
        }

    private:
        std::uint16_t jointIndex;

};

RemoveJointAnimationCommand::RemoveJointAnimationCommand(MemoryResource* memRes) : pImpl{makeScoped<Impl>(memRes)} {
}

RemoveJointAnimationCommand::RemoveJointAnimationCommand(std::uint16_t jointIndex, MemoryResource* memRes) :
    pImpl{makeScoped<Impl>(memRes)} {

    pImpl->setJointIndex(jointIndex);
}

RemoveJointAnimationCommand::~RemoveJointAnimationCommand() = default;
RemoveJointAnimationCommand::RemoveJointAnimationCommand(RemoveJointAnimationCommand&&) = default;
RemoveJointAnimationCommand& RemoveJointAnimationCommand::operator=(RemoveJointAnimationCommand&&) = default;

void RemoveJointAnimationCommand::setJointIndex(std::uint16_t jointIndex) {
    pImpl->setJointIndex(jointIndex);
}

void RemoveJointAnimationCommand::run(DNACalibDNAReader* output) {
    pImpl->run(static_cast<DNACalibDNAReaderImpl*>(output));
}

}  // namespace dnac
