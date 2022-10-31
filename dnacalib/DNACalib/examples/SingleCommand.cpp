// Copyright Epic Games, Inc. All Rights Reserved.

#include "dnacalib/DNACalib.h"

#include <iostream>
#include <vector>

static const char* usage = "Usage: singlecommand.exe <path-to-dna-file-to-edit>\n";

int main(int argc, char** argv) {
    if (argc < 2) {
        std::cout << "Provide input dna file!" << std::endl;
        std::cout << usage << std::endl;
        return -1;
    }

    const char* inputDNA = argv[1];
    auto inStream = dnac::makeScoped<dnac::FileStream>(inputDNA,
                                                       dnac::FileStream::AccessMode::Read,
                                                       dnac::FileStream::OpenMode::Binary);
    auto reader = dnac::makeScoped<dnac::BinaryStreamReader>(inStream.get());
    reader->read();

    if (!dnac::Status::isOk()) {
        std::cout << "Could not read input DNA file!\n";
        return -1;
    }

    auto dnaReader = dnac::makeScoped<dnac::DNACalibDNAReader>(reader.get());

    // Execute a one-off single command
    dnac::RenameBlendShapeCommand renameBlendShapeA("brow_lateral_L", "wow");
    renameBlendShapeA.run(dnaReader.get());

    return 0;
}
