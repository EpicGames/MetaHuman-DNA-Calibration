"""
This example demonstrates creating DNA from scratch.
IMPORTANT: You have to setup the environment before running this example. Please refer to the 'Environment setup' section in README.md.

- usage in command line:
    python dna_demo.py
    mayapy dna_demo.py
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

# If you use Maya, use absolute path
ROOT_DIR = f"{ospath.dirname(ospath.abspath(__file__))}/..".replace("\\", "/")
OUTPUT_DIR = f"{ROOT_DIR}/output"

CHARACTER_NAME = "Ada"

DATA_DIR = f"{ROOT_DIR}/data"
CHARACTER_DNA = f"{DATA_DIR}/dna_files/{CHARACTER_NAME}.dna"
OUTPUT_DNA = f"{OUTPUT_DIR}/{CHARACTER_NAME}_output.dna"


from dna import DataLayer_All, FileStream, Status, BinaryStreamReader, BinaryStreamWriter


def create_dna(path):
    stream = FileStream(path, FileStream.AccessMode_Write, FileStream.OpenMode_Binary)
    writer = BinaryStreamWriter(stream)

    # Sets a couple of parameters about in the dna that is about to be created and written to
    writer.setName("rig name")
    writer.setLODCount(4)
    writer.setJointName(0, "spine")
    writer.setJointName(1, "neck")

    writer.setMeshName(0, "head")
    writer.setVertexPositions(0, [[0.0, 0.5, 0.3], [1.0, 3.0, -8.0]])
    writer.setVertexTextureCoordinates(0, [[0.25, 0.55], [1.5, 3.6]])

    # Creates the DNA
    writer.write()
    if not Status.isOk():
        status = Status.get()
        raise RuntimeError(f"Error saving DNA: {status.message}")


def load_dna(path):
    stream = FileStream(path, FileStream.AccessMode_Read, FileStream.OpenMode_Binary)
    reader = BinaryStreamReader(stream, DataLayer_All)
    reader.read()
    if not Status.isOk():
        status = Status.get()
        raise RuntimeError(f"Error loading DNA: {status.message}")
    return reader


def print_dna_summary(dna_reader):
    print(f"Name: {dna_reader.getName()}")
    print(f"Joint count: {dna_reader.getJointCount()}")
    joint_names = ", ".join(
        dna_reader.getJointName(i) for i in range(dna_reader.getJointCount())
    )
    print(f"Joint names: {joint_names}")

    for mesh_idx in range(dna_reader.getMeshCount()):
        # Get vertices one by one
        for vtx_id in range(dna_reader.getVertexPositionCount(mesh_idx)):
            vtx = dna_reader.getVertexPosition(mesh_idx, vtx_id)
            print(f"Mesh {mesh_idx} - Vertex {vtx_id} : {vtx}")
        # Get all X / Y / Z coordinates
        print(dna_reader.getVertexPositionXs(mesh_idx))
        print(dna_reader.getVertexPositionYs(mesh_idx))
        print(dna_reader.getVertexPositionZs(mesh_idx))

        for tc_idx in range(dna_reader.getVertexTextureCoordinateCount(mesh_idx)):
            tex_coord = dna_reader.getVertexTextureCoordinate(mesh_idx, tc_idx)
            print(f"Mesh {mesh_idx} - Texture coordinate {tc_idx} : {tex_coord}")


def create_new_dna(dna_path):
    create_dna(dna_path)
    dna_reader = load_dna(dna_path)
    print_dna_summary(dna_reader)


if __name__ == "__main__":
    makedirs(OUTPUT_DIR, exist_ok=True)
    create_new_dna(OUTPUT_DNA)
