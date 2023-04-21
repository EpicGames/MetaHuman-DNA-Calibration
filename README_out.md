# MetaHuman DNA Calibration
MetaHuman DNA Calibration is a set of tools used for working with MetaHuman DNA files, bundled into a single package.
[`DNA`](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/docs/dna_md#metahuman-dna) is an integral part of [MetaHuman](https://www.unrealengine.com/en-US/metahuman) identity.
DNA files are created with [MetaHuman Creator](https://metahuman.unrealengine.com/) and downloaded with 
[Quixel Bridge](https://docs.metahuman.unrealengine.com/en-US/downloading-metahumans-with-quixel-bridge/), and Bifrost in UE5.

MetaHuman DNA Calibration is a set of tools used for working with MetaHuman DNA files, bundled into a single package. We wanted to share this code to help users customize DNA files so they can better integrate the characters they create into their games and experiences.
MetaHuman DNA Calibration tools are provided in a GitHub repository located at this address.


# Overview
For an explanation about how the repository is organized, [click here](repository_organization_md).

The MetaHuman DNA Calibration repository contains two distinct tools:
- [DNACalib](dnacalib_md) (and its dependencies) 
- [DNAViewer](dna_viewer_md)


## Required Knowledge
To use these tools, you should be familiar with:
- Rigging in Maya
- Python

## Optional Knowledge
- C++ (for [DNACalib](dnacalib_md) and its [API](dnacalib_api_md))


## DNACalib
[DNACalib](dnacalib_md) and its [API](dnacalib_api_md) are used to inspect and modify DNA files. With [DNACalib](dnacalib_md), you can make the following changes in DNA files:
- Rename joints, meshes, blendshapes, and / or animated maps.
- Remove joints, meshes, and / or joint animation.
- Rotate, scale, and translate the rig.
- Remove LODs.
- Change neutral joint positions, neutral mesh positions, and blendshape delta values.
- Prune blendshapes.
- Remove all blend shape data.

An overview of the MetaHuman DNA file format can be found [`here`](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/docs/dna_md).

**Note**: DNACalib library allows removal and renaming of any joint. However, the following joints are used for connecting head with body and should not be removed or renamed: neck_01, neck_02, FACIAL_C_FacialRoot.

## External Software Dependencies
DNACalib's Python wrapper is compiled against Python 3.7 and 3.9. Pre-compiled binaries for Windows and Linux (both 64-bit) are part of the repository.
If you are using a different version of Python, you must recompile it. Any Python 3 version should be fine.
If a user has a different platform or architecture, the library and its dependencies must be compiled.

**Important**
DNA files are stored as [LFS (Large File Storage)](https://git-lfs.github.com/) files. They are downloaded with the rest of the code if 
git-lfs is installed and configured to use. If you are not using git-lfs, you have to download DNA files manually. 

Additional information can be found [here](faq_md#fix--runtimeerror--error-loading-dna--dna-signature-mismatched-expected-dna-got-ver-)

**Warning:** 
Python 2 is not supported.

DNACalib can be used in C++ projects as a C++ library.

DNACalib Python wrapper can be used in Python 3.7 and 3.9, `mayapy` (Python interpreter shipped with Maya) shipped with Maya.
Supported Maya versions are 2022 and 2023.

Note: Maya 2022 is bundled with Python 3.7, Maya 2023 is bundled with Python 3.9.   

## Environment Setup

In order to use MetaHuman DNA Calibration in your scripts, you need to:
- have Python3 installed, see [note](README_md#external-software-dependencies),
- add MetaHuman DNA Calibration location to `MAYA_MODULE_PATH` system variable (if you want to use MetaHuman DNA Calibration in Maya)


If you plan to run the script from command line:

- in case of Maya's interpreter (mayapy) you will have to initialize maya with:

```python
import maya.standalone 
maya.standalone.initialize()
```

- in case of python interpreter you will have to add the following on top of your script: 
```python
from os import path as ospath
from sys import path as syspath
from sys import platform

ROOT_DIR = f"{ospath.dirname(ospath.abspath(__file__))}/..".replace("\\", "/")
MAYA_VERSION = "2022"  # or 2023
ROOT_LIB_DIR = f"{ROOT_DIR}/lib/Maya{MAYA_VERSION}"
if platform == "win32":
    LIB_DIR = f"{ROOT_LIB_DIR}/windows"
elif platform == "linux":
    LIB_DIR = f"{ROOT_LIB_DIR}/linux"
else:
    raise OSError(
        "OS not supported, please compile dependencies and add value to LIB_DIR"
    )

# Adds directories to path
syspath.insert(0, ROOT_DIR)
syspath.insert(0, LIB_DIR)
```

NOTE: 
If running on Linux, please make sure to append the LD_LIBRARY_PATH with absolute path to the `lib/Maya2022/linux` or `lib/Maya2023/linux` directory before running the example: 
 - `export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:<path-to-lib-linux-dir>`

## DNAViewer
With DNAViewer, you can:
- Create functional rigs for Maya.
- Export FBX files.
- Read internal parts of DNA files.

DNAViewer can be used in `mayapy` (Python interpreter shipped with Maya) or in Maya 2022, except [Propagating changes from Maya scene to dna](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/examples/dna_viewer_grab_changes_from_scene_and_propagate_to_dna.py) which can be used just in Maya.

# Examples
Several Python examples are provided for reference and can be found in the **examples'** folder:
- [Showcase a few commands](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/examples/dnacalib_demo.py)
- [Rename a joint](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/examples/dnacalib_rename_joint_demo.py)
- [Create a small DNA from scratch](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/examples/dna_demo.py)
- [Read binary DNA and write it in a human readable format](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/examples/dna_binary_to_json_demo.py)
- [Create a new DNA from an existing one by extracting specific LODs](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/examples/dnacalib_lod_demo.py)
- [Remove a joint](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/examples/dnacalib_remove_joint.py)
- [Clear blend shape data](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/examples/dnacalib_clear_blend_shapes.py)
- [Subtract values from neutral mesh](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/examples/dnacalib_neutral_mesh_subtract.py)
- [Simple UI in Maya](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/examples/dna_viewer_run_in_maya.py) and some [documentation](dna_viewer.md#usage-in-maya) for it
- [Generates rig](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/examples/dna_viewer_build_rig.py)
- [Export FBX per LOD](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/examples/dna_viewer_export_fbx.py)
- [Propagating changes from Maya scene to dna](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/examples/dna_viewer_grab_changes_from_scene_and_propagate_to_dna.py)

Note: Examples are grouped in three groups: DNA, DNACalib, and DNAViewer. These names are embedded as prefixes: dna_, dnacalib_, and dna_viewer_.   

## Example DNA files
[Two demo DNA files](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/data/dna) are provided for easier testing of this tool. Any DNA generated with [MetaHumanCreator](https://www.unrealengine.com/en-US/metahuman)
should work.

# Notes
If a user runs examples in Maya 2022, the value for `ROOT_DIR` should be changed and absolute paths must be used, 
e.g. `c:/MetaHuman-DNA-Calibration` in Windows or `/home/user/MetaHuman-DNA-Calibration` in Linux. Important: Use `/` (forward slash), Maya uses forward slashes in path.

See the [FAQ guide](faq_md) for additional specifications.

# License
MetaHuman DNA Calibration is released with [licence](LICENSE).
