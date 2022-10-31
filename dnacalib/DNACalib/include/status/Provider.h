// Copyright Epic Games, Inc. All Rights Reserved.

#pragma once

#include "status/Defs.h"
#include "status/StatusCode.h"

#ifdef _MSC_VER
    #pragma warning(push)
    #pragma warning(disable : 4365 4987)
#endif
#include <stdio.h>

#include <algorithm>
#include <array>
#ifdef _MSC_VER
    #pragma warning(pop)
#endif

namespace sc {

class SCAPI StatusProvider {
    public:
        explicit StatusProvider(std::initializer_list<StatusCode> statuses);

        static void reset();
        static StatusCode get();
        static bool isOk();
        static void set(StatusCode status);

        template<typename ... Args>
        static void set(StatusCode status, Args&& ... args) {
            std::array<char, 512> buffer{};
            #if !defined(__clang__) && defined(__GNUC__)
                #pragma GCC diagnostic push
                #pragma GCC diagnostic ignored "-Wformat-security"
            #endif
            // The returned number of bytes to be written does not include the null terminator
            const auto neededSize = snprintf(nullptr, 0ul, status.message, args ...) + 1;
            const auto size = std::min(buffer.size(), static_cast<std::size_t>(neededSize));
            snprintf(buffer.data(), size, status.message, args ...);
            #if !defined(__clang__) && defined(__GNUC__)
                #pragma GCC diagnostic pop
            #endif
            status.message = buffer.data();
            set(status);
        }

};

}  // namespace sc
