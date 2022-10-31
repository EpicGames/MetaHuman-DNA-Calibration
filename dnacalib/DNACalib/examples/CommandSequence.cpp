// Copyright Epic Games, Inc. All Rights Reserved.

#include "dnacalib/DNACalib.h"

#include <iostream>
#include <vector>

static const char* usage = "Usage: commandsequence.exe <path-to-dna-file-to-edit>\n";

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

    // Create command sequence instance
    dnac::CommandSequence cmdSeq;

    // Prepare a bunch of commands
    std::vector<dnac::Vector3> positions;
    std::vector<float> masks;
    dnac::SetVertexPositionsCommand setMeshAPos{2, dnac::ConstArrayView<dnac::Vector3>{positions},
                                                dnac::ConstArrayView<float>{masks},
                                                dnac::VectorOperation::Interpolate};
    dnac::RenameJointCommand renameJointA("clavicle_l", "cubicle_l");
    dnac::RenameJointCommand renameJointB(10, "upperarm_corrosiveRoot_l");

    // Add commands to the command sequence
    cmdSeq.add(&setMeshAPos, &renameJointA);
    cmdSeq.add(&renameJointB);

    // Execute command sequence
    cmdSeq.run(dnaReader.get());

    // Reconfigure individual commands that are already in the command sequence
    renameJointB.setName("FACIAL_L_12IPV_NeckBackB2", "FACIAL_L_12IPTV_NickelBackB52");

    // Modify command sequence (turn an unconditional command into a conditional command)
    cmdSeq.remove(&renameJointA);
    auto guardedRenameJointA =
        dnac::makeConditional(&renameJointA, [](dnac::RenameJointCommand* command, dnac::DNACalibDNAReader* output) {
        return (output->getJointCount() > 6);
    });
    cmdSeq.add(&guardedRenameJointA);

    // Execute modified command sequence
    cmdSeq.run(dnaReader.get());

    return 0;
}
