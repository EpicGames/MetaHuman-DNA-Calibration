// Copyright Epic Games, Inc. All Rights Reserved.

#include "dna/StreamReader.h"

namespace dna {

StreamReader::~StreamReader() = default;

const sc::StatusCode StreamReader::SignatureMismatchError{200, "DNA signature mismatched, expected %.3s, got %.3s"};
const sc::StatusCode StreamReader::VersionMismatchError{201, "DNA version mismatched, expected %hu.%hu, got %hu.%hu"};
const sc::StatusCode StreamReader::InvalidDataError{202, "Invalid data in DNA"};

}  // namespace dna
