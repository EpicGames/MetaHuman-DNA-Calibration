import logging
import os
import webbrowser
from typing import Callable, List

from maya import cmds
from maya.cmds import confirmDialog
from PySide2.QtCore import QCoreApplication, Qt
from PySide2.QtWidgets import (
    QApplication,
    QCheckBox,
    QGridLayout,
    QHBoxLayout,
    QLabel,
    QMainWindow,
    QMessageBox,
    QProgressBar,
    QPushButton,
    QTabWidget,
    QTreeWidget,
    QTreeWidgetItem,
    QTreeWidgetItemIterator,
    QVBoxLayout,
    QWidget,
)

from .. import DNA, build_rig
from ..builder.config import RigConfig
from ..dnalib.layer import Layer
from ..version import __version__
from .widgets import FileChooser, QHLine


def show() -> None:
    DnaViewerWindow.show_window()


WINDOW_OBJECT = "dnaviewer"
WINDOW_TITLE = "DNA Viewer"
HELP_URL = "https://epicgames.github.io/MetaHuman-DNA-Calibration/"
SPACING = 6
WINDOW_SIZE_WIDTH_MIN = 800
WINDOW_SIZE_WIDTH_MAX = 1200
WINDOW_SIZE_HEIGHT_MIN = 800
WINDOW_SIZE_HEIGHT_MAX = 1000
MARGIN_LEFT = 8
MARGIN_TOP = 8
MARGIN_RIGHT = 8
MARGIN_BOTTOM = 8
MARGIN_HEADER_LEFT = 0
MARGIN_HEADER_TOP = 0
MARGIN_HEADER_RIGHT = 0
MARGIN_HEADER_BOTTOM = 0
MARGIN_BODY_LEFT = 0
MARGIN_BODY_TOP = 0
MARGIN_BODY_RIGHT = 0


