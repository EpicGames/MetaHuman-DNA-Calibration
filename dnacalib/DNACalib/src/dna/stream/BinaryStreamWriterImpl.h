// Copyright Epic Games, Inc. All Rights Reserved.

#pragma once

#include "dna/DNA.h"
#include "dna/BinaryStreamWriter.h"
#include "dna/WriterImpl.h"

#include <terse/archives/binary/OutputArchive.h>

namespace dna {

class BinaryStreamWriterImpl : public WriterImpl<BinaryStreamWriter> {
    public:
        BinaryStreamWriterImpl(BoundedIOStream* stream_, MemoryResource* memRes_);

        void write() override;

    private:
        BoundedIOStream* stream;
        terse::BinaryOutputArchive<BoundedIOStream> archive;

};

}  // namespace dna
