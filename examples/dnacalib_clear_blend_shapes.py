"""
This example demonstrates how to remove all blend shape data from a DNA.
- usage in command line:
    - call without arguments:
        python dnacalib_clear_blend_shapes.py
        mayapy dnacalib_clear_blend_shapes.py

        Expected: Script will generate Ada_new.dna in OUTPUT_DIR from original Ada.dna.
    - call with arguments:
        python dnacalib_clear_blend_shapes.py --dna_path=<PATH TO INPUT FILE> --output_dna=<PATH TO NEW FILE>
        mayapy dnacalib_clear_blend_shapes.py --dna_path=<PATH TO INPUT FILE> --output_dna=<PATH TO NEW FILE>

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
    DNACalibDNAReader,
    ClearBlendShapesCommand
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

def calibrate_dna(input_path, output_path):
    dna = load_dna(input_path)

    # Copies DNA contents and will serve as input/output parameter to commands
    calibrated = DNACalibDNAReader(dna)

    mesh_count = calibrated.getMeshCount()
    print(f"Number of meshes: {mesh_count}")

    for mesh_index in range(mesh_count):
        bs_tgt_count = calibrated.getBlendShapeTargetCount(mesh_index)
        print(f"Number of blendshape targets for mesh {calibrated.getMeshName(mesh_index)}({mesh_index}): {bs_tgt_count}")
        for bs_tgt_index in range(bs_tgt_count):
            bs_tgt_delta_count = calibrated.getBlendShapeTargetDeltaCount(mesh_index, bs_tgt_index)
            print(f"Number of blendshape target deltas for mesh {calibrated.getMeshName(mesh_index)}({mesh_index}), blend shape target {bs_tgt_index}: {bs_tgt_delta_count}")

    print(f"Blend shape channel LODs: {calibrated.getBlendShapeChannelLODs()}")
    print(f"Blend shape channel input indices: {calibrated.getBlendShapeChannelInputIndices()}")
    print(f"Blend shape channel output indices: {calibrated.getBlendShapeChannelOutputIndices()}")

    # Clears all blend shapes
    command = ClearBlendShapesCommand()

    print("\n\nClearing blend shape data...\n\n")
    # Modifies calibrated DNA in-place
    command.run(calibrated)

    for mesh_index in range(mesh_count):
        bs_tgt_count = calibrated.getBlendShapeTargetCount(mesh_index)
        for bs_tgt_index in range(bs_tgt_count):
            bs_tgt_delta_count = calibrated.getBlendShapeTargetDeltaCount(mesh_index, bs_tgt_index)
            if bs_tgt_delta_count:
                raise RuntimeError("Blend shape target deltas not removed properly!")

    bs_channel_lods = calibrated.getBlendShapeChannelLODs()
    bs_channel_input_indices = calibrated.getBlendShapeChannelInputIndices()
    bs_channel_output_indices = calibrated.getBlendShapeChannelOutputIndices()

    if len(bs_channel_lods) or len(bs_channel_input_indices) or len(bs_channel_output_indices):
        raise RuntimeError("Blend shape animation data not removed properly!")

    print(f"Number of meshes: {mesh_count}")

    for mesh_index in range(mesh_count):
        bs_tgt_count = calibrated.getBlendShapeTargetCount(mesh_index)
        print(f"Number of blendshape targets for mesh {calibrated.getMeshName(mesh_index)}({mesh_index}): {bs_tgt_count}")
        for bs_tgt_index in range(bs_tgt_count):
            bs_tgt_delta_count = calibrated.getBlendShapeTargetDeltaCount(mesh_index, bs_tgt_index)
            print(f"Number of blendshape target deltas for mesh {calibrated.getMeshName(mesh_index)}({mesh_index}), blend shape target {bs_tgt_index}: {bs_tgt_delta_count}")

    print(f"Blend shape channel LODs: {bs_channel_lods}")
    print(f"Blend shape channel input indices: {bs_channel_input_indices}")
    print(f"Blend shape channel output indices: {bs_channel_output_indices}")

    print("\n\nSuccessfully cleared blend shape data.")

    print("Saving DNA...")
    save_dna(calibrated, output_path)
    print("Done.")

def main():
    parser = argparse.ArgumentParser(description="DNACalib clear blend shapes example")
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
