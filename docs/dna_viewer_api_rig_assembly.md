# Rig Assembly

The assembly API is used for easy assembly of the character rig in a Maya scene from a given DNA file path.

## Importing

```
from dna_viewer import assemble_rig
```

This uses the following parameters:
- `dna: DNA` - Instance of DNA got with `load_dna`.
- `gui_path: str` - The GUI file path.
- `analog_gui_path: str` - The analog GUI file path.
- `aas_path: str` - The additional assembly script path.
- `aas_fn: str` - The method name that should be called from the additional assembly script.
- `with_attributes_on_root_joint: bool` - A flag representing if attributes should be added on the root joint, defaults to `False`.
- `with_key_frames: bool` - A flag representing if keyframes should be added, defaults to `False`

## Example

**Important**: The setup code provided above needs to be executed before running this example.

```
from dna_viewer import assemble_rig, load_dna

# Sets the values that will used
DNA_PATH_ADA = f"{ROOT_DIR}/da/dna/Ada.dna"
dna_ada = load_dna(DNA_PATH_ADA)
GUI_PATH = f"{ROOT_DIR}/data/gui.ma"
ANALOG_GUI_PATH = f"{ROOT_DIR}/data/analog_gui.ma"
AAS_PATH = f"{ROOT_DIR}/data/after_assembly_script.py"

# Creates the rig
assemble_rig(
    dna=dna_ada,
    gui_path=GUI_PATH,
    analog_gui_path=ANALOG_GUI_PATH,
    aas_path=AAS_PATH,
    aas_fn="run_after_assemble"
)
```
