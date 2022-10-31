from typing import Optional

from maya.api.OpenMaya import MVector

from ..config.analog_gui import AnalogGui as AnalogGuiConfig
from ..util.error import DNAViewerError
from ..util.maya_util import Maya


class AnalogGui:
    """
    A builder class used for manipulating the AnalogGuiConfig used in the character building process

    Attributes
    ----------
    @type gui_path: str
    @param gui_path: The location of the gui file
    """

    def __init__(self, options: Optional[AnalogGuiConfig] = None) -> None:
        self.options = options or AnalogGuiConfig()
        self.eye_l_pos = Maya.get_translation(self.options.left_eye_joint_name)
        self.eye_r_pos = Maya.get_translation(self.options.right_eye_joint_name)

    def build(self) -> None:
        """Start building the analog gui"""

        if self.options.gui_path is None:
            raise DNAViewerError(
                "Unable to import analog gui, must provide gui path..."
            )

        self.add_eyes()
        self.add_eye_locators()

    def add_eyes(self) -> None:
        """Add eyes to the analog gui"""

        Maya.set_translation(
            self.options.central_driver_name,
            Maya.get_translation(self.options.facial_root_joint_name),
        )

        delta_l = Maya.get_translation(
            self.options.left_eye_aim_up_name
        ) - Maya.get_translation(self.options.left_eye_driver_name)
        delta_r = Maya.get_translation(
            self.options.right_eye_aim_up_name
        ) - Maya.get_translation(self.options.right_eye_driver_name)

        Maya.set_translation(self.options.left_eye_driver_name, self.eye_l_pos)
        Maya.set_translation(
            self.options.right_eye_driver_name,
            self.eye_r_pos,
        )
        Maya.set_translation(
            self.options.left_eye_aim_up_name,
            MVector(
                self.eye_l_pos[0] + delta_l[0],
                self.eye_l_pos[1] + delta_l[1],
                self.eye_l_pos[2] + delta_l[2],
            ),
        )
        Maya.set_translation(
            self.options.right_eye_aim_up_name,
            MVector(
                self.eye_r_pos[0] + delta_r[0],
                self.eye_r_pos[1] + delta_r[1],
                self.eye_r_pos[2] + delta_r[2],
            ),
        )

    def add_eye_locators(self) -> None:
        """Add eye locators to the analog gui"""

        eye_l_locator_pos = Maya.get_translation(self.options.le_aim)
        eye_r_locator_pos = Maya.get_translation(self.options.re_aim)
        central_aim_pos = Maya.get_translation(self.options.central_aim)

        eye_middle_delta = (self.eye_l_pos - self.eye_r_pos) / 2

        eye_middle = self.eye_r_pos + eye_middle_delta

        Maya.set_translation(
            self.options.central_aim,
            MVector(eye_middle[0], eye_middle[1], central_aim_pos[2]),
        )
        Maya.set_translation(
            self.options.le_aim,
            MVector(self.eye_l_pos[0], self.eye_l_pos[1], eye_l_locator_pos[2]),
        )
        Maya.set_translation(
            self.options.re_aim,
            MVector(self.eye_r_pos[0], self.eye_r_pos[1], eye_r_locator_pos[2]),
        )
