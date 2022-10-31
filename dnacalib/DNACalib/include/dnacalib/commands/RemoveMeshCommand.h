// Copyright Epic Games, Inc. All Rights Reserved.

#pragma once

#include "dnacalib/Command.h"
#include "dnacalib/Defs.h"
#include "dnacalib/types/Aliases.h"

#include <cstdint>

namespace dnac {

class DNACalibDNAReader;

/**
    @brief RemoveMeshCommand is used to remove a mesh.
*/
class RemoveMeshCommand : public Command {
    public:
        DNACAPI explicit RemoveMeshCommand(MemoryResource* memRes = nullptr);
        DNACAPI RemoveMeshCommand(std::uint16_t meshIndex, MemoryResource* memRes = nullptr);

        DNACAPI ~RemoveMeshCommand();

        RemoveMeshCommand(const RemoveMeshCommand&) = delete;
        RemoveMeshCommand& operator=(const RemoveMeshCommand&) = delete;

        DNACAPI RemoveMeshCommand(RemoveMeshCommand&&);
        DNACAPI RemoveMeshCommand& operator=(RemoveMeshCommand&&);

        /**
            @brief Method for setting the index of the mesh to remove.
            @param meshIndex
                The index of the mesh.
        */
        DNACAPI void setMeshIndex(std::uint16_t meshIndex);
        DNACAPI void run(DNACalibDNAReader* output) override;

    private:
        class Impl;
        ScopedPtr<Impl> pImpl;

};

}  // namespace dnac
