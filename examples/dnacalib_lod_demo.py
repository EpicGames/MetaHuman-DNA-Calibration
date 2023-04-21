"""
This example demonstrates creation of a new DNA from an existing one by extracting specific lods.
IMPORTANT: You have to setup the environment before running this example. Please refer to the 'Environment setup' section in README.md.

- usage in command line:
    python dnacalib_lod_demo.py
    mayapy dnacalib_lod_demo.py

- usage in Maya:
    1. copy whole content of this file to Maya Script Editor
    2. change value of ROOT_DIR to absolute path of dna_calibration, e.g. `c:/dna_calibration` in Windows or `/home/user/dna_calibration`. Important:
    Use `/` (forward slash), because Maya uses forward slashes in path.

- customization:
    - change CHARACTER_NAME to Taro, or the name of a custom DNA file placed in /data/dna_files
    - change value of LODS to list of lods needed to be extracted

Expected: Script will generate Ada_with_lods_1_and_3.dna in OUTPUT_DIR, from original Ada.dna.
NOTE: If OUTPUT_DIR does not exist, it will be created.
"""


from os import makedirs
from os import path as ospath

# if you use Maya, use absolute path
ROOT_DIR = f"{ospath.dirname(ospath.abspath(__file__))}/..".replace("\\", "/")
OUTPUT_DIR = f"{ROOT_DIR}/output"

import dnacalib as dnacalib
import dna

# Sets DNA file path
DNA = f"{ROOT_DIR}/data/dna_files/Ada.dna"
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


if __name__ == "__main__":
    makedirs(OUTPUT_DIR, exist_ok=True)
    reader = load_dna_calib(DNA)
    run_SetLODsCommand(reader)
