"""
This example demonstrates generating functional rig based on DNA file in Maya scene with applied textures.
Maps added in data folder belong to Ada preset character. User should use source data downloaded from Quixel Bridge.
IMPORTANT: You have to setup the environment before running this example. Please refer to the 'Environment setup' section in README.md.

- usage in command line:
    mayapy dna_viewer_build_rig_with_textures.py
    NOTE: Script cannot be called with Python, it must be called with mayapy.

- usage in Maya:
    1. copy whole content of this file to Maya Script Editor
    2. change value of ROOT_DIR to absolute path of dna_calibration, e.g. `c:/dna_calibration` in Windows or `/home/user/dna_calibration`. Important:
    Use `/` (forward slash), because Maya uses forward slashes in path.
"""
import time
import os

# if you use Maya, use absolute path
ROOT_DIR = f"{os.path.dirname(os.path.abspath(__file__))}/..".replace("\\", "/")
DATA_DIR = f"{ROOT_DIR}/data"

from maya import cmds, mel
from dna_viewer import (
    DNA,
    RigConfig,
    build_rig
)

ORIENT_Y = [0.0, 0.0, 0.0]
COMMON_MAP_INFOS = [
    ("dx11_diffuseIrradiance", 1),
    ("dx11_jitter", 1),
    ("dx11_skinLUT", 1),
    ("dx11_specularIrradiance", 1),
]

MAP_INFOS = [
    ("head_color", 1),
    ("head_cm1_color", 0),
    ("head_cm2_color", 0),
    ("head_cm3_color", 0),
    ("head_normal", 1),
    ("head_wm1_normal", 0),
    ("head_wm2_normal", 0),
    ("head_wm3_normal", 0),
    ("head_specular", 1),
    ("head_specular_16Bits", 1),
    ("head_occlusion", 1),
    ("head_occlusion_16Bits", 1),
    ("head_cavity", 1),
    ("head_cavity_16Bits", 1),
    ("head_transmission", 1),
    ("head_transmission_16Bits", 1),
    ("head_curvature", 1),
    ("head_curvature_16Bits", 1),
    ("head_position", 1),
    ("head_position_16Bits", 1),
    ("head_worldspace", 1),
    ("head_worldspace_16Bits", 1),
    ("head_bentNormal", 1),
    ("head_bentNormal_16Bits", 1),
    ("teeth_color", 1),
    ("teeth_normal", 1),
    ("eyes_color", 1),
    ("eyeLeft_color", 1),
    ("eyeRight_color", 1),
    ("eyeLeft_normal", 1),
    ("eyeRight_normal", 1),
    ("eyes_color_16Bits", 1),
    ("eyes_normal", 1),
    ("eyes_normal_16Bits", 1),
    ("eyelashes_color", 1),
]

MASKS = [
    "head_wm1_blink_L",
    "head_wm1_blink_R",
    "head_wm1_browsRaiseInner_L",
    "head_wm1_browsRaiseInner_R",
    "head_wm1_browsRaiseOuter_L",
    "head_wm1_browsRaiseOuter_R",
    "head_wm1_chinRaise_L",
    "head_wm1_chinRaise_R",
    "head_wm1_jawOpen",
    "head_wm1_purse_DL",
    "head_wm1_purse_DR",
    "head_wm1_purse_UL",
    "head_wm1_purse_UR",
    "head_wm1_squintInner_L",
    "head_wm1_squintInner_R",
    "head_wm2_browsDown_L",
    "head_wm2_browsDown_R",
    "head_wm2_browsLateral_L",
    "head_wm2_browsLateral_R",
    "head_wm2_mouthStretch_L",
    "head_wm2_mouthStretch_R",
    "head_wm2_neckStretch_L",
    "head_wm2_neckStretch_R",
    "head_wm2_noseWrinkler_L",
    "head_wm2_noseWrinkler_R",
    "head_wm3_cheekRaiseInner_L",
    "head_wm3_cheekRaiseInner_R",
    "head_wm3_cheekRaiseOuter_L",
    "head_wm3_cheekRaiseOuter_R",
    "head_wm3_cheekRaiseUpper_L",
    "head_wm3_cheekRaiseUpper_R",
    "head_wm3_smile_L",
    "head_wm3_smile_R",
    "head_wm13_lips_DL",
    "head_wm13_lips_DR",
    "head_wm13_lips_UL",
    "head_wm13_lips_UR",
]

