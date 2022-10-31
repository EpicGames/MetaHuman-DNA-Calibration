"""
This example demonstrates creation of a new DNA from an existing one by extracting specific lods.
- usage in command line:
    - call without arguments:
        python dnacalib_lod_demo.py
        mayapy dnacalib_lod_demo.py

        Expected: Script will generate Ada_with_lods_1_and_3.dna in OUTPUT_DIR, from original Ada.dna.
        NOTE: If OUTPUT_DIR does not exist, it will be created.

- usage in Maya:
    1. copy whole content of this file to Maya Script Editor
    2. change value of ROOT_DIR to absolute path of dna_calibration, e.g. `c:/dna_calibration` in Windows or `/home/user/dna_calibration`. Important:
    Use `/` (forward slash), because Maya uses forward slashes in path.

    Expected: Script will generate Ada_with_lods_1_and_3.dna in OUTPUT_DIR, from original Ada.dna.
    NOTE: If OUTPUT_DIR does not exist, it will be created.

- customization:
    - change value of DNA to Taro, or name of file which is copied to /data/dna
    - change value of LODS to list of lods needed to be extracted

NOTE: If running on Linux, please make sure to append the LD_LIBRARY_PATH with absolute path to the lib/linux directory before running the example:
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:<path-to-lib-linux-dir>
"""


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

import dnacalib as dnacalib
import dna

# Sets DNA file path
DNA = f"{ROOT_DIR}/data/dna/Ada.dna"
# Sets new DNA output file path
DNA_NEW = f"{OUTPUT_DIR}/Ada_with_lods_1_and_3.dna"
# Sets lods to extract
LODS = [1, 3]

def save_dna(reader: dnacalib.DNACalibDNAReader, created_dna_path: str):
    # Saves the dna
    stream = dna.FileStream(created_dna_path, dna.FileStream.AccessMode_Write, dna.FileStream.OpenMode_Binary)
    writer = dna.BinaryStreamWriter(stream)
    writer.setFrom(reader)
    writer.write()

def run_SetLODsCommand(reader):
    calibrated = dnacalib.DNACalibDNAReader(reader)
    command = dnacalib.SetLODsCommand()
    # Set a list of LODs that will be exported to the new file
    command.setLODs(LODS)
    # Runs the command that reduces LODs of the DNA
    command.run(calibrated)
    print("Setting new LODs...")

    if calibrated.getLODCount() != 2:
        raise RuntimeError("Setting new number of LODs in DNA was unsuccessful!")

    print("\nSuccessfully changed number of LODs in DNA.")
    print("Saving DNA...")
    # Save the newly created DNA
    save_dna(calibrated, DNA_NEW)
    print("Done.")
    
def load_dna_calib(dna_path: str):
    # Load the DNA
    stream = dna.FileStream(dna_path, dna.FileStream.AccessMode_Read, dna.FileStream.OpenMode_Binary)
    reader = dna.BinaryStreamReader(stream, dna.DataLayer_All)
    reader.read()
    return reader

makedirs(OUTPUT_DIR, exist_ok=True)
reader = load_dna_calib(DNA)
run_SetLODsCommand(reader)
