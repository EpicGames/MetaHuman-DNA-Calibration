// Copyright Epic Games, Inc. All Rights Reserved.

#include "status/Provider.h"

#include "status/StatusCode.h"
#include "status/Storage.h"
#include "status/Registry.h"

#include <cassert>

namespace sc {

StatusProvider::StatusProvider(std::initializer_list<StatusCode> statuses) {
    // The Release build will eliminate this call, as it's really just a sanity check
    // to avoid defining duplicate error codes
    assert(StatusCodeRegistry::insert(statuses));
    // Avoid warning in Release builds
    static_cast<void>(statuses);
}

void StatusProvider::reset() {
    StatusStorage::reset();
}

StatusCode StatusProvider::get() {
    return StatusStorage::get();
}

bool StatusProvider::isOk() {
    return StatusStorage::isOk();
}

void StatusProvider::set(StatusCode status) {
    StatusStorage::set(status);
}

}  // namespace sc
