// Copyright Epic Games, Inc. All Rights Reserved.

#pragma once

#include "dna/DataLayer.h"
#include "dna/Defs.h"
#include "dna/layers/BehaviorWriter.h"
#include "dna/layers/GeometryWriter.h"
#include "dna/types/Aliases.h"

namespace dna {

class Reader;

/**
    @brief The abstract Writer which its implementations are expected to inherit.
    @note
        This class combines the various different writer interfaces into a single interface.
        The artificial separation into multiple interfaces in this case just mirrors the
        structure of the Reader hierarchy, as it's not possible to selectively write only
        specific layers.
*/
class DNAAPI Writer : public BehaviorWriter, public GeometryWriter {
    public:
        ~Writer() override;
        /**
            @brief Initialize the Writer from the given Reader.
            @note
                This function copies all the data from the given Reader into the Writer instance,
                by calling each getter function of the Reader, and passing the return values to
                the matching setter functions in the Writer.
                It is implemented in the abstract class itself to provide the functionality for
                all DNA Writers.
            @param source
                The source DNA Reader from which the data needs to be copied.
            @param layer
                Limit which layers should be taken over from the given source reader.
            @param memRes
                Optional memory resource to use for temporary allocations during copying.
        */
        void setFrom(const Reader* source, DataLayer layer = DataLayer::All, MemoryResource* memRes = nullptr);
};

}  // namespace dna
