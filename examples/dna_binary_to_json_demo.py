"""
This example demonstrates reading a DNA file in binary format and writing it in a human readable JSON format.
IMPORTANT: You have to setup the environment before running this example. Please refer to the 'Environment setup' section in README.md.

- usage in command line:
    python dna_binary_to_json_demo.py
    mayapy dna_binary_to_json_demo.py
- usage in Maya:
    1. copy whole content of this file to Maya Script Editor
    2. change value of ROOT_DIR to absolute path of dna_calibration, e.g. `c:/dna_calibration` in Windows or `/home/user/dna_calibration`. Important:
    Use `/` (forward slash), because Maya uses forward slashes in path.

- customization:
    - change CHARACTER_NAME to Taro, or the name of a custom DNA file placed in /data/dna_files

Expected: Script will generate Ada_output.json in OUTPUT_DIR from original Ada.dna.
NOTE: If OUTPUT_DIR does not exist, it will be created.
"""

from os import makedirs
from os import path as ospath

# If you use Maya, use absolute path
ROOT_DIR = f"{ospath.dirname(ospath.abspath(__file__))}/..".replace("\\", "/")
OUTPUT_DIR = f"{ROOT_DIR}/output"

CHARACTER_NAME = "Ada"

DATA_DIR = f"{ROOT_DIR}/data"
CHARACTER_DNA = f"{DATA_DIR}/dna_files/{CHARACTER_NAME}.dna"
OUTPUT_DNA = f"{OUTPUT_DIR}/{CHARACTER_NAME}_output.json"

from dna import DataLayer_All, FileStream, Status, BinaryStreamReader, JSONStreamWriter


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
    writer = JSONStreamWriter(stream)
    # Create a writer based on the reader using all data layers (if no argument is passed, DataLayer_All is the default value)
    writer.setFrom(reader)
    # Alternatively, a writer can be created using only a subset of layers,
    # e.g. to write only Behavior layer (Descriptor and Definition included with it), use:
    # writer.setFrom(reader, DataLayer_Behavior)
    #
    # Available layer options and their approximate sizes for this example (Ada.dna, JSON format):
    # DataLayer_Descriptor - ~ 3 KB
    # DataLayer_Definition - includes Descriptor, ~ 131 KB
    # DataLayer_Behavior - includes Descriptor and Definition, ~ 10 MB
    # DataLayer_Geometry - includes Descriptor and Definition, ~ 191 MB
    # DataLayer_GeometryWithoutBlendShapes - includes Descriptor and Definition, ~ 22 MB
    # DataLayer_AllWithoutBlendShapes - includes everything except blend shapes from Geometry, ~ 32 MB
    # DataLayer_All - ~ 201 MB
    #
    # If using one of the other layer options, be sure to add it to the import list.
    #
    # Beside specifying layers when creating a writer, layers to use can be specified when
    # creating a reader as well.
    writer.write()

    if not Status.isOk():
        status = Status.get()
        raise RuntimeError(f"Error saving DNA: {status.message}")


def create_json_dna(input_path, output_path):
    dna_reader = load_dna(input_path)
    save_dna(dna_reader, output_path)
    print('Done.')


if __name__ == "__main__":
    makedirs(OUTPUT_DIR, exist_ok=True)
    create_json_dna(CHARACTER_DNA, OUTPUT_DNA)
