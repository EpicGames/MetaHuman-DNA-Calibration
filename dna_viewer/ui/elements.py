from pathlib import Path
from typing import Optional

from maya import cmds
from PySide2.QtCore import Qt
from PySide2.QtWidgets import QCheckBox, QProgressBar, QPushButton, QWidget

from ..config.character import BuildOptions
from ..model.dna import DNA
from ..ui.file_chooser import FileChooser


class Elements:
    """
    Used for holding references to elements that get added to widgets

    Attributes
    ----------
    @type main_widget: QWidget
    @param main_widget: The main widget that holds everything

    @type select_dna_path: FileChooser
    @param select_dna_path: The FileChooser widget for getting the DNA path

    @type load_dna_btn: QPushButton
    @param load_dna_btn: The button that starts loading in the DNA

    @type mesh_tree_list: QWidget
    @param mesh_tree_list: The widget that contains the meshes to be selected in a tree list

    @type joints_cb: QCheckBox
    @param joints_cb: The checkbox that represents if joints should be added

    @type normals_cb: QCheckBox
    @param normals_cb: The checkbox that represents if normals should be added

    @type blend_shapes_cb: QCheckBox
    @param blend_shapes_cb: The checkbox that represents if blend shapes should be added

    @type skin_cb: QCheckBox
    @param skin_cb: The checkbox that represents if skin should be added

    @type rig_logic_cb: QCheckBox
    @param rig_logic_cb: The checkbox that represents if rig logic should be added

    @type select_gui_path: FileChooser
    @param select_gui_path: The FileChooser widget for getting the gui path

    @type select_analog_gui_path: FileChooser
    @param select_analog_gui_path: The FileChooser widget for getting the analog gui path

    @type select_aas_path: FileChooser
    @param select_aas_path: The FileChooser widget for getting the additional assembly script path

    @type process_btn: QPushButton
    @param process_btn: The button that starts creating the scene and character

    @type progress_bar: QProgressBar
    @param progress_bar: The progress bar that shows the building progress
    """

    main_widget: QWidget = None
    select_dna_path: FileChooser = None
    load_dna_btn: QPushButton = None
    mesh_tree_list: QWidget = None
    joints_cb: QCheckBox = None
    normals_cb: QCheckBox = None
    blend_shapes_cb: QCheckBox = None
    skin_cb: QCheckBox = None
    rig_logic_cb: QCheckBox = None
    select_gui_path: FileChooser = None
    select_analog_gui_path: FileChooser = None
    select_aas_path: FileChooser = None
    process_btn: QPushButton = None
    progress_bar: QProgressBar = None
    dna: DNA = None

    @staticmethod
    def create_new_scene() -> None:
        """Creates a new scene"""

        cmds.file(new=True, force=True)

    @staticmethod
    def get_file_path(input: FileChooser) -> Optional[str]:
        """
        Gets the file path contained in the provided FileChooser widget

        @type input: FileChooser
        @param input: The FileChooser widget we want to get the file path from

        @rtype: Optional[str]
        @returns: The value extracted from the FileChooser
        """

        path: str = input.get_file_path()
        if path and Path(path.strip()).exists():
            return path
        return None

    def get_dna_path(self) -> Optional[str]:
        """
        Gets the DNA file path

        @rtype: Optional[str]
        @returns: The DNA file path
        """

        return Elements.get_file_path(self.select_dna_path)

    def get_gui_path(self) -> Optional[str]:
        """
        Gets the gui file path

        @rtype: Optional[str]
        @returns: The gui file path
        """

        return Elements.get_file_path(self.select_gui_path)

    def get_analog_gui_path(self) -> Optional[str]:
        """
        Gets the analog gui file path

        @rtype: Optional[str]
        @returns: The analog gui file path
        """

        return Elements.get_file_path(self.select_analog_gui_path)

    def get_aas_path(self) -> Optional[str]:
        """
        Gets the additional assembly script file path

        @rtype: Optional[str]
        @returns: The additional assembly script file path
        """

        return Elements.get_file_path(self.select_aas_path)

    def get_build_options(self) -> BuildOptions:
        """
        Gets and returns a build options configuration from the corresponding UI elements

        @rtype: BuildOptions
        @returns: The object containing build option configuration
        """

        return BuildOptions(
            add_joints=Elements.is_checked(self.joints_cb),
            add_normals=Elements.is_checked(self.normals_cb),
            add_blend_shapes=Elements.is_checked(self.blend_shapes_cb),
            add_skin=Elements.is_checked(self.skin_cb),
        )

    @staticmethod
    def is_checked(checkbox: QCheckBox) -> bool:
        """
        Returns if the provided checkbox is checked and enabled

        @type checkbox: QCheckBox
        @param checkbox: The checkbox thats value needs to be checked and enabled

        @rtype: bool
        @returns: The flag representing if the checkbox is checked and enabled
        """

        return (
            checkbox is not None
            and bool(checkbox.isEnabled())
            and checkbox.checkState() == Qt.CheckState.Checked
        )
