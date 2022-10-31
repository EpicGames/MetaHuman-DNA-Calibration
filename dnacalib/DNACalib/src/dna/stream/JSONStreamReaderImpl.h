// Copyright Epic Games, Inc. All Rights Reserved.

#pragma once

#include "dna/JSONStreamReader.h"
#include "dna/ReaderImpl.h"
#include "dna/TypeDefs.h"

#include <status/Provider.h>
#include <terse/archives/json/InputArchive.h>

namespace dna {

class JSONStreamReaderImpl : public ReaderImpl<JSONStreamReader> {
    public:
        JSONStreamReaderImpl(BoundedIOStream* stream_, MemoryResource* memRes_);

        void unload(DataLayer layer) override;
        void read() override;

    private:
        static sc::StatusProvider status;

        BoundedIOStream* stream;
        terse::JSONInputArchive<BoundedIOStream> archive;
};

}  // namespace dna
