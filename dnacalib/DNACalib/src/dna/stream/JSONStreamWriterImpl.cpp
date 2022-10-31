// Copyright Epic Games, Inc. All Rights Reserved.

#include "dna/stream/JSONStreamWriterImpl.h"

#include "dna/TypeDefs.h"

#include <cassert>
#include <cstddef>
#include <cstring>
#include <tuple>
#include <utility>

namespace dna {

JSONStreamWriter::~JSONStreamWriter() = default;

JSONStreamWriter* JSONStreamWriter::create(BoundedIOStream* stream, std::uint32_t indentWidth, MemoryResource* memRes) {
    PolyAllocator<JSONStreamWriterImpl> alloc{memRes};
    return alloc.newObject(stream, indentWidth, memRes);
}

void JSONStreamWriter::destroy(JSONStreamWriter* instance) {
    // NOLINTNEXTLINE(cppcoreguidelines-pro-type-static-cast-downcast)
    auto writer = static_cast<JSONStreamWriterImpl*>(instance);
    PolyAllocator<JSONStreamWriterImpl> alloc{writer->getMemoryResource()};
    alloc.deleteObject(writer);
}

JSONStreamWriterImpl::JSONStreamWriterImpl(BoundedIOStream* stream_, std::uint32_t indentWidth, MemoryResource* memRes_) :
    BaseImpl{memRes_},
    WriterImpl{memRes_},
    stream{stream_},
    archive{stream_, indentWidth} {
}

void JSONStreamWriterImpl::write() {
    stream->open();
    archive << dna;
    archive.sync();
    stream->close();
}

}  // namespace dna
