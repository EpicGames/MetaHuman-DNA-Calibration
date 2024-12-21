// Copyright Epic Games, Inc. All Rights Reserved.

#pragma once

#include "dnacalib/types/Aliases.h"

namespace dnac {

bool isUVMapOverlapping(ConstArrayView<float> us,
                        ConstArrayView<float> vs,
                        std::size_t overlapCountThreshold = 10ul,
                        float uvCompareThreshold = 0.0002f);
void offsetOverlappingUVMapRegion(ArrayView<float> us,
                                  ArrayView<float> vs,
                                  float uOffset = 1.0f,
                                  float vOffset = 0.0f,
                                  float uvCompareThreshold = 0.0002f);

}  // namespace dnac
