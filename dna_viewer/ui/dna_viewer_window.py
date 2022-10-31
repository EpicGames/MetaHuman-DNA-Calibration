import logging
from pathlib import Path
from typing import Optional

from maya.cmds import confirmDialog
from PySide2 import QtCore, QtWidgets

from ..builder.scene import Scene
from ..config.aas import AdditionalAssemblyScript
from ..config.analog_gui import AnalogGui
from ..config.character import Character
from ..config.gui import Gui
from ..config.rig_logic import RigLogic
from ..config.units import AngleUnit, LinearUnit
from ..const.ui import (
    MARGIN_BOTTOM,
    MARGIN_LEFT,
    MARGIN_RIGHT,
    MARGIN_TOP,
    SPACING,
    WINDOW_OBJECT,
    WINDOW_SIZE_HEIGHT_MAX,
    WINDOW_SIZE_HEIGHT_MIN,
    WINDOW_SIZE_WIDTH_MAX,
    WINDOW_SIZE_WIDTH_MIN,
    WINDOW_TITLE,
)
from ..reader.dna import DNA
from ..ui.elements import Elements
from ..ui.elements_creator import ElementsCreator
from .widgets import QHLine


def show_dna_viewer_window() -> None:
    DnaViewerWindow.show_window()


class DnaViewerWindow(QtWidgets.QMainWindow):
    """
    UI Window

    Attributes
    ----------
    @type elements: Elements
    @param elements: The object containing references to the UI elements

    @type elements_creator: ElementsCreator
    @param elements_creator: The class used for creating UI elements

    @type build_scene_successful: bool
    @param build_scene_successful: A flag representing if building of the scene was a success

    @type character_config: Character
    @param character_config: The character configuration that will be processed
    """

    window: QtWidgets.QMainWindow = None

    def __init__(self, parent: QtWidgets.QWidget = None) -> None:
        super().__init__(parent)
        self.elements = Elements()
        self.elements_creator = ElementsCreator(self, self.elements)

        self.setup_window()
        self.create_ui()
        self.build_scene_successful = False
        self.character_config: Optional[Character] = None

    def setup_window(self) -> None:
        """A method for setting up the window"""

        self.setWindowFlags(
            self.windowFlags()
            | QtCore.Qt.WindowTitleHint
            | QtCore.Qt.WindowMaximizeButtonHint
            | QtCore.Qt.WindowMinimizeButtonHint
            | QtCore.Qt.WindowCloseButtonHint
        )
        self.setAttribute(QtCore.Qt.WA_DeleteOnClose)
        self.setObjectName(WINDOW_OBJECT)
        self.setWindowTitle(WINDOW_TITLE)
        self.setWindowFlags(QtCore.Qt.Window)
        self.setFocusPolicy(QtCore.Qt.StrongFocus)

    def create_ui(self) -> None:
        """Fills the window with UI elements"""

        self.elements.main_widget = self.create_main_widget()
        self.setCentralWidget(self.elements.main_widget)
        self.set_size()

    def create_main_widget(self) -> QtWidgets.QWidget:
        """
        Creates the widget containing the UI elements

        @rtype: QtWidgets.QWidget
        @returns: the main widget
        """

        header = self.elements_creator.create_header()
        body = self.elements_creator.create_body()

        widget = QtWidgets.QWidget()
        layout = QtWidgets.QVBoxLayout(widget)
        layout.addLayout(header)
        layout.addWidget(QHLine())
        layout.addLayout(body)
        layout.setContentsMargins(MARGIN_LEFT, MARGIN_TOP, MARGIN_RIGHT, MARGIN_BOTTOM)
        layout.setSpacing(SPACING)
        return widget

    def set_size(self) -> None:
        """Sets the window size"""

        self.setMaximumSize(WINDOW_SIZE_WIDTH_MAX, WINDOW_SIZE_HEIGHT_MAX)
        self.setMinimumSize(WINDOW_SIZE_WIDTH_MIN, WINDOW_SIZE_HEIGHT_MIN)
        self.resize(WINDOW_SIZE_WIDTH_MIN, WINDOW_SIZE_HEIGHT_MIN)

    def process(self) -> None:
        """Start the build process of creation of scene from provided configuration from the UI"""

        self.character_config = self.get_character_config()

        self.elements.main_widget.setEnabled(False)
        self.build_scene()
        self.elements.main_widget.setEnabled(True)

    def get_character_config(self) -> Character:
        """
        Gets the character config from the UI elements

        @rtype: Character
        @returns: character configuration object
        """

        gui_path = self.elements.get_gui_path()
        gui_options = Gui(gui_path=gui_path) if gui_path else None

        analog_gui_path = self.elements.get_analog_gui_path()
        analog_gui_options = (
            AnalogGui(gui_path=analog_gui_path) if analog_gui_path else None
        )

        aas_path = self.elements.get_aas_path()
        aas = (
            AdditionalAssemblyScript(
                path=aas_path,
                module_name=Path(aas_path).stem,
            )
            if aas_path
            else None
        )
        riglogic = (
            RigLogic() if Elements.is_checked(self.elements.rig_logic_cb) else None
        )
        config = Character(
            dna=self.elements.dna,
            create_character_node=False,
            create_display_layers=False,
            meshes=self.elements.mesh_tree_list.get_selected_meshes(),
            gui_options=gui_options,
            analog_gui_options=analog_gui_options,
            aas=aas,
            rig_logic_config=riglogic,
        )

        config.options = self.elements.get_build_options()

        return config

    def set_progress(self, text: str = None, value: int = None) -> None:
        """Setting text and/or value to progress bar"""

        if text is not None:
            self.elements.progress_bar.setFormat(text)
        if value is not None:
            self.elements.progress_bar.setValue(value)

    def build_scene(self) -> None:
        """Start building the scene"""

        try:
            self.set_progress(text="Processing in progress...", value=0)

            dna_file_path = Elements.get_file_path(self.elements.select_dna_path)

            if dna_file_path:
                DNA.load_dna(dna_file_path)

            self.set_progress(value=33)

            builder = Scene()
            builder.config.with_character(self.character_config)
            builder.config.with_linear_unit(unit=LinearUnit.cm).with_angle_unit(
                unit=AngleUnit.degree
            )
            self.set_progress(value=66)

            builder.build()
            self.set_progress(text="Processing completed", value=100)
        except Exception as e:
            self.set_progress(text="Processing failed", value=100)
            logging.error(e)
            confirmDialog(message=e, button=["ok"], icon="critical")

    @staticmethod
    def show_window() -> None:
        if DnaViewerWindow.window is None:
            DnaViewerWindow.window = DnaViewerWindow(
                parent=DnaViewerWindow.maya_main_window()
            )
        DnaViewerWindow.activate_window()

    @staticmethod
    def maya_main_window() -> QtWidgets.QWidget:
        """
        Gets the MayaWindow instance

        @throws RuntimeError

        @rtype: QtWidgets.QWidget
        @returns: main window instance
        """

        for obj in QtWidgets.QApplication.topLevelWidgets():
            if obj.objectName() == "MayaWindow":
                return obj
        raise RuntimeError("Could not find MayaWindow instance")

    @staticmethod
    def activate_window() -> None:
        """Shows window if minimized"""

        try:
            DnaViewerWindow.window.show()

            if DnaViewerWindow.window.windowState() & QtCore.Qt.WindowMinimized:
                DnaViewerWindow.window.setWindowState(QtCore.Qt.WindowActive)

            DnaViewerWindow.window.raise_()
            DnaViewerWindow.window.activateWindow()
        except RuntimeError as e:
            print(e)
            if str(e).rstrip().endswith("already deleted."):
                DnaViewerWindow.window = None
                DnaViewerWindow.show_window()
