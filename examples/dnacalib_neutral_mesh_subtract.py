"""
This example demonstrates how to subtract values from a neutral mesh and transfer those changes to its lower LOD meshes.
- usage in command line:
    - call without arguments:
        python dnacalib_neutral_mesh_subtract.py
        mayapy dnacalib_neutral_mesh_subtract.py

        Expected: Script will generate Ada_new.dna in OUTPUT_DIR from original Ada.dna.
    - call with arguments:
        python dnacalib_neutral_mesh_subtract.py --dna_path=<PATH TO INPUT FILE> --output_dna=<PATH TO NEW FILE>
        mayapy dnacalib_neutral_mesh_subtract.py --dna_path=<PATH TO INPUT FILE> --output_dna=<PATH TO NEW FILE>

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
    SetVertexPositionsCommand,
    VectorOperation_Subtract,
    CalculateMeshLowerLODsCommand
)
from math import isclose

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

    if calibrated.getMeshCount() == 0:
        print("No meshes found in DNA.")
        return

    mesh_index = 0
    vtx_count_mesh0 = calibrated.getVertexPositionCount(mesh_index)
    xs = calibrated.getVertexPositionXs(mesh_index)
    ys = calibrated.getVertexPositionYs(mesh_index)
    zs = calibrated.getVertexPositionZs(mesh_index)

    # Example values to subtract from original vertex positions for mesh with index 0
    ones = [1] * vtx_count_mesh0

    # Command used to subtract example values from a specified neutral mesh
    subtract_command = SetVertexPositionsCommand()
    subtract_command.setMeshIndex(mesh_index)
    subtract_command.setOperation(VectorOperation_Subtract)
    subtract_command.setPositions(ones, ones, ones)

    # Alternatively, if you wanted to do the opposite, to subtract neutral mesh values
    # from example values, you could do the following:
    # xs_2 = [x * 2 for x in xs]
    # ys_2 = [y * 2 for y in ys]
    # zs_2 = [z * 2 for z in zs]
    # subtract_command.setPositions(xs_2, ys_2, zs_2)
    # # After running the command, the calibrated DNA will contain -xs, -ys, -zs
    # subtract_command.run(calibrated)
    #
    # # Add the example values, which will result in:
    # # ones - xs
    # # ones - ys
    # # ones - zs
    # add_command = SetVertexPositionsCommand()
    # add_command.setMeshIndex(mesh_index)
    # add_command.setOperation(VectorOperation_Add) # remember to add VectorOperation_Add to the list of imports
    # add_command.setPositions(ones, ones, ones)
    # add_command.run(calibrated)

    print(f"Subtracting values from neutral mesh \'{calibrated.getMeshName(mesh_index)}\'...")
    # Modifies calibrated DNA in-place
    subtract_command.run(calibrated)

    # Command used to recalculate vertex positions of lower LOD neutral meshes of the specified neutral mesh
    calculate_lower_lods_command = CalculateMeshLowerLODsCommand()
    calculate_lower_lods_command.setMeshIndex(mesh_index)

    print("Recalculating values for lower LOD meshes...")
    # Modifies calibrated DNA in-place
    calculate_lower_lods_command.run(calibrated)

    new_xs = calibrated.getVertexPositionXs(mesh_index)
    new_ys = calibrated.getVertexPositionYs(mesh_index)
    new_zs = calibrated.getVertexPositionZs(mesh_index)

    for i in range(vtx_count_mesh0):
        if (not isclose(xs[i] - 1, new_xs[i], rel_tol=1e-7) or
            not isclose(ys[i] - 1, new_ys[i], rel_tol=1e-7) or
            not isclose(zs[i] - 1, new_zs[i], rel_tol=1e-7)):
            raise RuntimeError("Vertex positions were not changed successfully!")

    print("\nSuccessfully changed vertex positions.")

    print("Saving DNA...")
    save_dna(calibrated, output_path)
    print("Done.")


def main():
    parser = argparse.ArgumentParser(description="DNACalib neutral mesh subtract example")
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
