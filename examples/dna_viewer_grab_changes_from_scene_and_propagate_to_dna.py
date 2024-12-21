"""
This example demonstrates how to propagate changes from maya scene to dna file.
IMPORTANT: You have to setup the environment before running this example. Please refer to the 'Environment setup' section in README.md.

Follow the steps:

1. Start Maya
2. open maya scene (do 2.1 or 2.2)
2.1. Generate new scene using build_meshes or
2.2. start DNA Viewer GUI (dna_viewer_run_in_maya.py)
    - Select DNA file that you want to load and generate scene for
    - Select meshes that you want to change
    - Tick joints in Build Options
    - Click Process
    - in Maya scene rig is going to be assembled
3. Run this script to the part called "load data"
    a. get current vertex positions for all meshes

4. In the scene, make modifications to the neutral mesh and joints (important note:
    if you're rotating joints, be sure to freeze transformations, so they're stored as orientations)
5. Run this script from the part called "propagate changes to dna" to the end
    a. set new joints translations
    b. set new joints rotations
    c. move all meshes vertices to new positions

After performing this steps, your changes in maya scene will pe propagated to dna.

- usage in Maya:
    1. copy whole content of this file to Maya Script Editor
    2. change value of ROOT_DIR to absolute path of dna_calibration, e.g. `c:/dna_calibration` in Windows or `/home/user/dna_calibration`. Important:
    Use `/` (forward slash), because Maya uses forward slashes in path.

- customization:
    - change CHARACTER_NAME to Taro, or the name of a custom DNA file placed in /data/dna_files

Expected:
    - script will generate dna file <CHARACTER_NAME>_modified.dna in OUTPUT_DIR, e.g. Ada_modified.dna
    - script will generate maya scene <CHARACTER_NAME>_modified.mb in OUTPUT_DIR, e.g. Ada_modified.mb
    - script will generate workspace.mel in OUTPUT_DIR

NOTE: If OUTPUT_DIR does not exist, it will be created.
"""

import maya.OpenMaya as om
from maya import cmds

from os import makedirs
from os import path as ospath

CHARACTER_NAME = "Ada"

# If you use Maya, use absolute path
ROOT_DIR = f"{ospath.dirname(ospath.abspath(__file__))}/..".replace("\\", "/")
OUTPUT_DIR = f"{ROOT_DIR}/output"
ROOT_LIB_DIR = f"{ROOT_DIR}/lib"
DATA_DIR = f"{ROOT_DIR}/data"
DNA_DIR = f"{DATA_DIR}/dna_files"
CHARACTER_DNA = f"{DNA_DIR}/{CHARACTER_NAME}.dna"
ANALOG_GUI = f"{DATA_DIR}/analog_gui.ma"
GUI = f"{DATA_DIR}/gui.ma"
ADDITIONAL_ASSEMBLE_SCRIPT = f"{DATA_DIR}/additional_assemble_script.py"
ADD_MESH_NAME_TO_BLEND_SHAPE_CHANNEL_NAME = True

MODIFIED_CHARACTER_DNA = f"{OUTPUT_DIR}/{CHARACTER_NAME}_modified"

from dna import (
    BinaryStreamReader,
    BinaryStreamWriter,
    DataLayer_All,
    FileStream,
    Status,
)
from dnacalib import (
    CommandSequence,
    DNACalibDNAReader,
    SetNeutralJointRotationsCommand,
    SetNeutralJointTranslationsCommand,
    SetVertexPositionsCommand,
    VectorOperation_Add,
)

from dna_viewer import DNA, RigConfig, build_rig, build_meshes


def load_dna_reader(path):
    stream = FileStream(path, FileStream.AccessMode_Read, FileStream.OpenMode_Binary)
    reader = BinaryStreamReader(stream, DataLayer_All)
    reader.read()
    if not Status.isOk():
        status = Status.get()
        raise RuntimeError(f"Error loading DNA: {status.message}")
    return reader


def save_dna(reader):
    stream = FileStream(
        f"{MODIFIED_CHARACTER_DNA}.dna",
        FileStream.AccessMode_Write,
        FileStream.OpenMode_Binary,
    )
    writer = BinaryStreamWriter(stream)
    writer.setFrom(reader)
    writer.write()

    if not Status.isOk():
        status = Status.get()
        raise RuntimeError(f"Error saving DNA: {status.message}")


