# Build rig ([`build_rig`](../dna_viewer/api.py#L9))

The build rig API is used for easy assembly of the character rig in a Maya scene from a given DNA file path.

## Create RigConfig Instance([`RigConfig`](../dna_viewer/builder/config.py#35))
Create a configuration object that will be used in the mesh building process.

```
from dna_viewer import RigConfig
```

These are just some attributes of `RigConfig` class:
- `gui_path: str` - The GUI file path.
- `analog_gui_path: str` - The analog GUI file path.
- `aas_path: str` - The additional assemble script path.
- `aas_method: str` - The method name that should be called from the additional assemble script.
- `add_ctrl_attributes_on_root_joint: bool` - A flag representing if attributes should be added on the root joint, defaults to `True`.
- `add_key_frames: bool` - A flag representing if keyframes should be added, defaults to `True`

## Example

**Important**: The [environment setup](dna_viewer_api.md#environment-setup) provided above needs to be executed before running this example.

```
from dna_viewer import DNA, RigConfig, build_rig

# if you use Maya, use absolute path
ROOT_DIR = f"{ospath.dirname(ospath.abspath(__file__))}/..".replace("\\", "/")

# Sets the values that will used
DNA_PATH_ADA = f"{ROOT_DIR}/data/dna_files/Ada.dna"
dna_ada = DNA(DNA_PATH_ADA)

config = RigConfig(
    gui_path=f"{ROOT_DIR}/data/gui.ma",
    analog_gui_path=f"{ROOT_DIR}/data/analog_gui.ma",
    aas_path=f"{ROOT_DIR}/data/additional_assemble_script.py",
)

# Creates the rig
build_rig(dna=dna_ada, config=config)
```
