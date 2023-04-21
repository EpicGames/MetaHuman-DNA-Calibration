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


def buildCommandList():
    # Abstraction to collect all commands into a sequence, and run them with only one invocation
    commands = dnac.CommandSequence()

    print("Creating a sequence of commands...")
    # Instantiate command with parameters: scale-factor = 2 , origin-xyz = (0, 120, 0)
    scaleByTwo = dnac.ScaleCommand(2.0, [0.0, 120.0, 0.0])
    # Alternatively a command can be instantiated empty, and populated with parameters later, e.g.:
    # scaleByTwo = dnac.ScaleCommand()
    # scaleByTwo.setScale(2.0)
    # scaleByTwo.setOrigin([0.0, 120.0, 0.0])
    commands.add(scaleByTwo)

    print("Added command to scale dna")
    # Rename by joint index (faster)
    commands.add(dnac.RenameJointCommand(10, "NewJointA"))

    # Rename by matching joint name (slower)
    commands.add(dnac.RenameJointCommand("OldJointB", "NewJointB"))

    print("Added command to rename joint")
    # Interpolate blend shape target deltas between original DNA and below specified deltas
    # ¯\_(ツ)_/¯
    # Deltas in [[x, y, z], [x, y, z], [x, y, z]] format
    blendShapeTargetDeltas = [[0.0, 0.0, 2.0], [0.0, -1.0, 4.0], [3.0, -3.0, 8.0]]
    vertexIndices = [0, 1, 2]
    # Weights for interpolation between original deltas and above defined deltas
    # 1.0 == take the new value completely, 0.0 means keep the old value
    # Format: [Delta-0-Mask, Delta-1-Mask, Delta-2-Mask]
    masks = [1.0, 0.0, 0.5]
    setBlendShapesM0B0 = dnac.SetBlendShapeTargetDeltasCommand(0,  # mesh index
                                                             0,  # blend shape target index
                                                             blendShapeTargetDeltas,
                                                             vertexIndices,
                                                             masks,
                                                             dnac.VectorOperation_Interpolate)
    commands.add(setBlendShapesM0B0)
    print("Added command to change blend shape target deltas")

    # Add vertex position deltas onto existing vertex positions
    # Note the alternative data format, instead of using nested lists, separate all X, Y, Z
    # components into distinct lists (might also be faster)
    positionXs = [1.0, -4.5, 7.2]
    positionYs = [2.0, -5.5, -8.3]
    positionZs = [3.0, -6.5, 9.7]
    # Weights to be multiplied with the above specified delta positions, before adding
    # them onto the original data
    # Format: [Delta-0-Weight, Delta-1-Weight, Delta-2-Weight]
    masks = [1.0, 0.2, 0.4]
    setVerticesM0 = dnac.SetVertexPositionsCommand(0,  # mesh index
                                                 positionXs,
                                                 positionYs,
                                                 positionZs,
                                                 masks,
                                                 dnac.VectorOperation_Add)
    commands.add(setVerticesM0)
    print("Added command to change vertex positions")

    return commands


def calibrateDNA(inputPath, outputPath):
    dna = loadDNA(inputPath)

    # Copies DNA contents and will serve as input/output parameter to commands
    calibrated = dnac.DNACalibDNAReader(dna)

    commands = buildCommandList()

    print("Running command sequence...")
    # Modifies calibrated DNA in-place
    commands.run(calibrated)

    print("Saving DNA...")
    saveDNA(calibrated, outputPath)

    print("Done.")

def main():
    parser = argparse.ArgumentParser(description="DNACalib demo")
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
