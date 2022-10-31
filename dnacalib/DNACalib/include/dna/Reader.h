// Copyright Epic Games, Inc. All Rights Reserved.

#pragma once

#include "dna/Defs.h"
#include "dna/DataLayer.h"
#include "dna/layers/BehaviorReader.h"
#include "dna/layers/GeometryReader.h"

namespace dna {

/**
    @brief The abstract Reader which its implementations are expected to inherit.
    @note
        This class combines the various different reader interfaces into a single interface.
        The artificial separation into multiple interfaces mirrors the DNA file structure that
        is separated into matching layers under the same names. As these layers can be
        selectively loaded, it might be convenient to slice-off interfaces which layers were
        not loaded.
*/
class DNAAPI Reader : public BehaviorReader, public GeometryReader {
    public:
        ~Reader() override;
        /**
            @brief Unload all data of the specified layer and all layers dependent on it.
            @param layer
                Layer which data should be unloaded.
        */
        virtual void unload(DataLayer layer) = 0;
};

}  // namespace dna
