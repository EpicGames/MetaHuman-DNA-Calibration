from enum import Enum
from typing import Callable

from PySide2.QtWidgets import QCheckBox, QHBoxLayout, QLabel, QWidget

from ..ui.elements import Elements


class Checkbox(Enum):
    unchecked = 0
    checked = 2


class BuildOptionsWidget(QWidget):
    """
    Widget containing build options checkboxes

    Attributes
    ----------
    @type elements: Elements
    @param elements: The object containing references to the UI elements

    @type layout: QHBoxLayout
    @param layout: The layout containing the build options checkboxes
    """

    def __init__(
        self, elements: Elements, on_generic_changed: Callable[[int], None]
    ) -> None:
        super().__init__()

        self.elements = elements

        self.layout = QHBoxLayout()
        self.layout.setContentsMargins(0, 0, 0, 0)

        self.on_generic_changed = on_generic_changed

        build_options_label = QLabel("Build options:")
        self.layout.addWidget(build_options_label)

        self.elements.joints_cb = self.create_checkbox("joints", self.on_joints_changed)
        self.elements.blend_shapes_cb = self.create_checkbox(
            "blend shapes", self.on_generic_changed
        )
        self.elements.skin_cb = self.create_checkbox("skin", self.on_generic_changed)
        self.elements.rig_logic_cb = self.create_checkbox("rig logic")

        self.setLayout(self.layout)

    def create_checkbox(
        self,
        label: str,
        on_changed: Callable[[int], None] = None,
        checked: bool = False,
        enabled: bool = False,
    ) -> QCheckBox:
        """
        Adds a checkbox with given parameters and connects them to the on_changed method

        @type label: str
        @param label: The label of the checkbox

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
        if on_changed:
            checkbox.stateChanged.connect(on_changed)
        self.layout.addWidget(checkbox)
        return checkbox

    def on_joints_changed(self, state: int) -> None:
        """
        Method that gets called when the joints checkbox is changed

        @type state: int
        @param state: The changed state of the checkbox
        """

        if state == Checkbox.checked.value:
            self.elements.process_btn.setEnabled(True)
            if self.elements.mesh_tree_list.get_selected_meshes():
                self.elements.skin_cb.setEnabled(True)
        else:
            self.elements.skin_cb.setEnabled(False)
            if not self.elements.mesh_tree_list.get_selected_meshes():
                self.elements.process_btn.setEnabled(False)
        self.on_generic_changed(state)
