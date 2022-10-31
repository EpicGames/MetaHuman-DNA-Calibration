"""
This example demonstrates rename of a joint.
- usage in command line:
    - call without arguments:
        python rename_joint_demo.py
        mayapy rename_joint_demo.py

        Expected: Script will generate Ada_new.dna in OUTPUT_DIR.
- usage in Maya:
    1. copy whole content of this file to Maya Script Editor
    2. change value of ROOT_DIR to absolute path of dna_calibration, e.g. `c:/dna_calibration` in Windows or `/home/user/dna_calibration`. Important:
    Use `/` (forward slash), because Maya uses forward slashes in path.
- customization:
    - change value of DNA to Taro, or name of file which is copied to /data/dna

NOTE: If running on Linux, please make sure to append the LD_LIBRARY_PATH with absolute path to the lib/linux directory before running the example:
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:<path-to-lib-linux-dir>
"""


from os import environ, makedirs
from os import path as ospath
from sys import path as syspath
from sys import platform

# if you use Maya, use absolute path
ROOT_DIR = f"{ospath.dirname(ospath.abspath(__file__))}/..".replace("\\", "/")
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
from dnacalib import DNACalibDNAReader, RenameJointCommand


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


CHARACTER_NAME = "Ada"
DATA_DIR = f"{ROOT_DIR}/data"
DNA_DIR = f"{DATA_DIR}/dna"
OUTPUT_DIR = f"{ROOT_DIR}/output"
makedirs(OUTPUT_DIR, exist_ok=True)
DNA_CHARACTER = f"{DNA_DIR}/{CHARACTER_NAME}.dna"
DNA_CHARACTER_NEW = f"{OUTPUT_DIR}/{CHARACTER_NAME}_new.dna"

dna_reader = load_dna(DNA_CHARACTER)
calibrated = DNACalibDNAReader(dna_reader)
# Prints current joint name
print(calibrated.getJointName(10))
# Creates rename command
rename = RenameJointCommand(10, "NewJointA")
# Executes command
rename.run(calibrated)
# Prints the new joint name
print(calibrated.getJointName(10))
save_dna(calibrated, DNA_CHARACTER_NEW)
