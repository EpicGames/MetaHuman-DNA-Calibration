// Copyright Epic Games, Inc. All Rights Reserved.

#pragma once

#include "dnacalib/Command.h"
#include "dnacalib/Defs.h"
#include "dnacalib/types/Aliases.h"

#include <cstdint>

namespace dnac {

class DNACalibDNAReader;

/**
    @brief RemoveJointCommand is used to remove a joint.
*/
class RemoveJointCommand : public Command {
    public:
        DNACAPI explicit RemoveJointCommand(MemoryResource* memRes = nullptr);
        DNACAPI RemoveJointCommand(std::uint16_t jointIndex, MemoryResource* memRes = nullptr);

        DNACAPI ~RemoveJointCommand();

        RemoveJointCommand(const RemoveJointCommand&) = delete;
        RemoveJointCommand& operator=(const RemoveJointCommand&) = delete;

        DNACAPI RemoveJointCommand(RemoveJointCommand&&);
        DNACAPI RemoveJointCommand& operator=(RemoveJointCommand&&);

        /**
            @brief Method for setting the index of the joint to remove.
            @param jointIndex
                The index of the joint.
        */
        DNACAPI void setJointIndex(std::uint16_t jointIndex);
        DNACAPI void run(DNACalibDNAReader* output) override;

    private:
        class Impl;
        ScopedPtr<Impl> pImpl;

};

}  // namespace dnac
