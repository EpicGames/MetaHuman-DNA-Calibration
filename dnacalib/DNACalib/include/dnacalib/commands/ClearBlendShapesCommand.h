// Copyright Epic Games, Inc. All Rights Reserved.

#pragma once

#include "dnacalib/Command.h"
#include "dnacalib/Defs.h"
#include "dnacalib/types/Aliases.h"

#include <cstdint>

namespace dnac {

class DNACalibDNAReader;

/**
    @brief ClearBlendShapesCommand is used to clear all blend shapes data from a DNA.
    @note This command clears blend shape target deltas and blend shape animation data. By doing so, it transforms the DNA to be "joints only".
*/
class ClearBlendShapesCommand : public Command {
    public:
        DNACAPI explicit ClearBlendShapesCommand(MemoryResource* memRes = nullptr);

        DNACAPI ~ClearBlendShapesCommand();

        ClearBlendShapesCommand(const ClearBlendShapesCommand&) = delete;
        ClearBlendShapesCommand& operator=(const ClearBlendShapesCommand&) = delete;

        DNACAPI ClearBlendShapesCommand(ClearBlendShapesCommand&&);
        DNACAPI ClearBlendShapesCommand& operator=(ClearBlendShapesCommand&&);

        DNACAPI void run(DNACalibDNAReader* output) override;

    private:
        class Impl;
        ScopedPtr<Impl> pImpl;

};

}  // namespace dnac
