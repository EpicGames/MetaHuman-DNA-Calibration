"""
This example demonstrates a few DNACalib's commands.
IMPORTANT: You have to setup the environment before running this example. Please refer to the 'Environment setup' section in README.md.

- usage in command line:
    python dnacalib_remove_joint.py
    mayapy dnacalib_remove_joint.py
- usage in Maya:
    1. copy whole content of this file to Maya Script Editor
    2. change value of ROOT_DIR to absolute path of dna_calibration, e.g. `c:/dna_calibration` in Windows or `/home/user/dna_calibration`. Important:
    Use `/` (forward slash), because Maya uses forward slashes in path.

- customization:
    - change CHARACTER_NAME to Taro, or the name of a custom DNA file placed in /data/dna_files

Expected: Script will generate Ada_output.dna in OUTPUT_DIR from original Ada.dna.
NOTE: If OUTPUT_DIR does not exist, it will be created.
"""


from os import makedirs
from os import path as ospath

# if you use Maya, use absolute path
ROOT_DIR = f"{ospath.dirname(ospath.abspath(__file__))}/..".replace("\\", "/")
OUTPUT_DIR = f"{ROOT_DIR}/output"

CHARACTER_NAME = "Ada"

DATA_DIR = f"{ROOT_DIR}/data"
CHARACTER_DNA = f"{DATA_DIR}/dna_files/{CHARACTER_NAME}.dna"
OUTPUT_DNA = f"{OUTPUT_DIR}/{CHARACTER_NAME}_output.dna"

from dna import DataLayer_All, FileStream, Status, BinaryStreamReader, BinaryStreamWriter
from dnacalib import (
    DNACalibDNAReader,
    RemoveJointCommand,
)


def load_dna(path):
    stream = FileStream(path, FileStream.AccessMode_Read, FileStream.OpenMode_Binary)
    reader = BinaryStreamReader(stream, DataLayer_All)
    reader.read()
    if not Status.isOk():
        status = Status.get()
        raise RuntimeError(f"Error loading DNA: {status.message}")
    return reader


def save_dna(reader, path):
    stream = FileStream(path, FileStream.AccessMode_Write, FileStream.OpenMode_Binary)
    writer = BinaryStreamWriter(stream)
    writer.setFrom(reader)
    writer.write()

    if not Status.isOk():
        status = Status.get()
        raise RuntimeError(f"Error saving DNA: {status.message}")


def get_joints(dna):
    joints = []
    for jointIndex in range(dna.getJointCount()):
        joints.append(dna.getJointName(jointIndex))
    return joints


def calibrate_dna(input_path, output_path):
    dna = load_dna(input_path)

    # Copies DNA contents and will serve as input/output parameter to command
    calibrated = DNACalibDNAReader(dna)

    original_joints = get_joints(calibrated)

    # An example joint to remove
    joint_index = 314
    joint_name = calibrated.getJointName(joint_index)

    # Removes joint with specified index
    command = RemoveJointCommand(joint_index)

    # Modifies calibrated DNA in-place
    command.run(calibrated)

    modified_joints = get_joints(calibrated)

    if (len(modified_joints) != (len(original_joints) - 1)) or (joint_name in modified_joints):
        raise RuntimeError("Joint not removed properly!")

    print(f"Successfully removed joint `{joint_name}`.")

    print("Saving DNA...")
    save_dna(calibrated, output_path)

    print("Done.")


if __name__ == "__main__":
    makedirs(OUTPUT_DIR, exist_ok=True)
    calibrate_dna(CHARACTER_DNA, OUTPUT_DNA)
