// Copyright Epic Games, Inc. All Rights Reserved.

#pragma once

#include "status/StatusCode.h"

#include <cstddef>

namespace sc {

class StatusStorage {
    public:
        static void set(StatusCode status);
        static void reset();
        static StatusCode get();
        static bool isOk();
        static constexpr std::size_t bufferSize();

};

}  // namespace sc
