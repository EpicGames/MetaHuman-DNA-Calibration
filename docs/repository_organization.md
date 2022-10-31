# Repository Organization

This repository contains two independent components:
1. **dnacalib C++ library** - used to manipulate DNA files
2. **dna_viewer python code** - used to visualize DNA in Autodesk Maya

# Folder structure

- [dnacalib](/dnacalib) - DNACalib source code
- [dna_viewer](/dna_viewer) - source code of dna_viewer
- [examples](/examples) - several Python scripts to show basic usage of dna_viewer and the Python wrapper for DNACalib
- [lib](/lib) - pre-built binaries for DNACalib, PyDNACalib, and PyDNA
- [data](/data) - required DNAs and Maya scenes
- [docs](/docs) - documentation


## DNACalib
Documentation is located [here](dnacalib.md)

## DNAViewer
Documentation is located [here](dna_viewer.md)

## Examples
To run [DNAViewer examples](/docs/dna_viewer.md#examples), you must have Maya 2022 installed.
To run [DNACalib examples](/docs/dnacalib.md#python), you need Python3.

## Lib

[Lib folder](/lib) contains pre-built binaries of the DNACalib library for Windows and Linux. Additionally, a Maya plugin for
RL4 is also available.

### Linux location
You have to copy or create symbolic links for all **.so** files in [lib](lib/linux):

```shell
sudo ln -s ~/dna_calibration/lib/linux/_py3dna.so /usr/lib/_py3dna.so

sudo ln -s ~/dna_calibration/lib/linux/libdnacalib.so /usr/lib/libdnacalib.so

sudo ln -s ~/dna_calibration/lib/linux/libdnacalib.so.6 /usr/lib/libdnacalib.so.6

sudo ln -s ~/dna_calibration/lib/linux/libembeddedRL4.so /usr/lib/embeddedRL4.mll

```

Note: Change the path `~/dna_calibration` to where `dna_calibration` is located.

## Data

The [`data folder`](/data) contains example DNA files. We provided two MetaHuman DNA files (Ada and Taro, our first Presets).

| Ada | Taro |
|---|---|
|![image](img/metahuman_008.png)| ![image](img/metahuman_010.png) |

Additionally, we added [`gui`](/data/gui.ma) and [`analog_gui`](/data/analog_gui.ma) Maya scenes which are used during
Maya scene assemble.
Furthermore, [`after_assembly_script.py`](/data/after_assembly_script.py) is used to organize objects in scene and
connect controls. The ideal setup looks like this:

![image](img/aas.png)
