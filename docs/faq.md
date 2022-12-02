# Frequently Asked Questions (FAQ)

## Fix "RuntimeError: Error loading DNA: DNA signature mismatched, expected DNA, got ver?"

DNA files are stored as [LFS](https://git-lfs.github.com/) files (Here is [another explanaintion](https://www.atlassian.com/git/tutorials/git-lfs) what LFS is). 
This problem occurs when repo is downloaded as zip, and github then does not download LFS files as whole file, but as some metadata file.  
Open that Ada.dna file in some editor file, from location were MetaHuman DNA Calibration is downloaded and then in 
`data/dna/Ada.dna` (eg `c:/MetaHuman-DNA-Calibration/data/dna/Ada.dna` you will got this:

```
version https://git-lfs.github.com/spec/v1
oid sha256:e764cfab938283231bcb3e5af1c7bcbec5154bab4804aafa1b5b7dc6e400ca5e
size 73730354
```
Which is not valid DNA file. 

There is two ways to fix this issue:
- `git clone git clone https://github.com/EpicGames/MetaHuman-DNA-Calibration.git`
- manually download [Ada.dna](../data/dna/Ada.dna) and/or [Taro.dna](../data/dna/Taro.dna), and put them in data directory 
where you downloaded MetaHuman DNA Calibration. eg. `c:/MetaHuman-DNA-Calibration/data/dna`


## How do I distribute a Maya scene?

Your scene should work out of the box if you include the following in the distribution:
- Scene file (`.mb` file)
- DNA (`.dna` file)
- Workspace (`workspace.mel` file)

All of these files need to be distributed together. If those files are not bundled and you experience some issues with you rig in Maya, 
try the following steps:

### How do I share the generated files?
If you want to distribute a generated Maya scene to other users, you must distribute the `.dna` file and `workspace.mel` together with the scene.

### How do I open a generated scene?
Before you load a generated scene, follow these steps:
- From the main menu, go to File > Set Project.
- Select `workspace.mel`
- Set the containing folder (with generated maya scene, `.dna` file and `workspace.mel`).


### How do I change the DNA path in the Maya scene?
If you want to change the DNA path in the scene:
- In `outliner`, deselect **DAG Objects Only**:
  - ![image](img/change_path_outliner_settings.png)
- Still in the Outliner, search for `rl4`. You will see a file whose name starts with `rl4Embedded_`. Click this file to select it.
  - ![image](img/change_path_outliner.png)
- In `Attribute editor` you will be able to change the path with `Dna File Path`:
  - ![image](img/change_path_node_path.png)
