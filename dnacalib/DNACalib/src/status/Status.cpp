// Copyright Epic Games, Inc. All Rights Reserved.

#include "status/Status.h"

#include "status/Storage.h"

namespace sc {

StatusCode Status::get() {
    return StatusStorage::get();
}

bool Status::isOk() {
    return StatusStorage::isOk();
}

}  // namespace sc
