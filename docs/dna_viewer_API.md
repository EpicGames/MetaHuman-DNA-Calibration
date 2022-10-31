# Environment Setup

In order be able to import from dna_viewer, the environment needs to be set up. This is done by adding this code to the
beginning of any example mentioned below:

```
from sys import path as syspath, platform
from os import environ, path as ospath

ROOT_DIR = fr"{ospath.dirname(ospath.abspath(__file__))}/..".replace("\\", "/") # if you use Maya, use an absolute path instead
ROOT_LIB_DIR = fr"{ROOT_DIR}/lib"
if platform == "win32":
    LIB_DIR = f"{ROOT_LIB_DIR}/windows"
elif platform == "linux":
    LIB_DIR = f"{ROOT_LIB_DIR}/linux"
else:
    raise OSError("OS not supported, please compile dependencies and add value to LIB_DIR")


if "MAYA_PLUG_IN_PATH" in environ:
    separator = ":" if platform == "linux" else ";"
    environ["MAYA_PLUG_IN_PATH"] = separator.join([environ["MAYA_PLUG_IN_PATH"], LIB_DIR])    
else:
    environ["MAYA_PLUG_IN_PATH"] = LIB_DIR

syspath.append(ROOT_DIR)
syspath.append(LIB_DIR)
```

When running this from Maya, the `ROOT_DIR` should be set to an absolute path to the root of the repository instead.

# DNA

## Loading the DNA ([`load_dna`](../dna_viewer/reader/dna.py#L28))

Loads the DNA and returns a [`DNA`](../dna_viewer/model/dna.py#L40) object.

```
from dna_viewer import get_dna

dna_ada = load_dna(DNA_PATH_ADA)
dna_taro = load_dna(DNA_PATH_TARO)
```

This uses the following parameters:
- `dna_path: str` - The path of the DNA file that should be used.

## Mesh Utilities

Mesh Utilities API explanation is located [here](/docs/dna_viewer_api_mesh_utilities.md).

## Rig Assembly

Rig Assembly API explanation is located [here](/docs/dna_viewer_api_rig_assembly.md).