def get_mesh_vertex_positions_from_scene(meshName):
    try:
        sel = om.MSelectionList()
        sel.add(meshName)

        dag_path = om.MDagPath()
        sel.getDagPath(0, dag_path)

        mf_mesh = om.MFnMesh(dag_path)
        positions = om.MPointArray()

        mf_mesh.getPoints(positions, om.MSpace.kObject)
        return [
            [positions[i].x, positions[i].y, positions[i].z]
            for i in range(positions.length())
        ]
    except RuntimeError:
        print(f"{meshName} is missing, skipping it")
        return None


def run_joints_command(reader, calibrated):
    # Making arrays for joints' transformations and their corresponding mapping arrays
    joint_translations = []
    joint_rotations = []

    for i in range(reader.getJointCount()):
        joint_name = reader.getJointName(i)

        translation = cmds.xform(joint_name, query=True, translation=True)
        joint_translations.append(translation)

        rotation = cmds.joint(joint_name, query=True, orientation=True)
        joint_rotations.append(rotation)

    # This is step 5 sub-step a
    set_new_joints_translations = SetNeutralJointTranslationsCommand(joint_translations)
    # This is step 5 sub-step b
    set_new_joints_rotations = SetNeutralJointRotationsCommand(joint_rotations)

    # Abstraction to collect all commands into a sequence, and run them with only one invocation
    commands = CommandSequence()
    # Add vertex position deltas (NOT ABSOLUTE VALUES) onto existing vertex positions
    commands.add(set_new_joints_translations)
    commands.add(set_new_joints_rotations)

    commands.run(calibrated)
    # Verify that everything went fine
    if not Status.isOk():
        status = Status.get()
        raise RuntimeError(f"Error run_joints_command: {status.message}")


def run_vertices_command(
    calibrated, old_vertices_positions, new_vertices_positions, mesh_index
):
    # Making deltas between old vertices positions and new one
    deltas = []
    for new_vertex, old_vertex in zip(new_vertices_positions, old_vertices_positions):
        delta = []
        for new, old in zip(new_vertex, old_vertex):
            delta.append(new - old)
        deltas.append(delta)

    # This is step 5 sub-step c
    new_neutral_mesh = SetVertexPositionsCommand(
        mesh_index, deltas, VectorOperation_Add
    )
    commands = CommandSequence()
    # Add nex vertex position deltas (NOT ABSOLUTE VALUES) onto existing vertex positions
    commands.add(new_neutral_mesh)
    commands.run(calibrated)

    # Verify that everything went fine
    if not Status.isOk():
        status = Status.get()
        raise RuntimeError(f"Error run_vertices_command: {status.message}")


def assemble_maya_scene():
    dna = DNA(f"{MODIFIED_CHARACTER_DNA}.dna")
    config = RigConfig(
        gui_path=f"{DATA_DIR}/gui.ma",
        analog_gui_path=f"{DATA_DIR}/analog_gui.ma",
        aas_path=ADDITIONAL_ASSEMBLE_SCRIPT,
    )
    build_rig(dna=dna, config=config)

    cmds.file(rename=f"{MODIFIED_CHARACTER_DNA}.mb")
    cmds.file(save=True)


makedirs(OUTPUT_DIR, exist_ok=True)

dna = DNA(CHARACTER_DNA)
##################################
# This is step 2 sub-step 1
# use this block only if you need to assemble of scene from step 2.1
# config = RigConfig(
#     gui_path=f"{DATA_DIR}/gui.ma",
#     analog_gui_path=f"{DATA_DIR}/analog_gui.ma",
#     aas_path=ADDITIONAL_ASSEMBLE_SCRIPT,
# )
# build_meshes(dna=dna, config=config)
# This is end of step 2 sub-step 1
##################################


# This is step 3 sub-step a
current_vertices_positions = {}
mesh_indices = []
for mesh_index, name in enumerate(dna.meshes.names):
    current_vertices_positions[name] = {
        "mesh_index": mesh_index,
        "positions": get_mesh_vertex_positions_from_scene(name),
    }
# Loaded data - end of 3rd step
##################################

##################################
# Modify rig in maya, 4th step
##################################

##################################
# Propagate changes to dna, 5th step
reader = load_dna_reader(CHARACTER_DNA)
calibrated = DNACalibDNAReader(reader)

run_joints_command(reader, calibrated)

for name, item in current_vertices_positions.items():
    new_vertices_positions = get_mesh_vertex_positions_from_scene(name)
    if new_vertices_positions:
        run_vertices_command(
            calibrated, item["positions"], new_vertices_positions, item["mesh_index"]
        )
save_dna(calibrated)
assemble_maya_scene()
