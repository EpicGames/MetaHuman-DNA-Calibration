// Copyright Epic Games, Inc. All Rights Reserved.

#include "dna/stream/BinaryStreamWriterImpl.h"

#include "dna/TypeDefs.h"

#include <cassert>
#include <cstddef>
#include <cstring>
#include <tuple>
#include <utility>

namespace dna {

BinaryStreamWriter::~BinaryStreamWriter() = default;

BinaryStreamWriter* BinaryStreamWriter::create(BoundedIOStream* stream, MemoryResource* memRes) {
    PolyAllocator<BinaryStreamWriterImpl> alloc{memRes};
    return alloc.newObject(stream, memRes);
}

void BinaryStreamWriter::destroy(BinaryStreamWriter* instance) {
    // NOLINTNEXTLINE(cppcoreguidelines-pro-type-static-cast-downcast)
    auto writer = static_cast<BinaryStreamWriterImpl*>(instance);
    PolyAllocator<BinaryStreamWriterImpl> alloc{writer->getMemoryResource()};
    alloc.deleteObject(writer);
}

BinaryStreamWriterImpl::BinaryStreamWriterImpl(BoundedIOStream* stream_, MemoryResource* memRes_) :
    BaseImpl{memRes_},
    WriterImpl{memRes_},
    stream{stream_},
    archive{stream_} {
}

void BinaryStreamWriterImpl::write() {
    stream->open();
    archive << dna;
    archive.sync();
    stream->close();
}

}  // namespace dna
