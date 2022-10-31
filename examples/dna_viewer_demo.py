"""
This example demonstrates generating functional rig in maya scene and exporting fbx per lod.
- usage in command line:
    mayapy dna_viewer_demo.py
    NOTE: Script cannot be called with Python, it must be called with mayapy.

- usage in Maya:
    1. copy whole content of this file to Maya Script Editor
    2. change value of ROOT_DIR to absolute path of dna_calibration, e.g. `c:/dna_calibration` in Windows or `/home/user/dna_calibration`. Important:
    Use `/` (forward slash), because Maya uses forward slashes in path.

- customization:
    - change CHARACTER_NAME to Taro, or name of file which is copied to /data/dna
    - change ADD_COLOR_VERTEX to True, if you want to import fbx in Unreal Engine with painted vertices for fallowing cases:
        - vertex normals that are going to be updated during import in Unreal Engine, its vertices must be painted with green color.
        - for potential future GeneSplicer usage, skinwights on vertices which will need update in character mixing process, must be painted with blue color.

Expected:
    - script will generate maya scene Ada.mb in OUTPUT_DIR
    - script will generate workspace.mel in OUTPUT_DIR
    - script will copy original Ada.dna file to OUTPUT_DIR

    Expected: script will generate <PATH TO NEW DNA FILE>.
    NOTE: The directory referenced by the given path must exist. If the directory does not exist, the script is going to fail.

NOTE: If running on Linux, please make sure to append the LD_LIBRARY_PATH with absolute path to the lib/linux directory before running the example:
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:<path-to-lib-linux-dir>
"""


import logging
from pathlib import Path

try:
    from maya import standalone

    try:
        standalone.initialize(name="python")
    except Exception:
        logging.warning("Starting Maya cannot be done in Maya")
except ImportError as e:
    logging.error("DNAViewer needs to be run with Maya2022")
    raise ImportError(e) from e

from os import environ, makedirs
from os import path as ospath
from shutil import copyfile
from sys import path as syspath
from sys import platform

# if you use Maya, use absolute path
ROOT_DIR = f"{ospath.dirname(ospath.abspath(__file__))}/..".replace("\\", "/")
OUTPUT_DIR = f"{ROOT_DIR}/output"
DATA_DIR = f"{ROOT_DIR}/data"
EXAMPLES_DIR = f"{ROOT_DIR}/examples"
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
syspath.insert(0, EXAMPLES_DIR)
syspath.insert(0, DATA_DIR)

# Setting constants that will be used
FACIAL_ROOT_NAME = "FACIAL_C_FacialRoot"
CHARACTER_NAME = "Ada"

ADD_COLOR_VERTEX = False

DNA_DIR = f"{DATA_DIR}/dna"
BODY_DIR = f"{DATA_DIR}/body"
OUTPUT_DIR = f"{ROOT_DIR}/output"
CHARACTER_DNA = f"{DNA_DIR}/{CHARACTER_NAME}.dna"
ANALOG_GUI = f"{DATA_DIR}/analog_gui.ma"
GUI = f"{DATA_DIR}/gui.ma"
AFTER_ASSEMBLY_SCRIPT = f"{DATA_DIR}/after_assembly_script.py"
ROTATION = [90.0, 0.0, 0.0]
FBX_UP_AXIS = "z"
BODY_FILE = f"{BODY_DIR}/fem_skeleton.ma"
ADD_MESH_NAME_TO_BLEND_SHAPE_CHANNEL_NAME = True

FACIAL_ROOT_JOINTS = ["FACIAL_C_FacialRoot", "FACIAL_C_Neck1Root", "FACIAL_C_Neck2Root"]
NECK_JOINTS = ["spine_04",
    "clavicle_l",
    "clavicle_r",
    "upperarm_out_l",
    "upperarm_fwd_l",
    "upperarm_bck_l",
    "neck_01",
    "neck_02",
    "head"]

from vtx_color import VTX_COLOR_VALUES, VTX_COLOR_MESHES, MESH_SHADER_MAPPING

from maya import cmds, mel

