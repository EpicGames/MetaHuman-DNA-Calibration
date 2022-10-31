// Copyright Epic Games, Inc. All Rights Reserved.

#pragma once

#include "status/StatusCode.h"

#include <initializer_list>

namespace sc {

class StatusCodeRegistry {
    public:
        static bool insert(std::initializer_list<StatusCode> statuses);
        static bool contains(StatusCode status);

};

}  // namespace sc
