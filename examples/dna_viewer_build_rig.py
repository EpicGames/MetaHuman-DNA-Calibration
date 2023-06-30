"""
This example demonstrates generating functional rig in maya scene and exporting fbx per lod.
IMPORTANT: You have to setup the environment before running this example. Please refer to the 'Environment setup' section in README.md.

- usage in command line:
    python dna_viewer_build_rig.py
    mayapy dna_viewer_build_rig.py
    NOTE: Script cannot be called with Python, it must be called with mayapy.

- usage in Maya:
    1. copy whole content of this file to Maya Script Editor
    2. change value of ROOT_DIR to absolute path of dna_calibration, e.g. `c:/dna_calibration` in Windows or `/home/user/dna_calibration`. Important:
    Use `/` (forward slash), because Maya uses forward slashes in path.

- customization:
    - change CHARACTER_NAME to Taro, or the name of a custom DNA file placed in /data/dna_files
Expected:
    - script will generate maya scene Ada.mb in OUTPUT_DIR
    - script will generate workspace.mel in OUTPUT_DIR
    - script will copy original Ada.dna file to OUTPUT_DIR

Expected: script will generate <PATH TO NEW DNA FILE>.
NOTE: If OUTPUT_DIR does not exist, it will be created.
"""


from os import makedirs
from os import path as ospath
from shutil import copyfile

# if you use Maya, use absolute path
ROOT_DIR = f"{ospath.dirname(ospath.abspath(__file__))}/..".replace("\\", "/")
OUTPUT_DIR = f"{ROOT_DIR}/output"
EXAMPLES_DIR = f"{ROOT_DIR}/examples"
ROOT_LIB_DIR = f"{ROOT_DIR}/lib"

CHARACTER_NAME = "Ada"

DATA_DIR = f"{ROOT_DIR}/data"
CHARACTER_DNA = f"{DATA_DIR}/dna_files/{CHARACTER_NAME}.dna"
ANALOG_GUI = f"{DATA_DIR}/analog_gui.ma"
GUI = f"{DATA_DIR}/gui.ma"
ADDITIONAL_ASSEMBLE_SCRIPT = f"{DATA_DIR}/additional_assemble_script.py"


from maya import cmds, mel

from dna_viewer import DNA, RigConfig, build_rig


if __name__ == "__main__":
    dna = DNA(CHARACTER_DNA)

    makedirs(OUTPUT_DIR, exist_ok=True)

    # This fixes warning when calling this script with headless maya Warning: line 1: Unknown object type: HIKCharacterNode
    mel.eval(f"HIKCharacterControlsTool;")

    # Generate workspace.mel
    mel.eval(f'setProject "{OUTPUT_DIR}";')

    config = RigConfig(
        gui_path=GUI,
        analog_gui_path=ANALOG_GUI,
        aas_path=ADDITIONAL_ASSEMBLE_SCRIPT,
    )

    # Creates the rig
    build_rig(dna=dna, config=config)
    # Renames and saves the scene
    cmds.file(rename=f"{OUTPUT_DIR}/{CHARACTER_NAME}.mb")
    cmds.file(save=True)
    # Copy dna file and workspace file alongside generated scene
    copyfile(CHARACTER_DNA, f"{OUTPUT_DIR}/{CHARACTER_NAME}.dna")
