// Copyright Epic Games, Inc. All Rights Reserved.

#include "dna/stream/BinaryStreamReaderImpl.h"

#include "dna/TypeDefs.h"
#include "dna/types/Limits.h"

#include <status/Provider.h>
#include <trio/utils/StreamScope.h>

#ifdef _MSC_VER
    #pragma warning(push)
    #pragma warning(disable : 4365 4987)
#endif
#include <cstddef>
#include <limits>
#include <tuple>
#ifdef _MSC_VER
    #pragma warning(pop)
#endif

namespace dna {

#ifdef __clang__
    #pragma clang diagnostic push
    #pragma clang diagnostic ignored "-Wglobal-constructors"
#endif
sc::StatusProvider BinaryStreamReaderImpl::status{SignatureMismatchError, VersionMismatchError, InvalidDataError};
#ifdef __clang__
    #pragma clang diagnostic pop
#endif

BinaryStreamReader::~BinaryStreamReader() = default;

BinaryStreamReader* BinaryStreamReader::create(BoundedIOStream* stream,
                                               DataLayer layer,
                                               std::uint16_t maxLOD,
                                               MemoryResource* memRes) {
    PolyAllocator<BinaryStreamReaderImpl> alloc{memRes};
    return alloc.newObject(stream, layer, maxLOD, LODLimits::min(), memRes);
}

BinaryStreamReader* BinaryStreamReader::create(BoundedIOStream* stream,
                                               DataLayer layer,
                                               std::uint16_t maxLOD,
                                               std::uint16_t minLOD,
                                               MemoryResource* memRes) {
    PolyAllocator<BinaryStreamReaderImpl> alloc{memRes};
    return alloc.newObject(stream, layer, maxLOD, minLOD, memRes);
}

BinaryStreamReader* BinaryStreamReader::create(BoundedIOStream* stream,
                                               DataLayer layer,
                                               std::uint16_t* lods,
                                               std::uint16_t lodCount,
                                               MemoryResource* memRes) {
    PolyAllocator<BinaryStreamReaderImpl> alloc{memRes};
    return alloc.newObject(stream, layer, ConstArrayView<std::uint16_t>{lods, lodCount}, memRes);
}

void BinaryStreamReader::destroy(BinaryStreamReader* instance) {
    // NOLINTNEXTLINE(cppcoreguidelines-pro-type-static-cast-downcast)
    auto reader = static_cast<BinaryStreamReaderImpl*>(instance);
    PolyAllocator<BinaryStreamReaderImpl> alloc{reader->getMemoryResource()};
    alloc.deleteObject(reader);
}

BinaryStreamReaderImpl::BinaryStreamReaderImpl(BoundedIOStream* stream_,
                                               DataLayer layer_,
                                               std::uint16_t maxLOD_,
                                               std::uint16_t minLOD_,
                                               MemoryResource* memRes_) :
    BaseImpl{memRes_},
    ReaderImpl{memRes_},
    stream{stream_},
    archive{stream_, layer_, maxLOD_, minLOD_, memRes_},
    lodConstrained{(maxLOD_ != LODLimits::max()) || (minLOD_ != LODLimits::min())} {
}

BinaryStreamReaderImpl::BinaryStreamReaderImpl(BoundedIOStream* stream_,
                                               DataLayer layer_,
                                               ConstArrayView<std::uint16_t> lods_,
                                               MemoryResource* memRes_) :
    BaseImpl{memRes_},
    ReaderImpl{memRes_},
    stream{stream_},
    archive{stream_, layer_, lods_, memRes_},
    lodConstrained{true} {
}

bool BinaryStreamReaderImpl::isLODConstrained() const {
    return lodConstrained;
}

void BinaryStreamReaderImpl::unload(DataLayer layer) {
    if ((layer == DataLayer::All) ||
        (layer == DataLayer::AllWithoutBlendShapes) ||
        (layer == DataLayer::Descriptor)) {
        dna = DNA{memRes};
    } else if ((layer == DataLayer::Geometry) || (layer == DataLayer::GeometryWithoutBlendShapes)) {
        dna.unloadGeometry();
    } else if (layer == DataLayer::Behavior) {
        dna.unloadBehavior();
    } else if (layer == DataLayer::Definition) {
        dna.unloadGeometry();
        dna.unloadBehavior();
        dna.unloadDefinition();
    }
}

void BinaryStreamReaderImpl::read() {
    // Due to possible usage of custom stream implementations, the status actually must be cleared at this point
    // as external streams do not have access to the status reset API
    status.reset();

    trio::StreamScope scope{stream};
    if (!sc::Status::isOk()) {
        return;
    }

    archive >> dna;
    if (!sc::Status::isOk()) {
        return;
    }

    if (!dna.signature.matches()) {
        status.set(SignatureMismatchError, dna.signature.value.expected.data(), dna.signature.value.got.data());
        return;
    }
    if (!dna.version.matches()) {
        status.set(VersionMismatchError,
                   dna.version.generation.expected,
                   dna.version.version.expected,
                   dna.version.generation.got,
                   dna.version.version.got);
        return;
    }
}

}  // namespace dna
