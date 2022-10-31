// Copyright Epic Games, Inc. All Rights Reserved.

#pragma once

#include "dnacalib/dna/DNA.h"
#include "dnacalib/types/Aliases.h"

namespace dnac {

class BaseImpl {
    protected:
        explicit BaseImpl(MemoryResource* memRes_) :
            memRes{memRes_},
            dna{memRes} {
        }

        ~BaseImpl() = default;

        BaseImpl(const BaseImpl&) = delete;
        BaseImpl& operator=(const BaseImpl&) = delete;

        BaseImpl(BaseImpl&& rhs) = delete;
        BaseImpl& operator=(BaseImpl&&) = delete;

    public:
        MemoryResource* getMemoryResource() {
            return memRes;
        }

    protected:
        MemoryResource* memRes;
        DNA dna;

};

}  // namespace dnac
