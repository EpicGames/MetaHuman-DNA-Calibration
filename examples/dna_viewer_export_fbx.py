"""
This example demonstrates generating functional rig in maya scene and exporting fbx per lod.
IMPORTANT: You have to setup the environment before running this example. Please refer to the 'Environment setup' section in README.md.

- usage in command line:
    python dna_viewer_export_fbx.py
    mayapy dna_viewer_export_fbx.py
    NOTE: Script cannot be called with Python, it must be called with mayapy.

- usage in Maya:
    1. copy whole content of this file to Maya Script Editor
    2. change value of ROOT_DIR to absolute path of dna_calibration, e.g. `c:/dna_calibration` in Windows or `/home/user/dna_calibration`. Important:
    Use `/` (forward slash), because Maya uses forward slashes in path.

- customization:
- change CHARACTER_NAME to Taro, or the name of a custom DNA file placed in /data/dna_files. If you change name to Taro,
    or some other Masculine character, you need to change BODY_FILE with value f"{BODY_DIR}/masc_skeleton.ma"
    - change ADD_COLOR_VERTEX to True, if you want to import fbx in Unreal Engine with painted vertices for fallowing cases:
        - vertex normals that are going to be updated during import in Unreal Engine, its vertices must be painted with green color.
        - for potential future GeneSplicer usage, skinwights on vertices which will need update in character mixing process, must be painted with blue color.
    - change UP_AXIS in order change up axis, it can be 'z' or 'y', if put any value is put, ValueError will be raised

Expected:
    - script will generate fbx files Ada_lodX.mb where X are values from 0 to 7, in OUTPUT_DIR
    - script will generate workspace.mel in OUTPUT_DIR

NOTE: If OUTPUT_DIR does not exist, it will be created.
"""


from os import makedirs
from os import path as ospath
from pathlib import Path

# if you use Maya, use absolute path
ROOT_DIR = f"{ospath.dirname(ospath.abspath(__file__))}/..".replace("\\", "/")
OUTPUT_DIR = f"{ROOT_DIR}/output"
EXAMPLES_DIR = f"{ROOT_DIR}/examples"
ROOT_LIB_DIR = f"{ROOT_DIR}/lib"
DATA_DIR = f"{ROOT_DIR}/data"


# Setting constants that will be used
FACIAL_ROOT_NAME = "FACIAL_C_FacialRoot"
CHARACTER_NAME = "Ada"

ADD_COLOR_VERTEX = False

DNA_DIR = f"{DATA_DIR}/dna_files"
BODY_DIR = f"{DATA_DIR}/body"
CHARACTER_DNA = f"{DNA_DIR}/{CHARACTER_NAME}.dna"

UP_AXIS = "z"
if UP_AXIS not in ("z", "y"):
    raise ValueError("UP_AXIS can be 'z' or 'y'")


BODY_FILE = f"{BODY_DIR}/fem_skeleton.ma"
ADD_MESH_NAME_TO_BLEND_SHAPE_CHANNEL_NAME = True

FACIAL_ROOT_JOINTS = ["FACIAL_C_FacialRoot", "FACIAL_C_Neck1Root", "FACIAL_C_Neck2Root"]
NECK_JOINTS = ["head", "neck_01", "neck_02"]
ROOT_JOINT = "spine_04"

from dna import (
    BinaryStreamReader,
    BinaryStreamWriter,
    DataLayer_All,
    FileStream,
    Status,
)
from dnacalib import DNACalibDNAReader, RotateCommand
from maya import cmds, mel
from vtx_color import MESH_SHADER_MAPPING, VTX_COLOR_MESHES, VTX_COLOR_VALUES

from dna_viewer import (
    DNA,
    Config,
    build_meshes,
    get_skin_weights_from_scene,
    set_skin_weights_to_scene,
)


def load_dna_reader():
    stream = FileStream(
        CHARACTER_DNA, FileStream.AccessMode_Read, FileStream.OpenMode_Binary
    )
    reader = BinaryStreamReader(stream, DataLayer_All)
    reader.read()
    if not Status.isOk():
        status = Status.get()
        raise RuntimeError(f"Error loading DNA: {status.message}")
    return reader


def save_dna(reader):
    stream = FileStream(
        f"{CHARACTER_DNA}.rotate.dna",
        FileStream.AccessMode_Write,
        FileStream.OpenMode_Binary,
    )
    writer = BinaryStreamWriter(stream)
    writer.setFrom(reader)
    writer.write()

    if not Status.isOk():
        status = Status.get()
        raise RuntimeError(f"Error saving DNA: {status.message}")


def prepare_rotated_dna():
    reader = load_dna_reader()

    # Copies DNA contents and will serve as input/output parameter to commands
    calibrated = DNACalibDNAReader(reader)

    # Modifies calibrated DNA in-place
    rotate = RotateCommand([90.0, 0.0, 0.0], [0.0, 0.0, 0.0])
    rotate.run(calibrated)

    save_dna(calibrated)
    return DNA(f"{CHARACTER_DNA}.rotate.dna")


def get_dna():
    if UP_AXIS == "z":
        return prepare_rotated_dna()
    return DNA(CHARACTER_DNA)


def cleanup():
    path = Path(f"{CHARACTER_DNA}.rotate.dna")
    if path.exists():
        path.unlink()


def build_meshes_for_lod(dna, lod):
    # Create config
    config = Config(
        group_by_lod=False,
        create_display_layers=False,
        lod_filter=[lod],
        add_mesh_name_to_blend_shape_channel_name=ADD_MESH_NAME_TO_BLEND_SHAPE_CHANNEL_NAME,
    )

    # Builds and returns the created mesh paths in the scene
    return build_meshes(dna, config)


