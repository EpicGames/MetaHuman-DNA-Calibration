// Copyright Epic Games, Inc. All Rights Reserved.

#include "dnacalib/commands/RemoveMeshCommand.h"

#include "dnacalib/CommandImplBase.h"
#include "dnacalib/dna/DNA.h"
#include "dnacalib/dna/DNACalibDNAReaderImpl.h"
#include "dnacalib/types/Aliases.h"

namespace dnac {

class RemoveMeshCommand::Impl : public CommandImplBase<Impl> {
    private:
        using Super = CommandImplBase<Impl>;

    public:
        explicit Impl(MemoryResource* memRes_) :
            Super{memRes_},
            meshIndex{std::numeric_limits<std::uint16_t>::max()} {
        }

        void setMeshIndex(std::uint16_t meshIndex_) {
            meshIndex = meshIndex_;
        }

        void run(DNACalibDNAReaderImpl* output) {
            output->removeMesh(meshIndex);
        }

    private:
        std::uint16_t meshIndex;

};

RemoveMeshCommand::RemoveMeshCommand(MemoryResource* memRes) : pImpl{makeScoped<Impl>(memRes)} {
}

RemoveMeshCommand::RemoveMeshCommand(std::uint16_t meshIndex, MemoryResource* memRes) :
    pImpl{makeScoped<Impl>(memRes)} {

    pImpl->setMeshIndex(meshIndex);
}

RemoveMeshCommand::~RemoveMeshCommand() = default;
RemoveMeshCommand::RemoveMeshCommand(RemoveMeshCommand&&) = default;
RemoveMeshCommand& RemoveMeshCommand::operator=(RemoveMeshCommand&&) = default;

void RemoveMeshCommand::setMeshIndex(std::uint16_t meshIndex) {
    pImpl->setMeshIndex(meshIndex);
}

void RemoveMeshCommand::run(DNACalibDNAReader* output) {
    pImpl->run(static_cast<DNACalibDNAReaderImpl*>(output));
}

}  // namespace dnac