MESH_SHADER_MAPPING = {
    "head_lod": "head_shader",
    "teeth_lod": "teeth_shader",
    "saliva_lod": "saliva_shader",
    "eyeLeft_lod": "eyeLeft_shader",
    "eyeRight_lod": "eyeRight_shader",
    "eyeshell_lod": "eyeshell_shader",
    "eyelashes_lod": "eyelashes_shader",
    "eyelashesShadow_lod": "eyelashesShadow_shader",
    "eyeEdge_lod": "eyeEdge_shader",
    "cartilage_lod": "eyeEdge_shader",
}

SHADERS = ["head_shader", "teeth_shader", "eyeLeft_shader", "eyeRight_shader"]

SHADER_ATTRIBUTES_MAPPING = {
    "FRM_WMmultipliers.head_cm2_color_head_wm2_browsDown_L": "shader_head_shader.maskWeight_00",
    "FRM_WMmultipliers.head_wm2_normal_head_wm2_browsDown_L": "shader_head_shader.maskWeight_01",
    "FRM_WMmultipliers.head_cm2_color_head_wm2_browsDown_R": "shader_head_shader.maskWeight_02",
    "FRM_WMmultipliers.head_wm2_normal_head_wm2_browsDown_R": "shader_head_shader.maskWeight_03",
    "FRM_WMmultipliers.head_cm2_color_head_wm2_browsLateral_L": "shader_head_shader.maskWeight_04",
    "FRM_WMmultipliers.head_wm2_normal_head_wm2_browsLateral_L": "shader_head_shader.maskWeight_05",
    "FRM_WMmultipliers.head_cm2_color_head_wm2_browsLateral_R": "shader_head_shader.maskWeight_06",
    "FRM_WMmultipliers.head_wm2_normal_head_wm2_browsLateral_R": "shader_head_shader.maskWeight_07",
    "FRM_WMmultipliers.head_cm1_color_head_wm1_browsRaiseInner_L": "shader_head_shader.maskWeight_08",
    "FRM_WMmultipliers.head_wm1_normal_head_wm1_browsRaiseInner_L": "shader_head_shader.maskWeight_09",
    "FRM_WMmultipliers.head_cm1_color_head_wm1_browsRaiseInner_R": "shader_head_shader.maskWeight_10",
    "FRM_WMmultipliers.head_wm1_normal_head_wm1_browsRaiseInner_R": "shader_head_shader.maskWeight_11",
    "FRM_WMmultipliers.head_cm1_color_head_wm1_browsRaiseOuter_L": "shader_head_shader.maskWeight_12",
    "FRM_WMmultipliers.head_wm1_normal_head_wm1_browsRaiseOuter_L": "shader_head_shader.maskWeight_13",
    "FRM_WMmultipliers.head_cm1_color_head_wm1_browsRaiseOuter_R": "shader_head_shader.maskWeight_14",
    "FRM_WMmultipliers.head_wm1_normal_head_wm1_browsRaiseOuter_R": "shader_head_shader.maskWeight_15",
    "FRM_WMmultipliers.head_cm1_color_head_wm1_blink_L": "shader_head_shader.maskWeight_16",
    "FRM_WMmultipliers.head_cm1_color_head_wm1_squintInner_L": "shader_head_shader.maskWeight_17",
    "FRM_WMmultipliers.head_wm1_normal_head_wm1_blink_L": "shader_head_shader.maskWeight_18",
    "FRM_WMmultipliers.head_wm1_normal_head_wm1_squintInner_L": "shader_head_shader.maskWeight_19",
    "FRM_WMmultipliers.head_cm1_color_head_wm1_blink_R": "shader_head_shader.maskWeight_20",
    "FRM_WMmultipliers.head_cm1_color_head_wm1_squintInner_R": "shader_head_shader.maskWeight_21",
    "FRM_WMmultipliers.head_wm1_normal_head_wm1_blink_R": "shader_head_shader.maskWeight_22",
    "FRM_WMmultipliers.head_wm1_normal_head_wm1_squintInner_R": "shader_head_shader.maskWeight_23",
    "FRM_WMmultipliers.head_cm3_color_head_wm3_cheekRaiseInner_L": "shader_head_shader.maskWeight_24",
    "FRM_WMmultipliers.head_cm3_color_head_wm3_cheekRaiseOuter_L": "shader_head_shader.maskWeight_25",
    "FRM_WMmultipliers.head_cm3_color_head_wm3_cheekRaiseUpper_L": "shader_head_shader.maskWeight_26",
    "FRM_WMmultipliers.head_wm3_normal_head_wm3_cheekRaiseInner_L": "shader_head_shader.maskWeight_27",
    "FRM_WMmultipliers.head_wm3_normal_head_wm3_cheekRaiseOuter_L": "shader_head_shader.maskWeight_28",
    "FRM_WMmultipliers.head_wm3_normal_head_wm3_cheekRaiseUpper_L": "shader_head_shader.maskWeight_29",
    "FRM_WMmultipliers.head_cm3_color_head_wm3_cheekRaiseInner_R": "shader_head_shader.maskWeight_30",
    "FRM_WMmultipliers.head_cm3_color_head_wm3_cheekRaiseOuter_R": "shader_head_shader.maskWeight_31",
    "FRM_WMmultipliers.head_cm3_color_head_wm3_cheekRaiseUpper_R": "shader_head_shader.maskWeight_32",
    "FRM_WMmultipliers.head_wm3_normal_head_wm3_cheekRaiseInner_R": "shader_head_shader.maskWeight_33",
    "FRM_WMmultipliers.head_wm3_normal_head_wm3_cheekRaiseOuter_R": "shader_head_shader.maskWeight_34",
    "FRM_WMmultipliers.head_wm3_normal_head_wm3_cheekRaiseUpper_R": "shader_head_shader.maskWeight_35",
    "FRM_WMmultipliers.head_cm2_color_head_wm2_noseWrinkler_L": "shader_head_shader.maskWeight_36",
    "FRM_WMmultipliers.head_wm2_normal_head_wm2_noseWrinkler_L": "shader_head_shader.maskWeight_37",
    "FRM_WMmultipliers.head_cm2_color_head_wm2_noseWrinkler_R": "shader_head_shader.maskWeight_38",
    "FRM_WMmultipliers.head_wm2_normal_head_wm2_noseWrinkler_R": "shader_head_shader.maskWeight_39",
    "FRM_WMmultipliers.head_cm3_color_head_wm3_smile_L": "shader_head_shader.maskWeight_40",
    "FRM_WMmultipliers.head_wm3_normal_head_wm3_smile_L": "shader_head_shader.maskWeight_41",
    "FRM_WMmultipliers.head_cm1_color_head_wm13_lips_UL": "shader_head_shader.maskWeight_42",
    "FRM_WMmultipliers.head_cm1_color_head_wm13_lips_UR": "shader_head_shader.maskWeight_43",
    "FRM_WMmultipliers.head_cm1_color_head_wm13_lips_DL": "shader_head_shader.maskWeight_44",
    "FRM_WMmultipliers.head_cm1_color_head_wm13_lips_DR": "shader_head_shader.maskWeight_45",
    "FRM_WMmultipliers.head_wm1_normal_head_wm13_lips_UL": "shader_head_shader.maskWeight_46",
    "FRM_WMmultipliers.head_wm1_normal_head_wm13_lips_UR": "shader_head_shader.maskWeight_47",
    "FRM_WMmultipliers.head_wm1_normal_head_wm13_lips_DL": "shader_head_shader.maskWeight_48",
    "FRM_WMmultipliers.head_wm1_normal_head_wm13_lips_DR": "shader_head_shader.maskWeight_49",
    "FRM_WMmultipliers.head_cm3_color_head_wm3_smile_R": "shader_head_shader.maskWeight_50",
    "FRM_WMmultipliers.head_wm3_normal_head_wm3_smile_R": "shader_head_shader.maskWeight_51",
    "FRM_WMmultipliers.head_cm3_color_head_wm13_lips_UL": "shader_head_shader.maskWeight_52",
    "FRM_WMmultipliers.head_cm3_color_head_wm13_lips_DL": "shader_head_shader.maskWeight_53",
    "FRM_WMmultipliers.head_wm3_normal_head_wm13_lips_UL": "shader_head_shader.maskWeight_54",
    "FRM_WMmultipliers.head_wm3_normal_head_wm13_lips_DL": "shader_head_shader.maskWeight_55",
    "FRM_WMmultipliers.head_cm3_color_head_wm13_lips_UR": "shader_head_shader.maskWeight_56",
    "FRM_WMmultipliers.head_cm3_color_head_wm13_lips_DR": "shader_head_shader.maskWeight_57",
    "FRM_WMmultipliers.head_wm3_normal_head_wm13_lips_UR": "shader_head_shader.maskWeight_58",
    "FRM_WMmultipliers.head_wm3_normal_head_wm13_lips_DR": "shader_head_shader.maskWeight_59",
    "FRM_WMmultipliers.head_cm2_color_head_wm2_mouthStretch_L": "shader_head_shader.maskWeight_60",
    "FRM_WMmultipliers.head_wm2_normal_head_wm2_mouthStretch_L": "shader_head_shader.maskWeight_61",
    "FRM_WMmultipliers.head_cm2_color_head_wm2_mouthStretch_R": "shader_head_shader.maskWeight_62",
    "FRM_WMmultipliers.head_wm2_normal_head_wm2_mouthStretch_R": "shader_head_shader.maskWeight_63",
    "FRM_WMmultipliers.head_cm1_color_head_wm1_purse_UL": "shader_head_shader.maskWeight_64",
    "FRM_WMmultipliers.head_wm1_normal_head_wm1_purse_UL": "shader_head_shader.maskWeight_65",
    "FRM_WMmultipliers.head_cm1_color_head_wm1_purse_UR": "shader_head_shader.maskWeight_66",
    "FRM_WMmultipliers.head_wm1_normal_head_wm1_purse_UR": "shader_head_shader.maskWeight_67",
    "FRM_WMmultipliers.head_cm1_color_head_wm1_purse_DL": "shader_head_shader.maskWeight_68",
    "FRM_WMmultipliers.head_wm1_normal_head_wm1_purse_DL": "shader_head_shader.maskWeight_69",
    "FRM_WMmultipliers.head_cm1_color_head_wm1_purse_DR": "shader_head_shader.maskWeight_70",
    "FRM_WMmultipliers.head_wm1_normal_head_wm1_purse_DR": "shader_head_shader.maskWeight_71",
    "FRM_WMmultipliers.head_cm1_color_head_wm1_chinRaise_L": "shader_head_shader.maskWeight_72",
    "FRM_WMmultipliers.head_wm1_normal_head_wm1_chinRaise_L": "shader_head_shader.maskWeight_73",
    "FRM_WMmultipliers.head_cm1_color_head_wm1_chinRaise_R": "shader_head_shader.maskWeight_74",
    "FRM_WMmultipliers.head_wm1_normal_head_wm1_chinRaise_R": "shader_head_shader.maskWeight_75",
    "FRM_WMmultipliers.head_cm1_color_head_wm1_jawOpen": "shader_head_shader.maskWeight_76",
    "FRM_WMmultipliers.head_wm1_normal_head_wm1_jawOpen": "shader_head_shader.maskWeight_77",
    "FRM_WMmultipliers.head_cm2_color_head_wm2_neckStretch_L": "shader_head_shader.maskWeight_78",
    "FRM_WMmultipliers.head_wm2_normal_head_wm2_neckStretch_L": "shader_head_shader.maskWeight_79",
    "FRM_WMmultipliers.head_cm2_color_head_wm2_neckStretch_R": "shader_head_shader.maskWeight_80",
    "FRM_WMmultipliers.head_wm2_normal_head_wm2_neckStretch_R": "shader_head_shader.maskWeight_81",
}


