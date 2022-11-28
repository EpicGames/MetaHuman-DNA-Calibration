# Frequently Asked Questions (FAQ)

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
