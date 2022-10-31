// Copyright Epic Games, Inc. All Rights Reserved.

#include "status/Storage.h"

#include "status/PredefinedCodes.h"
#include "status/Registry.h"
#include "status/StatusCode.h"

#include <cassert>
#include <cstddef>
#include <cstring>

namespace sc {

namespace {

struct StatusCodeStorage {
    int code;
    char message[512];
};

void strcopy(char* destination, const char* source, std::size_t bufferSize) {
    #ifdef _MSC_VER
        strncpy_s(destination, bufferSize, source, bufferSize - 1ul);
    #else
        std::strncpy(destination, source, bufferSize - 1ul);
    #endif
}

}  // namespace

thread_local static StatusCodeStorage currentStatus{0, "Ok"};

void StatusStorage::set(StatusCode status) {
    // The Release build will eliminate this call, as it's really just a sanity check
    // to avoid using unregistered status codes
    assert(StatusCodeRegistry::contains(status));
    currentStatus.code = status.code;
    strcopy(currentStatus.message, status.message, bufferSize());
}

void StatusStorage::reset() {
    currentStatus.code = OK.code;
    strcopy(currentStatus.message, OK.message, bufferSize());
}

StatusCode StatusStorage::get() {
    return {currentStatus.code, currentStatus.message};
}

bool StatusStorage::isOk() {
    return (currentStatus.code == OK.code);
}

constexpr std::size_t StatusStorage::bufferSize() {
    return sizeof(currentStatus.message);
}

}  // namespace sc