# Methods
def import_head_shaders(shader_scene_path, shaders_dir_path, masks_dir_path, maps_dir_path):
    import_shader(shader_scene_path, MESH_SHADER_MAPPING)

    resolve_scene_shader_paths(SHADERS, shaders_dir_path)

    set_mask_textures(MASKS, masks_dir_path)
    set_map_textures(COMMON_MAP_INFOS, maps_dir_path)
    set_map_textures(MAP_INFOS, maps_dir_path)

    connect_attributes_to_shader(SHADER_ATTRIBUTES_MAPPING)


def import_shader(shader_scene_path, mesh_shader_mapping):
    print("Shader scene imported")
    cmds.file(shader_scene_path, options="v=0", type="mayaAscii", i=True)
    try:
        items = mesh_shader_mapping.iteritems()
    except:
        items = mesh_shader_mapping.items()
    for meshName, shaderName in items:
        for lodLvl in range(0, 8):
            try:
                # Apply shader to all meshes based on LOD level
                resolved_mesh_name = meshName + str(lodLvl) + "_mesh"
                shader = "shader_" + shaderName
                cmds.select(resolved_mesh_name, replace=True)
                mel.eval("sets -e -forceElement " + shader + "SG")
            except:
                print("Skipped adding shader for mesh %s." % meshName)


