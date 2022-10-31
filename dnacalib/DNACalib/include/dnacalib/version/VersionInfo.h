// Copyright Epic Games, Inc. All Rights Reserved.

#pragma once

#include "dnacalib/Defs.h"
#include "dnacalib/types/Aliases.h"

namespace dnac {

struct DNACAPI VersionInfo {
    static int getMajorVersion();
    static int getMinorVersion();
    static int getPatchVersion();
    static StringView getVersionString();
};

}  // namespace dnac