class MeshTreeList(QWidget):
    """
    A custom widget that lists out meshes with checkboxes next to them, so these meshes can be selected to be processed. The meshes are grouped by LOD

    @type mesh_tree: QWidget
    @param mesh_tree: The widget that contains the meshes to be selected in a tree list
    """

    def __init__(self, main_window: "DnaViewerWindow") -> None:
        super().__init__()
        self.main_window = main_window

        label = QLabel("Meshes:")
        self.mesh_tree = self.create_mesh_tree()

        layout = QGridLayout()
        layout.addWidget(self.mesh_tree, 0, 0, 4, 1)
        layout.setContentsMargins(
            MARGIN_BODY_LEFT,
            MARGIN_BODY_TOP,
            MARGIN_BODY_RIGHT,
            MARGIN_BOTTOM,
        )

        layout_holder = QVBoxLayout()
        layout_holder.addWidget(label)
        layout_holder.addLayout(layout)
        layout_holder.setContentsMargins(
            MARGIN_BODY_LEFT,
            MARGIN_BODY_TOP,
            MARGIN_BODY_RIGHT,
            MARGIN_BOTTOM,
        )

        self.btn_select_all = QPushButton("Select all meshes")
        self.btn_select_all.setEnabled(False)
        self.btn_select_all.clicked.connect(self.select_all)
        layout_holder.addWidget(self.btn_select_all)

        self.btn_deselect_all = QPushButton("Deselect all meshes")
        self.btn_deselect_all.setEnabled(False)
        self.btn_deselect_all.clicked.connect(self.deselect_all)
        layout_holder.addWidget(self.btn_deselect_all)

        self.setLayout(layout_holder)

    def create_mesh_tree(self) -> QWidget:
        """
        Creates the mesh tree list widget

        @rtype: QWidget
        @returns: The created widget
        """

        mesh_tree = QTreeWidget()
        mesh_tree.setHeaderHidden(True)
        mesh_tree.itemChanged.connect(self.tree_item_changed)
        mesh_tree.setStyleSheet("background-color: #505050")
        mesh_tree.setToolTip("Select mesh or meshes to add to rig")
        return mesh_tree

    def fill_mesh_list(
        self, lod_count: int, names: List[str], indices_names: List[List[int]]
    ) -> None:
        """
        Fills the mesh list with the meshes, and groups them by lods

        @type lod_count: int
        @param lod_count: The LOD count

        @type names: List[str]
        @param names: The names and indices of all the meshes

        @type indices_names: List[List[int]
        @param indices_names: The names and indices of all the meshes
        """

        self.mesh_tree.clear()

        for i in range(lod_count):
            parent = QTreeWidgetItem(self.mesh_tree)
            parent.setText(0, f"LOD {i}")
            parent.setFlags(parent.flags() | Qt.ItemIsTristate | Qt.ItemIsUserCheckable)

            meshes_in_lod = indices_names[i]

            for mesh_index in meshes_in_lod:
                child = QTreeWidgetItem(parent)
                child.setFlags(child.flags() | Qt.ItemIsUserCheckable)
                child.setText(0, f"{names[mesh_index]}")
                child.setCheckState(0, Qt.Unchecked)

            self.mesh_tree.setItemExpanded(parent, True)

    def get_selected_meshes(self) -> List[int]:
        """
        Gets the selected meshes from the tree widget

        @rtype: List[int]
        @returns: The list of mesh indices that are selected
        """

        meshes = []

        iterator = QTreeWidgetItemIterator(
            self.mesh_tree, QTreeWidgetItemIterator.Checked
        )
        while iterator.value():
            item = iterator.value()
            mesh_name = item.text(0)
            mesh_index = self.main_window.dna.get_mesh_id_from_mesh_name(mesh_name)
            if mesh_index is not None:
                meshes.append(mesh_index)

            iterator += 1

        return meshes

    def select_all(self) -> None:
        """
        Selects all meshes in the tree widget
        """
        self.iterate_over_items(Qt.Checked)

    def deselect_all(self) -> None:
        """
        Deselects all meshes in the tree widget
        """

        self.iterate_over_items(Qt.Unchecked)

    def iterate_over_items(self, state: Qt.CheckState) -> None:
        """
        Deselects all meshes in the tree widget
        """

        item = self.mesh_tree.invisibleRootItem()
        for index in range(item.childCount()):
            child = item.child(index)
            child.setCheckState(0, state)

    def tree_item_changed(self) -> None:
        """The method that gets called when a tree item gets its value changed"""

        meshes = self.get_selected_meshes()

        if meshes:
            self.main_window.skin_cb.setEnabled(self.main_window.joints_cb.checkState())
            self.main_window.blend_shapes_cb.setEnabled(True)
            self.main_window.process_btn.setEnabled(True)
            self.main_window.rig_logic_cb.setEnabled(False)

            if len(meshes) == self.main_window.dna.get_mesh_count():
                self.main_window.rig_logic_cb.setEnabled(
                    self.main_window.joints_cb.checkState()
                    and self.main_window.blend_shapes_cb.checkState()
                    and self.main_window.skin_cb.checkState()
                    and self.main_window.select_gui_path.get_file_path() is not None
                    and self.main_window.select_analog_gui_path.get_file_path()
                    is not None
                    and self.main_window.select_aas_path.get_file_path() is not None
                )
        else:
            self.main_window.skin_cb.setEnabled(False)
            self.main_window.blend_shapes_cb.setEnabled(False)
            self.main_window.process_btn.setEnabled(
                self.main_window.joints_cb.checkState()
            )