from dna_viewer import assemble_rig, build_meshes, create_build_options, load_dna
from dna_viewer.util.skin_weights_maya import SkinWeightsMaya
from dna import DataLayer_All, FileStream, Status, BinaryStreamReader, BinaryStreamWriter
from dnacalib import (
    CommandSequence,
    DNACalibDNAReader,
    RotateCommand,
)

# Loads the builtin plugin needed for FBX
cmds.loadPlugin("fbxmaya.mll")


class Assemble:
    def __init__(self):
        self.rotate_dna_path = f"{CHARACTER_DNA}.rotate.dna"
        self.dna = load_dna(CHARACTER_DNA)

    def assemble_rig(self):
        # Creates the rig
        assemble_rig(
            dna=self.dna,
            gui_path=GUI,
            analog_gui_path=ANALOG_GUI,
            with_attributes_on_root_joint=True,
            with_key_frames=True,
            aas_path=AFTER_ASSEMBLY_SCRIPT,
            add_mesh_name_to_blend_shape_channel_name=ADD_MESH_NAME_TO_BLEND_SHAPE_CHANNEL_NAME
        )
        # Renames and saves the scene
        cmds.file(rename=f"{OUTPUT_DIR}/{CHARACTER_NAME}.mb")
        cmds.file(save=True)
        # copy dna fila and workspace file alongside generated scene
        copyfile(CHARACTER_DNA, f"{OUTPUT_DIR}/{CHARACTER_NAME}.dna")

    def get_dna(self):
        if ROTATION == [0.0, 0.0, 0.0]:
            return self.dna
        return self.prepare_rotated_dna()

    def export_fbx_for_all_lods(self):
        dna = self.get_dna()
        reader = self.load_dna_reader()
        for lod in range(dna.get_lod_count()):
            self.export_fbx_for_lod(dna, lod)
        self.cleanup()

    def cleanup(self):
        path = Path(self.rotate_dna_path)
        if path.exists():
            path.unlink()

    def export_fbx_for_lod(self, dna, lod):
        # Creates the meshes for the given lod
        meshes = self.build_meshes_for_lod(dna, lod)
        # Executes FBX relate commands from the imported plugin
        self.create_head_and_body_scene(meshes)
        self.set_fbx_options()
        # Saves the result
        if ADD_COLOR_VERTEX:
            self.add_shader()
            self.set_vertex_color()
        self.export_fbx(lod, meshes)

    def create_shader(self, name):
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

    def add_shader(self):
        for shader_name, meshes in MESH_SHADER_MAPPING.items():
            shading_group = self.create_shader(shader_name)
            for mesh in meshes:
                try:
                    cmds.select(mesh, replace=True)
                    cmds.sets(edit=True, forceElement=shading_group)
                except Exception as e:
                    print(f"Skipped adding shader for mesh {mesh}. Reason {e}")

    def set_vertex_color(self):
        for m, meshName in enumerate(VTX_COLOR_MESHES):
            try:
                cmds.select(meshName)
            except Exception as e:
                print(f"Skipped adding vtx color for mesh {meshName}. Reason {e}")
                continue
            for v, rgb in enumerate(VTX_COLOR_VALUES[m]):
                cmds.polyColorPerVertex(f"{meshName}.vtx[{v}]", g=rgb[1], b=rgb[2])

    def create_head_and_body_scene(self, mesh_names):
        scene_mesh_names = []
        skinweights = []

        skinweights_maya = SkinWeightsMaya()

        for mesh_name in mesh_names:
            if cmds.objExists(mesh_name):
                scene_mesh_names.append(mesh_name)
                skinweights.append(skinweights_maya.get_skin_weights_from_scene(mesh_name))
                cmds.delete(f"{mesh_name}_skinCluster")

        cmds.parent(FACIAL_ROOT_JOINTS[0], world=True)
        cmds.parent(FACIAL_ROOT_JOINTS[1], world=True)
        cmds.parent(FACIAL_ROOT_JOINTS[2], world=True)
        cmds.delete(NECK_JOINTS[0])

        cmds.file(BODY_FILE, options="v=0", type="mayaAscii", i=True)
        cmds.parent(FACIAL_ROOT_JOINTS[1], NECK_JOINTS[6])
        cmds.parent(FACIAL_ROOT_JOINTS[2], NECK_JOINTS[7])
        cmds.parent(FACIAL_ROOT_JOINTS[0], NECK_JOINTS[8])

        for mesh_name, skinweight in zip(scene_mesh_names, skinweights):
            self.create_skin_cluster(skinweight.joints, mesh_name, f"{mesh_name}_skinCluster", skinweight.no_of_influences)
            skinweights_maya.set_skin_weights_to_scene(mesh_name, skinweight)

    def create_skin_cluster(self, influences, mesh, skin_cluster_name, maximum_influences):
        cmds.select(influences[0], replace=True)
        cmds.select(mesh, add=True)
        skinCluster = cmds.skinCluster(toSelectedBones=True, name=skin_cluster_name,
                                       maximumInfluences=maximum_influences, skinMethod=0, obeyMaxInfluences=True)
        if len(influences) > 1:
            cmds.skinCluster(skinCluster, edit=True, addInfluence=influences[1:], weight=0.0)
        return skinCluster

    def build_meshes_for_lod(self, dna, lod):
        # Sets the parameters needed to build the meshes with
        build_options = create_build_options(
            add_joints=True,
            add_blend_shapes=True,
            add_skin=True,
            add_ctrl_attributes_on_root_joint=True,
            add_animated_map_attributes_on_root_joint=True,
            add_mesh_name_to_blend_shape_channel_name=ADD_MESH_NAME_TO_BLEND_SHAPE_CHANNEL_NAME,
            add_key_frames=True
        )

        # Builds and returns the created mesh paths in the scene
        return build_meshes(
            dna=dna,
            options=build_options,
            group_by_lod=False,
            lod_list=[lod],
            create_new_scene=True,
        )

    def set_fbx_options(self):
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
        cmds.FBXExportUpAxis(FBX_UP_AXIS)
        # Deselects objects in Maya
        cmds.select(clear=True)

    def export_fbx(self, lod, meshes):
        # Selects every mesh in the given lod
        for item in meshes:
            cmds.select(item, add=True)
        # Adds facial root joint to selection
        cmds.select(FACIAL_ROOT_NAME, add=True)
        # Sets the file path
        export_file_name = f"{OUTPUT_DIR}/{CHARACTER_NAME}_lod{lod}.fbx"
        # Exports the fbx
        mel.eval(f'FBXExport -f "{export_file_name}" -s true')

    def prepare_rotated_dna(self):
        reader = self.load_dna_reader()

        # Copies DNA contents and will serve as input/output parameter to commands
        calibrated = DNACalibDNAReader(reader)

        commands = self.build_command_list()

        # Modifies calibrated DNA in-place
        commands.run(calibrated)

        self.save_dna(calibrated)
        return load_dna(f"{CHARACTER_DNA}.rotate.dna")

    def load_dna_reader(self):
        stream = FileStream(CHARACTER_DNA, FileStream.AccessMode_Read, FileStream.OpenMode_Binary)
        reader = BinaryStreamReader(stream, DataLayer_All)
        reader.read()
        if not Status.isOk():
            status = Status.get()
            raise RuntimeError(f"Error loading DNA: {status.message}")
        return reader

    def save_dna(self, reader):
        stream = FileStream(f"{CHARACTER_DNA}.rotate.dna", FileStream.AccessMode_Write, FileStream.OpenMode_Binary)
        writer = BinaryStreamWriter(stream)
        writer.setFrom(reader)
        writer.write()

        if not Status.isOk():
            status = Status.get()
            raise RuntimeError(f"Error saving DNA: {status.message}")

    def build_command_list(self):
        rotate = RotateCommand(ROTATION, [0.0, 0.0, 0.0])

        # Abstraction to collect all commands into a sequence, and run them with only one invocation
        commands = CommandSequence()
        commands.add(rotate)
        return commands


assemble = Assemble()

makedirs(OUTPUT_DIR, exist_ok=True)

# this fixes warning when calling this script with headless maya Warning: line 1: Unknown object type: HIKCharacterNode
mel.eval(f"HIKCharacterControlsTool;")

# generate workspace.mel
mel.eval(f'setProject "{OUTPUT_DIR}";')

# Export FBX for each lod
assemble.export_fbx_for_all_lods()

# Assembles the rig and saves the scene
assemble.assemble_rig()
