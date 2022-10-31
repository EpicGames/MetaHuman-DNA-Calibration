// Copyright Epic Games, Inc. All Rights Reserved.

#pragma once

#include "trio/types/Aliases.h"

#include <status/Provider.h>

namespace trio {

class StreamStatus {
    public:
        sc::StatusProvider* operator->() {
            return &status;
        }

    private:
        static sc::StatusProvider status;

};

}  // namespace trio
