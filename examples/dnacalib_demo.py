"""
This example demonstrates a few DNACalib's commands.
- usage in command line:
    - call without arguments:
        python dnacalib_demo.py
        mayapy dnacalib_demo.py

        Expected: Script will generate Ada_new.dna in OUTPUT_DIR from original Ada.dna.
    - call with arguments:
        python dnacalib_demo.py --dna_path=<PATH TO INPUT FILE> --output_dna=<PATH TO NEW FILE>
        mayapy dnacalib_demo.py --dna_path=<PATH TO INPUT FILE> --output_dna=<PATH TO NEW FILE>

        Expected: script will generate <PATH TO NEW FILE>.
        NOTE: The directory referenced by the given path must exist. If the directory does not exist, the script is going to fail.
- usage in Maya:
    1. copy whole content of this file to Maya Script Editor
    2. delete "if __name__ == "__main__":
            main()"
    3. delete whole "def main" method
    4. change value of ROOT_DIR to absolute path of dna_calibration, e.g. `c:/dna_calibration` in Windows or `/home/user/dna_calibration`. Important:
    Use `/` (forward slash), because Maya uses forward slashes in path.
    5. call method calibrate_dna(<PATH TO INPUT FILE>, <PATH TO NEW FILE>)

    Expected: script will generate <PATH TO NEW FILE>.
    NOTE: The directory referenced by the given path must exist. If the directory does not exist, the script is going to fail.

NOTE: If running on Linux, please make sure to append the LD_LIBRARY_PATH with absolute path to the lib/linux directory before running the example:
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:<path-to-lib-linux-dir>
"""


import argparse
from os import environ, makedirs
from os import path as ospath
from sys import path as syspath
from sys import platform

# if you use Maya, use absolute path
ROOT_DIR = f"{ospath.dirname(ospath.abspath(__file__))}/..".replace("\\", "/")
OUTPUT_DIR = f"{ROOT_DIR}/output"
ROOT_LIB_DIR = f"{ROOT_DIR}/lib"
if platform == "win32":
    LIB_DIR = f"{ROOT_LIB_DIR}/windows"
elif platform == "linux":
    LIB_DIR = f"{ROOT_LIB_DIR}/linux"
else:
    raise OSError(
        "OS not supported, please compile dependencies and add value to LIB_DIR"
    )

# Add bin directory to maya plugin path
if "MAYA_PLUG_IN_PATH" in environ:
    separator = ":" if platform == "linux" else ";"
    environ["MAYA_PLUG_IN_PATH"] = separator.join([environ["MAYA_PLUG_IN_PATH"], LIB_DIR])
else:
    environ["MAYA_PLUG_IN_PATH"] = LIB_DIR

# Adds directories to path
syspath.insert(0, ROOT_DIR)
syspath.insert(0, LIB_DIR)

from dna import DataLayer_All, FileStream, Status, BinaryStreamReader, BinaryStreamWriter
from dnacalib import (
    CommandSequence,
    DNACalibDNAReader,
    RenameJointCommand,
    ScaleCommand,
    SetBlendShapeTargetDeltasCommand,
    SetVertexPositionsCommand,
    VectorOperation_Add,
    VectorOperation_Interpolate,
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


def build_command_list():
    # Abstraction to collect all commands into a sequence, and run them with only one invocation
    commands = CommandSequence()

    print("Creating a sequence of commands...")
    # Instantiate command with parameters: scale-factor = 2 , origin-xyz = (0, 120, 0)
    scale_by_two = ScaleCommand(2.0, [0.0, 120.0, 0.0])
    # Alternatively a command can be instantiated empty, and populated with parameters later, e.g.:
    # scale_by_two = ScaleCommand()
    # scale_by_two.setScale(2.0)
    # scale_by_two.setOrigin([0.0, 120.0, 0.0])
    commands.add(scale_by_two)

    print("Added command to scale dna")
    # Rename by joint index (faster)
    commands.add(RenameJointCommand(10, "NewJointA"))

    # Rename by matching joint name (slower)
    commands.add(RenameJointCommand("OldJointB", "NewJointB"))

    print("Added command to rename joint")
    # Interpolate blend shape target deltas between original DNA and below specified deltas
    # ¯\_(ツ)_/¯
    # Deltas in [[x, y, z], [x, y, z], [x, y, z]] format
    blend_shape_target_deltas = [[0.0, 0.0, 2.0], [0.0, -1.0, 4.0], [3.0, -3.0, 8.0]]
    # Weights for interpolation between original deltas and above defined deltas
    # 1.0 == take the new value completely, 0.0 means keep the old value
    # Format: [Delta-0-Mask, Delta-1-Mask, Delta-2-Mask]
    masks = [1.0, 0.0, 0.5]
    set_blend_shapes_m0_b0 = SetBlendShapeTargetDeltasCommand(
        0,  # mesh index
        0,  # blend shape target index
        blend_shape_target_deltas,
        masks,
        VectorOperation_Interpolate,
    )
    commands.add(set_blend_shapes_m0_b0)
    print("Added command to change blend shape target deltas")

    # Add vertex position deltas onto existing vertex positions
    # Note the alternative data format, instead of using nested lists, separate all X, Y, Z
    # components into distinct lists (might also be faster)
    position_xs = [1.0, -4.5, 7.2]
    position_ys = [2.0, -5.5, -8.3]
    position_zs = [3.0, -6.5, 9.7]
    # Weights to be multiplied with the above specified delta positions, before adding
    # them onto the original data
    # Format: [Delta-0-Weight, Delta-1-Weight, Delta-2-Weight]
    masks = [1.0, 0.2, 0.4]
    set_vertices_m0 = SetVertexPositionsCommand(
        0,  # mesh index
        position_xs,
        position_ys,
        position_zs,
        masks,
        VectorOperation_Add,
    )
    commands.add(set_vertices_m0)
    print("Added command to change vertex positions")

    return commands


def calibrate_dna(input_path, output_path):
    dna = load_dna(input_path)

    # Copies DNA contents and will serve as input/output parameter to commands
    calibrated = DNACalibDNAReader(dna)

    commands = build_command_list()

    print("Running command sequence...")
    # Modifies calibrated DNA in-place
    commands.run(calibrated)

    print("Saving DNA...")
    save_dna(calibrated, output_path)

    print("Done.")

def main():
    parser = argparse.ArgumentParser(description="DNACalib demo")
    parser.add_argument(
        "--input_dna", metavar="input_dna", help="Path to DNA file to load", default=f"{ROOT_DIR}/data/dna/Ada.dna"
    )
    parser.add_argument(
        "--output_dna",
        metavar="output_dna",
        help="Path where to save modified DNA file",
        default=f"{OUTPUT_DIR}/Ada_new.dna"
    )

    makedirs(OUTPUT_DIR, exist_ok=True)
    args = parser.parse_args()

    calibrate_dna(args.input_dna, args.output_dna)


if __name__ == "__main__":
    main()