class DnaViewerWindow(QMainWindow):
    """
    UI Window

    Attributes
    ----------

    @type select_dna_path: FileChooser
    @param select_dna_path: The FileChooser widget for getting the DNA path

    @type load_dna_btn: QPushButton
    @param load_dna_btn: The button that starts loading in the DNA

    @type mesh_tree_list: QWidget
    @param mesh_tree_list: The widget that contains the meshes to be selected in a tree list

    @type joints_cb: QCheckBox
    @param joints_cb: The checkbox that represents if joints should be added

    @type blend_shapes_cb: QCheckBox
    @param blend_shapes_cb: The checkbox that represents if blend shapes should be added

    @type skin_cb: QCheckBox
    @param skin_cb: The checkbox that represents if skin should be added

    @type rig_logic_cb: QCheckBox
    @param rig_logic_cb: The checkbox that represents if rig logic should be added

    @type ctrl_attributes_on_root_joint_cb: QCheckBox
    @param ctrl_attributes_on_root_joint_cb: The checkbox that represents if control attributes on joint should be added

    @type animated_map_attributes_on_root_joint_cb: QCheckBox
    @param animated_map_attributes_on_root_joint_cb: The checkbox that represents if animated maps attributes on root joint should be added

    @type mesh_name_to_blend_shape_channel_name_cb: QCheckBox
    @param mesh_name_to_blend_shape_channel_name_cb: The checkbox that represents if mesh names to blend shapes channel name should be added

    @type key_frames_cb: QCheckBox
    @param key_frames_cb: The checkbox that represents if key frames should be added

    @type select_gui_path: FileChooser
    @param select_gui_path: The FileChooser widget for getting the gui path

    @type select_analog_gui_path: FileChooser
    @param select_analog_gui_path: The FileChooser widget for getting the analog gui path

    @type select_aas_path: FileChooser
    @param select_aas_path: The FileChooser widget for getting the additional assemble script path

    @type process_btn: QPushButton
    @param process_btn: The button that starts creating the scene and character

    @type progress_bar: QProgressBar
    @param progress_bar: The progress bar that shows the building progress
    """

    _instance: "DnaViewerWindow" = None
    main_widget: QWidget = None
    select_dna_path: FileChooser = None
    load_dna_btn: QPushButton = None
    mesh_tree_list: QWidget = None
    joints_cb: QCheckBox = None
    blend_shapes_cb: QCheckBox = None
    skin_cb: QCheckBox = None
    rig_logic_cb: QCheckBox = None
    ctrl_attributes_on_root_joint_cb: QCheckBox = None
    animated_map_attributes_on_root_joint_cb: QCheckBox = None
    mesh_name_to_blend_shape_channel_name_cb: QCheckBox = None
    key_frames_cb: QCheckBox = None
    select_gui_path: FileChooser = None
    select_analog_gui_path: FileChooser = None
    select_aas_path: FileChooser = None
    process_btn: QPushButton = None
    progress_bar: QProgressBar = None
    dna: DNA = None

    def __init__(self, parent: QWidget = None) -> None:
        super().__init__(parent)
        self.body: QVBoxLayout = None
        self.header: QHBoxLayout = None
        self.build_options: QWidget = None
        self.extra_build_options: QWidget = None

        self.setup_window()
        self.create_ui()

    def setup_window(self) -> None:
        """A method for setting up the window"""

        self.setWindowFlags(
            self.windowFlags()
            | Qt.WindowTitleHint
            | Qt.WindowMaximizeButtonHint
            | Qt.WindowMinimizeButtonHint
            | Qt.WindowCloseButtonHint
        )
        self.setAttribute(Qt.WA_DeleteOnClose)
        self.setObjectName(WINDOW_OBJECT)
        self.setWindowTitle(WINDOW_TITLE)
        self.setWindowFlags(Qt.Window)
        self.setFocusPolicy(Qt.StrongFocus)

    def create_ui(self) -> None:
        """Fills the window with UI elements"""

        self.main_widget = self.create_main_widget()
        self.setCentralWidget(self.main_widget)
        self.set_size()
        self.setStyleSheet(self.load_css())

    def load_css(self) -> str:
        css = os.path.join(os.path.dirname(__file__), "app.css")
        with open(css, encoding="utf-8") as file:
            return file.read()

    def create_main_widget(self) -> QWidget:
        """
        Creates the widget containing the UI elements

        @rtype: QtWidgets.QWidget
        @returns: the main widget
        """

        header = self.create_header()
        body = self.create_body()

        widget = QWidget()
        layout = QVBoxLayout(widget)
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

    def show_message_dialog(self) -> bool:
        dlg = QMessageBox()
        dlg.setIcon(QMessageBox.Warning)
        dlg.setWindowTitle("Warning")
        dlg.setText(
            "Unsaved changes exists.\nSave changes and create new scene, discard changes, and create new scene or cancel procesing."
        )
        dlg.setStandardButtons(
            QMessageBox.Save | QMessageBox.Discard | QMessageBox.Cancel
        )
        button = dlg.exec_()

        if button == QMessageBox.Save:
            cmds.SaveScene()
            return not cmds.file(q=True, modified=True)
        if button == QMessageBox.Cancel:
            return False

        return True

    def process(self) -> None:
        """Start the build process of creation of scene from provided configuration from the UI"""

        process = True
        if cmds.file(q=True, modified=True):
            process = self.show_message_dialog()

        if process:
            self.set_progress(text="Processing in progress...", value=0)
            config = RigConfig(
                meshes=self.mesh_tree_list.get_selected_meshes(),
                gui_path=self.select_gui_path.get_file_path(),
                analog_gui_path=self.select_analog_gui_path.get_file_path(),
                aas_path=self.select_aas_path.get_file_path(),
                add_rig_logic=self.add_rig_logic(),
                add_joints=self.add_joints(),
                add_blend_shapes=self.add_blend_shapes(),
                add_skin_cluster=self.add_skin_cluster(),
                add_ctrl_attributes_on_root_joint=self.add_ctrl_attributes_on_root_joint(),
                add_animated_map_attributes_on_root_joint=self.add_animated_map_attributes_on_root_joint(),
                add_mesh_name_to_blend_shape_channel_name=self.add_mesh_name_to_blend_shape_channel_name(),
                add_key_frames=self.add_key_frames(),
            )

            self.main_widget.setEnabled(False)

            try:
                self.set_progress(value=33)
                self.dna = DNA(self.select_dna_path.get_file_path())
                self.set_progress(value=66)
                build_rig(dna=self.dna, config=config)
                self.set_progress(text="Processing completed", value=100)
            except Exception as e:
                self.set_progress(text="Processing failed", value=100)
                logging.error(e)
                confirmDialog(message=e, button=["ok"], icon="critical")

            self.main_widget.setEnabled(True)

    def set_progress(self, text: str = None, value: int = None) -> None:
        """Setting text and/or value to progress bar"""

        if text is not None:
            self.progress_bar.setFormat(text)
        if value is not None:
            self.progress_bar.setValue(value)

    @staticmethod
    def show_window() -> None:
        if DnaViewerWindow._instance is None:
            DnaViewerWindow._instance = DnaViewerWindow(
                parent=DnaViewerWindow.maya_main_window()
            )
        DnaViewerWindow.activate_window()

    @staticmethod
    def maya_main_window() -> QWidget:
        """
        Gets the MayaWindow instance

        @throws RuntimeError

        @rtype: QtWidgets.QWidget
        @returns: main window instance
        """

        for obj in QApplication.topLevelWidgets():
            if obj.objectName() == "MayaWindow":
                return obj
        raise RuntimeError("Could not find MayaWindow instance")

    @staticmethod
    def activate_window() -> None:
        """Shows window if minimized"""

        try:
            DnaViewerWindow._instance.show()

            if DnaViewerWindow._instance.windowState() & Qt.WindowMinimized:
                DnaViewerWindow._instance.setWindowState(Qt.WindowActive)

            DnaViewerWindow._instance.raise_()
            DnaViewerWindow._instance.activateWindow()
        except RuntimeError as e:
            logging.info(e)
            if str(e).rstrip().endswith("already deleted."):
                DnaViewerWindow._instance = None
                DnaViewerWindow.show_window()

    def add_joints(self) -> bool:
        return self.is_checked(self.joints_cb)

    def add_blend_shapes(self) -> bool:
        return self.is_checked(self.blend_shapes_cb)

    def add_skin_cluster(self) -> bool:
        return self.is_checked(self.skin_cb)

    def add_rig_logic(self) -> bool:
        return self.is_checked(self.rig_logic_cb)

    def add_ctrl_attributes_on_root_joint(self) -> bool:
        return self.is_checked(self.ctrl_attributes_on_root_joint_cb)

    def add_animated_map_attributes_on_root_joint(self) -> bool:
        return self.is_checked(self.animated_map_attributes_on_root_joint_cb)

    def add_mesh_name_to_blend_shape_channel_name(self) -> bool:
        return self.is_checked(self.mesh_name_to_blend_shape_channel_name_cb)

    def add_key_frames(self) -> bool:
        return self.is_checked(self.key_frames_cb)

    def is_checked(self, checkbox: QCheckBox) -> bool:
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

    def create_body(self) -> QVBoxLayout:
        """
        Creates the main body layout and adds needed widgets

        @rtype: QVBoxLayout
        @returns: The created vertical box layout with the widgets added
        """

        self.body = QVBoxLayout()
        self.body.setContentsMargins(
            MARGIN_BODY_LEFT,
            MARGIN_BODY_TOP,
            MARGIN_BODY_RIGHT,
            MARGIN_BOTTOM,
        )
        self.body.setSpacing(SPACING)
        self.create_dna_selector()
        self.mesh_tree_list = self.create_mesh_selector()
        self.build_options = self.create_build_options()
        self.extra_build_options = self.create_extra_build_options()

        tab = QTabWidget(self)
        tab.addTab(self.build_options, "Build options")
        tab.addTab(self.extra_build_options, "Extra options")
        widget = QWidget()
        layout = QHBoxLayout(widget)
        layout.addWidget(tab)

        self.body.addWidget(widget)

        self.select_gui_path = self.create_gui_selector()
        self.select_analog_gui_path = self.create_analog_gui_selector()
        self.select_aas_path = self.create_aas_selector()
        self.process_btn = self.create_process_btn()
        self.progress_bar = self.create_progress_bar()

        return self.body

    def create_header(self) -> QHBoxLayout:
        """
        Creates and adds to the header widget

        @rtype: QHBoxLayout
        @returns: The created horizontal box layout with the widgets added
        """

        self.header = QHBoxLayout()
        label = QLabel("v" + __version__)
        btn = self.create_help_btn()
        self.header.addWidget(label)
        self.header.addStretch(1)
        self.header.addWidget(btn)
        self.header.setContentsMargins(
            MARGIN_HEADER_LEFT,
            MARGIN_HEADER_TOP,
            MARGIN_HEADER_RIGHT,
            MARGIN_HEADER_BOTTOM,
        )
        self.header.setSpacing(SPACING)
        return self.header

    def create_help_btn(self) -> QWidget:
        """
        Creates the help button widget

        @rtype: QHBoxLayout
        @returns: The created horizontal box layout with the widgets added
        """

        btn = QPushButton(self)
        btn.setText(" ? ")
        btn.setToolTip("Help")
        btn.clicked.connect(self.on_help)
        return btn

    def on_help(self) -> None:
        """The method that gets called when the help button is clicked"""

        if HELP_URL:
            webbrowser.open(HELP_URL)
        else:
            QMessageBox.about(
                self,
                "About",
                "Sorry, this application does not have documentation yet.",
            )

    def create_dna_selector(self) -> QWidget:
        """
        Creates and adds the DNA selector widget

        @rtype: QWidget
        @returns: The created DNA selector widget
        """

        widget = QWidget()
        self.select_dna_path = self.create_dna_chooser()
        self.load_dna_btn = self.create_load_dna_button(self.select_dna_path)

        self.select_dna_path.fc_text_field.textChanged.connect(
            lambda: self.on_dna_selected(self.select_dna_path)
        )

        layout = QVBoxLayout()
        layout.addWidget(self.select_dna_path)
        layout.addWidget(self.load_dna_btn)
        layout.setContentsMargins(
            MARGIN_HEADER_LEFT,
            MARGIN_HEADER_TOP,
            MARGIN_HEADER_RIGHT,
            MARGIN_HEADER_BOTTOM,
        )
        widget.setLayout(layout)

        self.body.addWidget(widget)

        return widget

    def on_dna_selected(self, input: FileChooser) -> None:
        """
        The method that gets called when a DNA file gets selected

        @type input: FileChooser
        @param input: The file chooser object corresponding to the DNA selector widget
        """

        enabled = input.get_file_path() is not None
        self.load_dna_btn.setEnabled(enabled)
        self.process_btn.setEnabled(False)

    def create_dna_chooser(self) -> FileChooser:
        """
        Creates and adds the DNA chooser widget

        @rtype: FileChooser
        @returns: Dna chooser widget
        """

        return self.create_file_chooser(
            "Path:",
            "DNA file to load. Required by all gui elements",
            "Select a DNA file",
            "DNA files (*.dna)",
            self.on_dna_changed,
        )

    def on_dna_changed(self, state: int) -> None:  # pylint: disable=unused-argument
        """
        Method that gets called when the checkbox is changed

        @type state: int
        @param state: The changed state of the checkbox
        """
        enabled = False
        if self.dna:
            if self.dna.path == self.select_dna_path.get_file_path():
                enabled = True

        self.load_dna_btn.setEnabled(enabled)
        self.mesh_tree_list.btn_select_all.setEnabled(enabled)
        self.mesh_tree_list.btn_deselect_all.setEnabled(enabled)
        self.process_btn.setEnabled(enabled)

    def create_load_dna_button(self, dna_input: FileChooser) -> QWidget:
        """
        Creates and adds the load DNA button widget

        @type input: FileChooser
        @param input: The file chooser object corresponding to the DNA selector widget

        @rtype: QWidget
        @returns: The created load DNA button widget
        """

        btn = QPushButton("Load DNA")
        btn.setEnabled(False)
        btn.clicked.connect(lambda: self.on_load_dna_clicked(dna_input))
        return btn

    def on_load_dna_clicked(self, input: FileChooser) -> None:
        """
        The method that gets called when a DNA file gets selected

        @type input: FileChooser
        @param input: The file chooser object corresponding to the DNA selector widget
        """

        self.main_widget.setEnabled(False)
        QCoreApplication.processEvents()
        try:
            dna_file_path = input.get_file_path()

            if dna_file_path:
                self.dna = DNA(dna_file_path, [Layer.definition])
                lod_count = self.dna.get_lod_count()
                names = self.get_mesh_names()
                indices_names = self.get_lod_indices_names()
                self.mesh_tree_list.fill_mesh_list(lod_count, names, indices_names)
                self.joints_cb.setEnabled(True)
                self.enable_additional_build_options(True)
                self.process_btn.setEnabled(False)
                self.mesh_tree_list.btn_select_all.setEnabled(True)
                self.mesh_tree_list.btn_deselect_all.setEnabled(True)
        except Exception as e:
            dlg = QMessageBox()
            dlg.setIcon(QMessageBox.Warning)
            dlg.setWindowTitle("Error")
            dlg.setText(str(e))
            dlg.setStandardButtons(QMessageBox.Ok)
            dlg.exec_()

        self.main_widget.setEnabled(True)

    def get_mesh_names(self) -> List[str]:
        """Reads in the meshes of the definition"""
        names: List[str] = []
        for index in range(self.dna.get_mesh_count()):
            names.append(self.dna.get_mesh_name(index))
        return names

    def get_lod_indices_names(self) -> List[List[int]]:
        """Reads in the meshes of the definition"""
        lod_indices: List[List[int]] = []
        for index in range(self.dna.get_lod_count()):
            lod_indices.append(self.dna.get_mesh_indices_for_lod(index))
        return lod_indices

    def create_mesh_selector(self) -> MeshTreeList:
        """
        Creates and adds a mesh tree list where the entries are grouped by lods, this is used for selecting the meses that need to be processed

        @rtype: MeshTreeList
        @returns: The created mesh tree list widget
        """

        widget = MeshTreeList(self)
        self.body.addWidget(widget)
        return widget

    def create_file_chooser(
        self,
        label: str,
        hint: str,
        caption: str,
        filter: str,
        on_changed: Callable[[int], None] = None,
    ) -> FileChooser:
        """
        Creates a file chooser widget that is used for selecting file paths

        @type label: str
        @param label: The label in the FileDialog that pops up

        @type hint: str
        @param hint: The label in the FileDialog that pops up

        @type caption: str
        @param caption: The caption in the FileDialog that pops up

        @type filter: str
        @param filter: The file filter that is used in the FileDialog

        @rtype: FileChooser
        @returns: The created file chooser object
        """

        widget = FileChooser(
            label,
            hint,
            self,
            dialog_caption=caption,
            dialog_filter=filter,
            on_changed=on_changed or self.on_generic_changed,
        )
        self.body.addWidget(widget)
        return widget

    def create_gui_selector(self) -> FileChooser:
        """
        Creates the gui selector widget

        @rtype: FileChooser
        @returns: Gui selector widget
        """

        return self.create_file_chooser(
            "Gui path:",
            "GUI file to load. Required by RigLogic",
            "Select the gui file",
            "gui files (*.ma)",
        )

    def create_aas_selector(self) -> FileChooser:
        """
        Creates and adds the additional assemble script selector widget

        @rtype: FileChooser
        @returns: Additional assemble script selector widget
        """

        return self.create_file_chooser(
            "Additional assemble script path:",
            "Additional assemble script to use. Required by RigLogic",
            "Select the aas file",
            "python script (*.py)",
        )

    def create_analog_gui_selector(self) -> FileChooser:
        """
        Creates and adds the analog gui selector widget

        @rtype: FileChooser
        @returns: Analog gui selector widget
        """

        return self.create_file_chooser(
            "Analog gui path:",
            "Analog GUI file to load. Required by RigLogic",
            "Select the analog gui file",
            "analog gui files (*.ma)",
        )

    def create_build_options(self) -> QWidget:
        """Creates and adds the widget containing the build options checkboxes"""
        widget = QWidget()
        layout = QVBoxLayout(widget)
        layout.setContentsMargins(
            MARGIN_BODY_LEFT,
            MARGIN_BODY_TOP,
            MARGIN_BODY_RIGHT,
            MARGIN_BOTTOM,
        )

        self.joints_cb = self.create_checkbox(
            "joints",
            "Add joints to rig. Requires: DNA to be loaded",
            layout,
            self.on_joints_changed,
        )
        self.blend_shapes_cb = self.create_checkbox(
            "blend shapes",
            "Add blend shapes to rig. Requires: DNA to be loaded and at least one mesh to be check",
            layout,
            self.on_generic_changed,
        )
        self.skin_cb = self.create_checkbox(
            "skin cluster",
            "Add skin cluster to rig. Requires: DNA to be loaded and at least one mesh and joints to be checked",
            layout,
            self.on_generic_changed,
        )
        self.rig_logic_cb = self.create_checkbox(
            "rig logic",
            "Add RigLogic to rig. Requires: DNA to be loaded, all meshes to be checked, joints, skin, blend shapes to be checked, also gui, analog gui and additional assemble script must be set",
            layout,
        )
        layout.addStretch()

        return widget

    def create_extra_build_options(self) -> QWidget:
        """Creates and adds the widget containing the extra build options checkboxes"""
        widget = QWidget()
        layout = QVBoxLayout(widget)
        layout.setContentsMargins(
            MARGIN_BODY_LEFT,
            MARGIN_BODY_TOP,
            MARGIN_BODY_RIGHT,
            MARGIN_BOTTOM,
        )

        self.ctrl_attributes_on_root_joint_cb = self.create_checkbox(
            "ctrl attributes on root joint",
            "ctrl attributes on root joint",
            layout,
            enabled=True,
            checked=True,
        )
        self.animated_map_attributes_on_root_joint_cb = self.create_checkbox(
            "animated map attributes on root joint",
            "animated map attributes on root joint",
            layout,
            enabled=True,
            checked=True,
        )
        self.mesh_name_to_blend_shape_channel_name_cb = self.create_checkbox(
            "mesh name to blend shape channel name",
            "mesh name to blend shape channel name",
            layout,
            enabled=True,
            checked=True,
        )
        self.key_frames_cb = self.create_checkbox(
            "key frames",
            "Add keyframes to rig",
            layout,
            enabled=True,
            checked=True,
        )
        layout.addStretch()

        return widget

    def enable_additional_build_options(self, enable: bool) -> None:
        self.ctrl_attributes_on_root_joint_cb.setEnabled(enable)
        self.animated_map_attributes_on_root_joint_cb.setEnabled(enable)
        self.mesh_name_to_blend_shape_channel_name_cb.setEnabled(enable)
        self.key_frames_cb.setEnabled(enable)

    def create_checkbox(
        self,
        label: str,
        hint: str,
        layout: QHBoxLayout,
        on_changed: Callable[[int], None] = None,
        checked: bool = False,
        enabled: bool = False,
    ) -> QCheckBox:
        """
        Adds a checkbox with given parameters and connects them to the on_changed method

        @type label: str
        @param label: The label of the checkbox

        @type hint: str
        @param hint: The hint of the checkbox

        @type on_changed: Callable[[int], None]
        @param on_changed: The method that will get called when the checkbox changes states

        @type checked: bool
        @param checked: The value representing if the checkbox is checked after creation

        @type enabled: bool
        @param enabled: The value representing if the checkbox is enabled after creation

        @rtype: QCheckBox
        @returns: the created checkbox object
        """

        checkbox = QCheckBox(label, self)
        checkbox.setChecked(checked)
        checkbox.setEnabled(enabled)
        checkbox.setToolTip(hint)
        if on_changed:
            checkbox.stateChanged.connect(on_changed)
        layout.addWidget(checkbox)
        return checkbox

    def on_joints_changed(self, state: int) -> None:
        """
        Method that gets called when the joints checkbox is changed

        @type state: int
        @param state: The changed state of the checkbox
        """

        if self.joints_cb.isChecked():
            self.process_btn.setEnabled(True)
            if self.mesh_tree_list.get_selected_meshes():
                self.skin_cb.setEnabled(True)
        else:
            self.skin_cb.setEnabled(False)
            if not self.mesh_tree_list.get_selected_meshes():
                self.process_btn.setEnabled(False)
        self.on_generic_changed(state)

    def create_process_btn(self) -> QPushButton:
        """
        Creates and adds a process button

        @type window: QMainWindow
        @param window: The instance of the window object

        @rtype: QPushButton
        @returns: The created process button
        """

        btn = QPushButton("Process")
        btn.setEnabled(False)
        btn.clicked.connect(self.process)

        self.body.addWidget(btn)
        return btn

    def create_progress_bar(self) -> QProgressBar:
        """
        Creates and adds progress bar

        @type window: QMainWindow
        @param window: The instance of the window object

        @rtype: QProgressBar
        @returns: The created progress bar
        """

        progress = QProgressBar(self)
        progress.setRange(0, 100)
        progress.setValue(0)
        progress.setTextVisible(True)
        progress.setFormat("")
        self.body.addWidget(progress)
        return progress

    def on_generic_changed(self, state: int) -> None:  # pylint: disable=unused-argument
        """
        Method that gets called when the checkbox is changed

        @type state: int
        @param state: The changed state of the checkbox
        """

        self.set_riglogic_cb_enabled()

    def is_enabled_and_checked(self, check_box: QCheckBox) -> bool:
        """
        Method that checks if check box is enabled in same time

        @type check_box: QCheckBox
        @param check_box: The checkbox instance to check
        """

        return (
            check_box is not None
            and bool(check_box.isEnabled())
            and bool(check_box.isChecked())
        )

    def set_riglogic_cb_enabled(self) -> None:
        """Method that sets enable state of riglogic check box"""

        all_total_meshes = False

        if self.dna and self.is_enabled_and_checked(self.blend_shapes_cb):
            if (
                len(self.mesh_tree_list.get_selected_meshes())
                == self.dna.get_mesh_count()
            ):
                all_total_meshes = True

        enabled = (
            self.is_enabled_and_checked(self.joints_cb)
            and self.is_enabled_and_checked(self.blend_shapes_cb)
            and all_total_meshes
            and self.is_enabled_and_checked(self.skin_cb)
            and self.select_gui_path.get_file_path() is not None
            and self.select_analog_gui_path.get_file_path() is not None
            and self.select_aas_path.get_file_path() is not None
        )
        self.rig_logic_cb.setEnabled(enabled)
