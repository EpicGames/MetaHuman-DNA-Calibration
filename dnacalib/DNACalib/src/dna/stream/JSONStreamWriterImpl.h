// Copyright Epic Games, Inc. All Rights Reserved.

#pragma once

#include "dna/DNA.h"
#include "dna/JSONStreamWriter.h"
#include "dna/WriterImpl.h"

#include <terse/archives/json/OutputArchive.h>

namespace dna {

class JSONStreamWriterImpl : public WriterImpl<JSONStreamWriter> {
    public:
        JSONStreamWriterImpl(BoundedIOStream* stream_, std::uint32_t indentWidth, MemoryResource* memRes_);

        void write() override;

    private:
        BoundedIOStream* stream;
        terse::JSONOutputArchive<BoundedIOStream> archive;

};

}  // namespace dna
