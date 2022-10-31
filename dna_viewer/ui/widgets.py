from typing import Union

from PySide2.QtWidgets import QFrame, QMessageBox, QSizePolicy, QSpacerItem, QWidget


class QHLine(QFrame):
    """A widget for creating a horizontal line"""

    def __init__(self) -> None:
        super().__init__()
        self.setFrameShape(QFrame.HLine)
        self.setFrameShadow(QFrame.Sunken)


class QVSpacer(QSpacerItem):
    """A widget for creating a vertical line"""

    def __init__(self) -> None:
        super().__init__(0, 0, QSizePolicy.Minimum, QSizePolicy.Expanding)


class MessageDialog(QMessageBox):
    """A widget for creating a message dialog"""

    def __init__(
        self,
        title: str,
        message: str,
        icon: QMessageBox.Icon = QMessageBox.Information,
        parent: Union[QWidget, None] = None,
    ) -> None:
        super().__init__(parent)

        self.setIcon(icon)
        self.setWindowTitle(title)
        self.setText(message)
        self.show()
