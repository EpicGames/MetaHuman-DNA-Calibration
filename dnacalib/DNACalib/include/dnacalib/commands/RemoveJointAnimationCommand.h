// Copyright Epic Games, Inc. All Rights Reserved.

#pragma once

#include "dnacalib/Command.h"
#include "dnacalib/Defs.h"
#include "dnacalib/types/Aliases.h"

#include <cstdint>

namespace dnac {

class DNACalibDNAReader;

/**
    @brief RemoveJointAnimationCommand is used to remove joint animation data.
*/
class RemoveJointAnimationCommand : public Command {
    public:
        DNACAPI explicit RemoveJointAnimationCommand(MemoryResource* memRes = nullptr);
        DNACAPI RemoveJointAnimationCommand(std::uint16_t jointIndex, MemoryResource* memRes = nullptr);

        DNACAPI ~RemoveJointAnimationCommand();

        RemoveJointAnimationCommand(const RemoveJointAnimationCommand&) = delete;
        RemoveJointAnimationCommand& operator=(const RemoveJointAnimationCommand&) = delete;

        DNACAPI RemoveJointAnimationCommand(RemoveJointAnimationCommand&&);
        DNACAPI RemoveJointAnimationCommand& operator=(RemoveJointAnimationCommand&&);

        /**
            @brief Method for setting the index of a joint whose animation data to remove.
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
