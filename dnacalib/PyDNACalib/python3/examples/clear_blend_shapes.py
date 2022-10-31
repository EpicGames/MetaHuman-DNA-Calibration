#-*- coding: utf-8 -*-
import argparse

import dnacalib as dnac
import dna


def loadDNA(path):
    stream = dna.FileStream(path, dna.FileStream.AccessMode_Read, dna.FileStream.OpenMode_Binary)
    reader = dna.BinaryStreamReader(stream, dna.DataLayer_All)
    reader.read()
    if not dna.Status.isOk():
        status = dna.Status.get()
        raise RuntimeError("Error loading DNA: {}".format(status.message))
    return reader


def saveDNA(reader, path):
    stream = dna.FileStream(path, dna.FileStream.AccessMode_Write, dna.FileStream.OpenMode_Binary)
    writer = dna.BinaryStreamWriter(stream)
    writer.setFrom(reader)
    writer.write()

    if not dna.Status.isOk():
        status = dna.Status.get()
        raise RuntimeError("Error saving DNA: {}".format(status.message))

def calibrateDNA(inputPath, outputPath):
    dna = loadDNA(inputPath)

    # Copies DNA contents and will serve as input/output parameter to command
    calibrated = dnac.DNACalibDNAReader(dna)

    mesh_count = calibrated.getMeshCount()
    print("Number of meshes: {}".format(mesh_count))

    for mesh_index in range(mesh_count):
        bs_tgt_count = calibrated.getBlendShapeTargetCount(mesh_index)
        print("Number of blendshape targets for mesh {}({}): {}".format(calibrated.getMeshName(mesh_index), mesh_index, bs_tgt_count))
        for bs_tgt_index in range(bs_tgt_count):
            bs_tgt_delta_count = calibrated.getBlendShapeTargetDeltaCount(mesh_index, bs_tgt_index)
            print("Number of blendshape target deltas for mesh {}({}), blend shape target {}: {}".format(calibrated.getMeshName(mesh_index), mesh_index, bs_tgt_index, bs_tgt_delta_count))

    print("Blend shape channel LODs: {}".format(calibrated.getBlendShapeChannelLODs()))
    print("Blend shape channel input indices: {}".format(calibrated.getBlendShapeChannelInputIndices()))
    print("Blend shape channel output indices: {}".format(calibrated.getBlendShapeChannelOutputIndices()))

    # Clears all blend shapes
    command = dnac.ClearBlendShapesCommand()

    print("\n\nClearing blend shape data...\n\n")
    # Modifies calibrated DNA in-place
    command.run(calibrated)

    for mesh_index in range(mesh_count):
        bs_tgt_count = calibrated.getBlendShapeTargetCount(mesh_index)
        for bs_tgt_index in range(bs_tgt_count):
            bs_tgt_delta_count = calibrated.getBlendShapeTargetDeltaCount(mesh_index, bs_tgt_index)
            if bs_tgt_delta_count != 0:
                raise RuntimeError("Blend shape target deltas not removed properly!")

    bs_channel_lods = calibrated.getBlendShapeChannelLODs()
    bs_channel_input_indices = calibrated.getBlendShapeChannelInputIndices()
    bs_channel_output_indices = calibrated.getBlendShapeChannelOutputIndices()

    if (len(bs_channel_lods) != 0) or (len(bs_channel_input_indices) != 0) or (len(bs_channel_output_indices) != 0):
        raise RuntimeError("Blend shape animation data not removed properly!")

    print("Number of meshes: {}".format(mesh_count))

    for mesh_index in range(mesh_count):
        bs_tgt_count = calibrated.getBlendShapeTargetCount(mesh_index)
        print("Number of blendshape targets for mesh {}({}): {}".format(calibrated.getMeshName(mesh_index), mesh_index, bs_tgt_count))
        for bs_tgt_index in range(bs_tgt_count):
            bs_tgt_delta_count = calibrated.getBlendShapeTargetDeltaCount(mesh_index, bs_tgt_index)
            print("Number of blendshape target deltas for mesh {}({}), blend shape target {}: {}".format(calibrated.getMeshName(mesh_index), mesh_index, bs_tgt_index, bs_tgt_delta_count))

    print("Blend shape channel LODs: {}".format(bs_channel_lods))
    print("Blend shape channel input indices: {}".format(bs_channel_input_indices))
    print("Blend shape channel output indices: {}".format(bs_channel_output_indices))

    print("\n\nSuccessfully cleared blend shape data.")

    print("Saving DNA...")
    saveDNA(calibrated, outputPath)
    print("Done.")

def main():
    parser = argparse.ArgumentParser(description="DNACalib clear blend shapes example")
    parser.add_argument('input_dna',
                        metavar='input-dna',
                        help='Path to DNA file to load')
    parser.add_argument('output_dna',
                        metavar='output-dna',
                        help='Path where to save modified DNA file')

    args = parser.parse_args()

    calibrateDNA(args.input_dna, args.output_dna)


if __name__ == '__main__':
    main()
