// Copyright Epic Games, Inc. All Rights Reserved.

#include "dnacalib/commands/RemoveJointCommand.h"

#include "dnacalib/CommandImplBase.h"
#include "dnacalib/dna/DNA.h"
#include "dnacalib/dna/DNACalibDNAReaderImpl.h"
#include "dnacalib/types/Aliases.h"

namespace dnac {

class RemoveJointCommand::Impl : public CommandImplBase<Impl> {
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
            output->removeJoint(jointIndex);
        }

    private:
        std::uint16_t jointIndex;

};

RemoveJointCommand::RemoveJointCommand(MemoryResource* memRes) : pImpl{makeScoped<Impl>(memRes)} {
}

RemoveJointCommand::RemoveJointCommand(std::uint16_t jointIndex, MemoryResource* memRes) :
    pImpl{makeScoped<Impl>(memRes)} {

    pImpl->setJointIndex(jointIndex);
}

RemoveJointCommand::~RemoveJointCommand() = default;
RemoveJointCommand::RemoveJointCommand(RemoveJointCommand&&) = default;
RemoveJointCommand& RemoveJointCommand::operator=(RemoveJointCommand&&) = default;

void RemoveJointCommand::setJointIndex(std::uint16_t jointIndex) {
    pImpl->setJointIndex(jointIndex);
}

void RemoveJointCommand::run(DNACalibDNAReader* output) {
    pImpl->run(static_cast<DNACalibDNAReaderImpl*>(output));
}

}  // namespace dnac
