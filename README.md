# MetaHuman DNA Calibration
MetaHuman DNA Calibration is a set of tools used for working with MetaHuman DNA files, bundled into a single package.
DNA is an integral part of [MetaHuman](https://www.unrealengine.com/en-US/metahuman) identity.
DNA files are created with [MetaHuman Creator](https://metahuman.unrealengine.com/) and downloaded with 
[Quixel Bridge](https://docs.metahuman.unrealengine.com/en-US/downloading-metahumans-with-quixel-bridge/).

MetaHuman DNA Calibration is a set of tools used for working with MetaHuman DNA files, bundled into a single package. We wanted to share this code to help users customize DNA files so they can better integrate the characters they create into their games and experiences.
MetaHuman DNA Calibration tools are provided in a GitHub repository located at this address.


# Overview
For an explanation about how the repository is organized, [click here](docs/repository_organization.md).

The MetaHuman DNA Calibration repository contains two distinct tools:
- [DNACalib](docs/dnacalib.md) (and its dependencies) 
- [DNAViewer](docs/dna_viewer.md)


## Required Knowledge
To use these tools, you should be familiar with:
- Rigging in Maya
- Python

## Optional Knowledge
- C++ (for [DNACalib](docs/dnacalib.md) and its [API](docs/dnacalib_api.md))


## DNACalib
[DNACalib](docs/dnacalib.md) and its [API](docs/dnacalib_api.md) are used to inspect and modify DNA files. With [DNACalib](docs/dnacalib.md), you can make the following changes in DNA files:
- Rename joints, meshes, blendshapes, and / or animated maps.
- Remove joints, meshes, and / or joint animation.
- Rotate, scale, and translate the rig.
- Remove LODs.
- Change neutral joint positions, neutral mesh positions, and blendshape delta values.
- Prune blendshapes.
- Remove all blend shape data.


## External Software Dependencies
DNACalib's Python wrapper is compiled against Python 3.7. Pre-compiled binaries for Windows and Linux (both 64-bit) are part of the repository.
If you are using a different version of Python, you must recompile it. Any Python 3 version should be fine.
If a user has a different platform or architecture, the library and its dependencies must be compiled.

**Important**
DNA files are stored as [LFS (Large File Storage)](https://git-lfs.github.com/) files. They are downloaded with the rest of the code if 
git-lfs is installed and configured to use. If you are not using git-lfs, you have to download DNA files manually. 

Additional information can be found [here](docs/faq.md#fix--runtimeerror--error-loading-dna--dna-signature-mismatched-expected-dna-got-ver-)

**Warning:** 
Python 2 is not supported.

DNACalib can be used in C++ projects as a C++ library.

DNACalib Python wrapper can be used in Python 3.7, `mayapy` (Maya's Python interpreter), or Maya 2022.


## DNAViewer
With DNAViewer, you can:
- Create functional rigs for Maya.
- Export FBX files.
- Read internal parts of DNA files.

DNAViewer can be used in `mayapy` (Maya's Python interpreter) or in Maya 2022, except [Propagating changes from Maya scene to dna](/examples/dna_viewer_grab_changes_from_scene_and_propagate_to_dna.py) which can be used just in Maya.

# Examples
Several Python examples are provided for reference and can be found in the **examples'** folder:
- [Showcase a few commands](/examples/dnacalib_demo.py)
- [Rename a joint](/examples/dnacalib_rename_joint_demo.py)
- [Create a small DNA from scratch](/examples/dna_demo.py)
- [Create a new DNA from an existing one by extracting specific LODs](/examples/dnacalib_lod_demo.py)
- [Remove a joint](/examples/dnacalib_remove_joint.py)
- [Clear blend shape data](/examples/dnacalib_clear_blend_shapes.py)
- [Subtract values from neutral mesh](/examples/dnacalib_neutral_mesh_subtract.py)
- [Simple UI in Maya](examples/dna_viewer_run_in_maya.py) and some [documentation](docs/dna_viewer.md#usage-in-maya) for it
- [Generate rig and export FBX per LOD](examples/dna_viewer_demo.py)
- [Propagating changes from Maya scene to dna](/examples/dna_viewer_grab_changes_from_scene_and_propagate_to_dna.py)

## Example DNA files
[Two demo DNA files](data/dna) are provided for easier testing of this tool. Any DNA generated with [MetaHumanCreator](https://www.unrealengine.com/en-US/metahuman)
should work.

# Notes
If a user runs examples in Maya 2022, the value for `ROOT_DIR` should be changed and absolute paths must be used, 
eg. `c:/dna_calibration` in Windows or `/home/user/dna_calibration` in Linux. Important: Use `/` (forward slash), Maya uses forward slashes in path.

See the [FAQ guide](docs/faq.md) for additional specifications.

# License
MetaHuman DNA Calibration is released with [licence](LICENSE).
