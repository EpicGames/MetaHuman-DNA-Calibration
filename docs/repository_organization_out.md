# Repository Organization

This repository contains two independent components:
1. **dnacalib C++ library** - used to manipulate DNA files
2. **dna_viewer python code** - used to visualize DNA in Autodesk Maya

# Folder structure

- [dnacalib](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/dnacalib) - DNACalib source code
- [dna_viewer](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/dna_viewer) - source code of dna_viewer
- [examples](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/examples) - several Python scripts to show basic usage of dna_viewer and the Python wrapper for DNACalib
- [lib](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/lib) - pre-built binaries for DNACalib, PyDNACalib, and PyDNA
- [data](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/data) - required DNAs and Maya scenes
- [docs](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/docs) - documentation


## DNACalib
Documentation is located [here](dnacalib_md)

## DNAViewer
Documentation is located [here](dna_viewer_md)

## Examples
To run [DNAViewer examples](/dna_viewer_md#examples), you must have Maya 2022 installed.
To run [DNACalib examples](/dnacalib_md#python), you need Python3.

## Lib

[Lib folder](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/lib) contains pre-built binaries of the DNACalib library for Windows and Linux. Additionally, a Maya plugin for
RL4 is also available.

### Linux location
You have to copy or create symbolic links for all **.so** files in [lib](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/lib/Maya2022/linux):

```shell
sudo ln -s ~/MetaHuman-DNA-Calibration/lib/Maya2022/linux/_py3dna.so /usr/lib/_py3dna.so

sudo ln -s ~/MetaHuman-DNA-Calibration/lib/Maya2022/linux/libdnacalib.so /usr/lib/libdnacalib.so

sudo ln -s ~/MetaHuman-DNA-Calibration/lib/Maya2022/linux/libdnacalib.so.6 /usr/lib/libdnacalib.so.6

sudo ln -s ~/MetaHuman-DNA-Calibration/lib/Maya2022/linux/libembeddedRL4.so /usr/lib/embeddedRL4.mll

```

Note: Change the path `~/MetaHuman-DNA-Calibration` to where `MetaHuman-DNA-Calibration` is located.

## Data

The [`data folder`](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/data) contains example DNA files. We provided two MetaHuman DNA files (Ada and Taro, our first Presets).

| Ada | Taro |
|---|---|
|![image](img/metahuman_008.png)| ![image](img/metahuman_010.png) |

Additionally, we added [`gui`](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/data/gui.ma) and [`analog_gui`](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/data/analog_gui.ma) Maya scenes which are used during
Maya scene assemble.
Furthermore, [`additional_assemble_script.py`](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/data/additional_assemble_script.py) is used to organize objects in scene and
connect controls. The ideal setup looks like this:

![image](img/aas.png)