def resolve_scene_shader_paths(shaders, folder_name):
    for shader in shaders:
        node_name = "shader_" + shader
        if not cmds.objExists(node_name):
            continue
        file_shader_name = cmds.getAttr(node_name + ".shader")
        shader_folder_name, shader_file_name = os.path.split(file_shader_name)
        shader_folder_name = folder_name
        cmds.setAttr(
            node_name + ".shader",
            shader_folder_name + "/" + shader_file_name,
            type="string",
        )


def set_mask_textures(masks, folder_name):
    for mask in masks:
        node_name = "maskFile_" + mask

        if not cmds.objExists(node_name):
            continue

        file_texture_name = cmds.getAttr(node_name + ".fileTextureName")
        texture_folder_name, texture_file_name = os.path.split(file_texture_name)
        texture_folder_name = folder_name
        cmds.setAttr(
            node_name + ".fileTextureName",
            texture_folder_name + "/" + texture_file_name,
            type="string",
        )


def set_map_textures(map_infos, folder_name):
    for mapInfo in map_infos:
        node_name = "mapFile_" + mapInfo[0]
        if mapInfo[1]:
            node_name = "baseMapFile_" + mapInfo[0]

        if not cmds.objExists(node_name):
            continue

        file_texture_name = cmds.getAttr(node_name + ".fileTextureName")
        texture_folder_name, texture_file_name = os.path.split(file_texture_name)
        texture_folder_name = folder_name
        cmds.setAttr(
            node_name + ".fileTextureName",
            texture_folder_name + "/" + texture_file_name,
            type="string",
        )


