// Copyright Epic Games, Inc. All Rights Reserved.

#pragma once

#include "dna/types/Aliases.h"

#include <pma/PolyAllocator.h>
#include <pma/TypeDefs.h>
#include <pma/resources/AlignedMemoryResource.h>
#include <pma/resources/ArenaMemoryResource.h>
#include <pma/resources/DefaultMemoryResource.h>
#include <terse/types/DynArray.h>

namespace dna {

using namespace pma;

template<typename T>
using AlignedAllocator = PolyAllocator<T, 64ul, AlignedMemoryResource>;

template<typename T>
using DynArray = terse::DynArray<T, PolyAllocator<T> >;

template<typename T>
using AlignedDynArray = terse::DynArray<T, AlignedAllocator<T> >;

}  // namespace dna
