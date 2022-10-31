import webbrowser

from PySide2 import QtCore
from PySide2.QtWidgets import (
    QCheckBox,
    QHBoxLayout,
    QLabel,
    QMainWindow,
    QMessageBox,
    QProgressBar,
    QPushButton,
    QVBoxLayout,
    QWidget,
)

from ..const.ui import (
    HELP_URL,
    MARGIN_BODY_LEFT,
    MARGIN_BODY_RIGHT,
    MARGIN_BODY_TOP,
    MARGIN_BOTTOM,
    MARGIN_HEADER_BOTTOM,
    MARGIN_HEADER_LEFT,
    MARGIN_HEADER_RIGHT,
    MARGIN_HEADER_TOP,
    SPACING,
)
from ..reader.dna import load_dna
from ..ui.build_options_widget import BuildOptionsWidget
from ..ui.elements import Elements
from ..ui.file_chooser import FileChooser
from ..ui.mesh_tree_list import MeshTreeList
from ..version import __version__


class ElementsCreator:
    """
    Used for creating elements that get added to the main window

    Attributes
    ----------
    @type window: QMainWindow
    @param window: The main UI window

    @type elements: Elements
    @param elements: The container with references to the UI elements

    @type body: QVBoxLayout
    @param body: The body layout

    @type header: QHBoxLayout
    @param header: The header layout
    """

    def __init__(self, window: QMainWindow, elements: Elements) -> None:
        self.window = window
        self.elements = elements
        self.body: QVBoxLayout = None
        self.header: QHBoxLayout = None

    def create_body(self) -> QVBoxLayout:
        """
        Creates the main body layout and adds needed widgets

        @rtype: QVBoxLayout
        @returns: The created vertical box layout with the widgets added
        """

        self.body = QVBoxLayout()
        self.body.setContentsMargins(
            MARGIN_BODY_LEFT, MARGIN_BODY_TOP, MARGIN_BODY_RIGHT, MARGIN_BOTTOM
        )
        self.body.setSpacing(SPACING)
        self.create_body_widgets()
        return self.body

    def create_body_widgets(self) -> None:
        """Creates and adds all needed widgets to the body"""

        self.create_dna_selector()
        self.elements.mesh_tree_list = self.create_mesh_selector()
        self.create_build_options()
        self.elements.select_gui_path = self.create_gui_selector()
        self.elements.select_analog_gui_path = self.create_analog_gui_selector()
        self.elements.select_aas_path = self.create_aas_selector()
        self.elements.process_btn = self.create_process_btn(self.window)
        self.elements.progress_bar = self.create_progress_bar(self.window)

    def create_header(self) -> QHBoxLayout:
        """
        Creates and adds to the header widget

        @rtype: QHBoxLayout
        @returns: The created horizontal box layout with the widgets added
        """

        self.header = QHBoxLayout()
        self.create_header_widgets()
        return self.header

    def create_header_widgets(self) -> None:
        """Creates and adds all needed widgets to the header"""

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

    def create_help_btn(self) -> QWidget:
        """
        Creates the help button widget

        @rtype: QHBoxLayout
        @returns: The created horizontal box layout with the widgets added
        """

        btn = QPushButton(self.window)
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
                self.window,
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
        self.elements.select_dna_path = self.create_dna_chooser()
        self.elements.load_dna_btn = self.create_load_dna_button(
            self.elements.select_dna_path
        )

        self.elements.select_dna_path.fc_text_field.textChanged.connect(
            lambda: self.on_dna_selected(self.elements.select_dna_path)
        )

        layout = QVBoxLayout()
        layout.addWidget(self.elements.select_dna_path)
        layout.addWidget(self.elements.load_dna_btn)
        layout.setContentsMargins(0, 0, 0, 0)
        widget.setLayout(layout)

        self.body.addWidget(widget)

        return widget

    def on_dna_selected(self, input: FileChooser) -> None:
        """
        The method that gets called when a DNA file gets selected

        @type input: FileChooser
        @param input: The file chooser object corresponding to the DNA selector widget
        """

        enabled = Elements.get_file_path(input) is not None
        self.elements.load_dna_btn.setEnabled(enabled)
        self.elements.process_btn.setEnabled(False)

    def create_dna_chooser(self) -> FileChooser:
        """
        Creates and adds the DNA chooser widget

        @rtype: FileChooser
        @returns: Dna chooser widget
        """

        return self.create_file_chooser(
            "Path:", "Select a DNA file", "DNA files (*.dna)"
        )

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

        self.elements.main_widget.setEnabled(False)
        QtCore.QCoreApplication.processEvents()
        dna_file_path = Elements.get_file_path(input)

        if dna_file_path:
            self.elements.dna = load_dna(dna_file_path)
            lod_count = self.elements.dna.descriptor.lod_count
            meshes = self.elements.dna.definition.meshes
            self.elements.mesh_tree_list.fill_mesh_list(lod_count, meshes)
            self.elements.joints_cb.setEnabled(True)
            self.elements.process_btn.setEnabled(False)
        self.elements.main_widget.setEnabled(True)

    def create_mesh_selector(self) -> MeshTreeList:
        """
        Creates and adds a mesh tree list where the entries are grouped by lods, this is used for selecting the meses that need to be processed

        @rtype: MeshTreeList
        @returns: The created mesh tree list widget
        """

        widget = MeshTreeList(self.elements)
        self.body.addWidget(widget)
        return widget

    def create_file_chooser(self, label: str, caption: str, filter: str) -> FileChooser:
        """
        Creates a file chooser widget that is used for selecting file paths

        @type label: str
        @param label: The label in the FileDialog that pops up

        @type caption: str
        @param caption: The caption in the FileDialog that pops up

        @type filter: str
        @param filter: The file filter that is used in the FileDialog

        @rtype: FileChooser
        @returns: The created file chooser object
        """

        widget = FileChooser(
            label,
            self.window,
            dialog_caption=caption,
            dialog_filter=filter,
            on_changed=self.on_generic_changed,
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
            "Gui path:", "Select the gui file", "gui files (*.ma)"
        )

    def create_aas_selector(self) -> FileChooser:
        """
        Creates and adds the additional assembly script selector widget

        @rtype: FileChooser
        @returns: Additional assembly script selector widget
        """

        return self.create_file_chooser(
            "After assembly script path:", "Select the aas file", "python script (*.py)"
        )

    def create_analog_gui_selector(self) -> FileChooser:
        """
        Creates and adds the analog gui selector widget

        @rtype: FileChooser
        @returns: Analog gui selector widget
        """

        return self.create_file_chooser(
            "Analog gui path:", "Select the analog gui file", "analog gui files (*.ma)"
        )

    def create_build_options(self) -> None:
        """Creates and adds the widget containing the build options checkboxes"""

        widget = BuildOptionsWidget(
            self.elements, on_generic_changed=self.on_generic_changed
        )
        self.body.addWidget(widget)

    def create_process_btn(self, window: QMainWindow) -> QPushButton:
        """
        Creates and adds a process button

        @type window: QMainWindow
        @param window: The instance of the window object

        @rtype: QPushButton
        @returns: The created process button
        """

        btn = QPushButton("Process")
        btn.setEnabled(False)
        btn.clicked.connect(window.process)

        self.body.addWidget(btn)
        return btn

    def create_progress_bar(self, window: QMainWindow) -> QProgressBar:
        """
        Creates and adds progress bar

        @type window: QMainWindow
        @param window: The instance of the window object

        @rtype: QProgressBar
        @returns: The created progress bar
        """

        progress = QProgressBar(window)
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

        if self.elements.dna and self.is_enabled_and_checked(
            self.elements.blend_shapes_cb
        ):
            if (
                len(self.elements.mesh_tree_list.get_selected_meshes())
                == self.elements.dna.get_mesh_count()
            ):
                all_total_meshes = True

        enabled = (
            self.is_enabled_and_checked(self.elements.joints_cb)
            and self.is_enabled_and_checked(self.elements.blend_shapes_cb)
            and all_total_meshes
            and self.is_enabled_and_checked(self.elements.skin_cb)
            and self.elements.get_file_path(self.elements.select_gui_path) is not None
            and self.elements.get_file_path(self.elements.select_analog_gui_path)
            is not None
            and self.elements.get_file_path(self.elements.select_aas_path) is not None
        )

        self.elements.rig_logic_cb.setEnabled(enabled)
