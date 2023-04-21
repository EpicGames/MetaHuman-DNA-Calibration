from pathlib import Path
from typing import Callable, Optional

from PySide2.QtCore import Qt
from PySide2.QtWidgets import (
    QFileDialog,
    QFrame,
    QHBoxLayout,
    QLabel,
    QLineEdit,
    QPushButton,
    QWidget,
)


class QLine(QFrame):
    """A widget for creating a horizontal line"""

    def __init__(self, line: QFrame.Shape) -> None:
        super().__init__()
        self.setFrameShape(line)
        self.setFrameShadow(QFrame.Sunken)


class QHLine(QLine):
    """A widget for creating a horizontal line"""

    def __init__(self) -> None:
        super().__init__(QFrame.HLine)


class FileChooser(QWidget):
    """
    A custom widget used for selecting a file path using a FileDialog and an input field
    """

    def __init__(
        self,
        label_text: str,
        hint: str,
        parent: Optional[QWidget] = None,
        placeholder: str = "",
        dialog_caption: str = "Select a file",
        dialog_filter: str = "All files (*.*)",
        button_text: str = "...",
        dir_selector: bool = False,
        on_changed: Callable[[int], None] = None,
    ) -> None:
        super().__init__(parent=parent)

        self._dialog_caption = dialog_caption
        self._dialog_filter = dialog_filter
        self._dir_selector = dir_selector

        layout = QHBoxLayout()
        layout.setMargin(0)

        fc_label = QLabel(label_text)
        fc_label.setMinimumHeight(32)
        fc_label.setToolTip(hint)

        self.fc_text_field = QLineEdit()
        self.fc_text_field.setAlignment(Qt.AlignLeft)
        self.fc_text_field.setPlaceholderText(placeholder)
        self.fc_text_field.textChanged.connect(on_changed)
        self.fc_text_field.setToolTip(hint)

        fc_btn = QPushButton(button_text)
        fc_btn.setToolTip(hint)

        layout.addWidget(fc_label)
        layout.addWidget(self.fc_text_field)
        layout.addWidget(fc_btn)

        fc_btn.clicked.connect(
            self.open_dialog,
        )

        self.setLayout(layout)

    def get_file_path(self) -> str:
        """
        Gets the file path from the text field

        @rtype: str
        @returns: The file path contained in the text field
        """

        path = str(self.fc_text_field.text())
        if path and Path(path.strip()).exists():
            return path
        return None

    def open_dialog(self) -> None:
        """Opens a file dialog, when a path is chosen, the text field gets filled with its value"""

        if self._dir_selector:
            file_name, _ = QFileDialog.getExistingDirectory(
                self,
                self._dialog_caption,
                "",
                QFileDialog.Option.ShowDirsOnly,
            )
            if file_name:
                self.fc_text_field.setText(file_name)
        else:
            file_name, _ = QFileDialog.getOpenFileName(
                self, self._dialog_caption, "", self._dialog_filter
            )
            if file_name:
                self.fc_text_field.setText(file_name)