def connect_attributes_to_shader(shader_attributes_mapping):
    print("Connecting attributes to shader...")
    try:
        items = shader_attributes_mapping.iteritems()
    except Exception as ex:
        print(f"Error: {ex}")
        items = shader_attributes_mapping.items()

    for frm_attribute, shaderAttribute in items:
        if cmds.objExists(frm_attribute) and cmds.objExists(shaderAttribute):
            cmds.connectAttr(frm_attribute, shaderAttribute, force=True)


def create_lights(lights_file_path, orient):
    print("Creating lights...")
    cmds.file(lights_file_path, defaultNamespace=True, i=True)
    cmds.xform("Lights", ro=orient)
    cmds.makeIdentity("Lights", apply=True)


# Define all paths
dna_path = f"{DATA_DIR}/mh4/dna_files/Ada.dna"
gui_path = f"{DATA_DIR}/mh4/gui.ma"
aas_path = f"{DATA_DIR}/mh4/additional_assemble_script.py"
ac_path = f"{DATA_DIR}/analog_gui.ma"
light_scene = f"{DATA_DIR}/lights.ma"
shader_scene = f"{DATA_DIR}/shader.ma"
shaders_dir = f"{DATA_DIR}/shaders"
masks_dir = f"{DATA_DIR}/masks"
maps_dir = f"{DATA_DIR}/maps"
output_scene = f"{ROOT_DIR}/output/Ada_rig.mb"

try:
    start_time = time.time()

    # open new scene
    cmds.file(new=True, force=True)

    # import DNA data
    dna = DNA(dna_path)

    config = RigConfig(
        gui_path=gui_path,
        analog_gui_path=ac_path,
        aas_path=aas_path,
    )
    build_rig(dna=dna, config=config)
    import_head_shaders(shader_scene, shaders_dir, masks_dir, maps_dir)
    create_lights(light_scene, ORIENT_Y)

    # save scene
    cmds.file(rename=output_scene)
    cmds.file(save=True, type="mayaBinary")

    print("--- Import finished in %s seconds ---" % (time.time() - start_time))
except Exception as ex:
    print("Error building scene", ex)