def create_skin_cluster(influences, mesh, skin_cluster_name, maximum_influences):
    cmds.select(influences[0], replace=True)
    cmds.select(mesh, add=True)
    skinCluster = cmds.skinCluster(
        toSelectedBones=True,
        name=skin_cluster_name,
        maximumInfluences=maximum_influences,
        skinMethod=0,
        obeyMaxInfluences=True,
    )
    if len(influences) > 1:
        cmds.skinCluster(
            skinCluster, edit=True, addInfluence=influences[1:], weight=0.0
        )
    return skinCluster


def create_head_and_body_scene(mesh_names):
    scene_mesh_names = []
    skinweights = []

    for mesh_name in mesh_names:
        if cmds.objExists(mesh_name):
            scene_mesh_names.append(mesh_name)
            skinweights.append(get_skin_weights_from_scene(mesh_name))
            cmds.delete(f"{mesh_name}_skinCluster")

    for facial_joint in FACIAL_ROOT_JOINTS:
        cmds.parent(facial_joint, world=True)
    cmds.delete(ROOT_JOINT)

    cmds.file(BODY_FILE, options="v=0", type="mayaAscii", i=True)
    if UP_AXIS == "y":
        cmds.joint("root", edit=True, orientation=[-90.0, 0.0, 0.0])
    for facial_joint, neck_joint in zip(FACIAL_ROOT_JOINTS, NECK_JOINTS):
        cmds.parent(facial_joint, neck_joint)

    for mesh_name, skinweight in zip(scene_mesh_names, skinweights):
        create_skin_cluster(
            skinweight.joints,
            mesh_name,
            f"{mesh_name}_skinCluster",
            skinweight.no_of_influences,
        )
        set_skin_weights_to_scene(mesh_name, skinweight)


def set_fbx_options():
    # Executes FBX relate commands from the imported plugin
    min_time = cmds.playbackOptions(minTime=True, query=True)
    max_time = cmds.playbackOptions(maxTime=True, query=True)

    cmds.FBXResetExport()
    mel.eval("FBXExportBakeComplexAnimation -v true")
    mel.eval(f"FBXExportBakeComplexStart -v {min_time}")
    mel.eval(f"FBXExportBakeComplexEnd -v {max_time}")
    mel.eval("FBXExportConstraints -v true")
    mel.eval("FBXExportSkeletonDefinitions -v true")
    mel.eval("FBXExportInputConnections -v true")
    mel.eval("FBXExportSmoothingGroups -v true")
    mel.eval("FBXExportSkins -v true")
    mel.eval("FBXExportShapes -v true")
    mel.eval("FBXExportCameras -v false")
    mel.eval("FBXExportLights -v false")
    cmds.FBXExportUpAxis(UP_AXIS)
    # Deselects objects in Maya
    cmds.select(clear=True)


def create_shader(name):
    cmds.shadingNode("blinn", asShader=True, name=name)

    shading_group = str(
        cmds.sets(
            renderable=True,
            noSurfaceShader=True,
            empty=True,
            name=f"{name}SG",
        )
    )
    cmds.connectAttr(f"{name}.outColor", f"{shading_group}.surfaceShader")
    return shading_group


def add_shader():
    for shader_name, meshes in MESH_SHADER_MAPPING.items():
        shading_group = create_shader(shader_name)
        for mesh in meshes:
            try:
                cmds.select(mesh, replace=True)
                cmds.sets(edit=True, forceElement=shading_group)
            except Exception as e:
                print(f"Skipped adding shader for mesh {mesh}. Reason {e}")


def set_vertex_color():
    for m, meshName in enumerate(VTX_COLOR_MESHES):
        try:
            cmds.select(meshName)
        except Exception as e:
            print(f"Skipped adding vtx color for mesh {meshName}. Reason {e}")
            continue
        for v, rgb in enumerate(VTX_COLOR_VALUES[m]):
            cmds.polyColorPerVertex(f"{meshName}.vtx[{v}]", g=rgb[1], b=rgb[2])


def export_fbx(lod, meshes):
    # Selects every mesh in the given lod
    for item in meshes:
        cmds.select(item, add=True)
    # Adds facial root joint to selection
    cmds.select(FACIAL_ROOT_NAME, add=True)
    # Sets the file path
    export_file_name = f"{OUTPUT_DIR}/{CHARACTER_NAME}_lod{lod}.fbx"
    # Exports the fbx
    mel.eval(f'FBXExport -f "{export_file_name}" -s true')


def export_fbx_for_lod(dna, lod):
    # Creates the meshes for the given lod
    result = build_meshes_for_lod(dna, lod)
    meshes = result.get_all_meshes()
    # Executes FBX relate commands from the imported plugin
    create_head_and_body_scene(meshes)
    set_fbx_options()
    # Saves the result
    if ADD_COLOR_VERTEX:
        add_shader()
        set_vertex_color()
    export_fbx(lod, meshes)


if __name__ == "__main__":
    makedirs(OUTPUT_DIR, exist_ok=True)

    # Loads the builtin plugin needed for FBX
    cmds.loadPlugin("fbxmaya.mll")

    # This fixes warning when calling this script with headless maya Warning: line 1: Unknown object type: HIKCharacterNode
    mel.eval(f"HIKCharacterControlsTool;")

    # Generate workspace.mel
    mel.eval(f'setProject "{OUTPUT_DIR}";')

    # Export FBX for each lod
    cmds.upAxis(ax=UP_AXIS)
    dna = get_dna()
    for lod in range(dna.get_lod_count()):
        export_fbx_for_lod(dna, lod)
    cleanup()
