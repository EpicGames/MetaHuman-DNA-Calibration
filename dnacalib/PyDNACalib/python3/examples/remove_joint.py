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

def getJoints(dna):
    joints = []
    for jointIndex in range(dna.getJointCount()):
        joints.append(dna.getJointName(jointIndex))
    return joints

def printJoints(dna):
    for jointIndex in range(dna.getJointCount()):
        print(dna.getJointName(jointIndex))

def calibrateDNA(inputPath, outputPath):
    dna = loadDNA(inputPath)

    # Copies DNA contents and will serve as input/output parameter to command
    calibrated = dnac.DNACalibDNAReader(dna)

    original_joints = getJoints(calibrated)

    # An example joint to remove
    joint_index = 314
    joint_name = calibrated.getJointName(joint_index)

    # Removes joint with specified index
    command = dnac.RemoveJointCommand(joint_index)

    # Modifies calibrated DNA in-place
    command.run(calibrated)

    modified_joints = getJoints(calibrated)

    if ((len(modified_joints) != (len(original_joints) - 1)) or (joint_name in modified_joints)):
        raise RuntimeError("Joint not removed properly!")

    print("Successfully removed joint `{}`.".format(joint_name))

    print("Saving DNA...")
    saveDNA(calibrated, outputPath)

    print("Done.")

def main():
    parser = argparse.ArgumentParser(description="DNACalib remove joint example")
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
