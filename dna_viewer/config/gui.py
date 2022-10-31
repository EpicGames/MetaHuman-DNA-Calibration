from dataclasses import dataclass, field

from ..const.gui import EYE_GUI, EYE_JOINT, GUI_TRANSLATE_X


@dataclass
class Gui:
    """
    A class used to represent the gui config

    Attributes
    ----------
    @type gui_path: str
    @param gui_path: The location of the gui file

    @type left_eye_joint_name: str
    @param left_eye_joint_name: The name of the left eye joint

    @type eye_gui_name: str
    @param eye_gui_name: The name of the control in the gui

    @type gui_translate_x: float
    @param gui_translate_x: Represents the value that the gui should be additionally translated on the X axis
    """

    gui_path: str = field(default=None)

    left_eye_joint_name: str = EYE_JOINT
    eye_gui_name: str = EYE_GUI
    gui_translate_x: float = GUI_TRANSLATE_X

    def with_gui_path(self, gui_path: str) -> "Gui":
        """
        Set the gui path

        @type gui_path: str
        @param gui_path: The location of the gui file

        @rtype: Gui
        @returns: The instance of the changed object
        """

        self.gui_path = gui_path
        return self

    def with_left_eye_joint_name(self, name: str) -> "Gui":
        """
        Set name of the left eye joint

        @type name: str
        @param name: The name of the joint

        @rtype: Gui
        @returns: The instance of the changed object
        """

        self.left_eye_joint_name = name
        return self

    def with_eye_gui_name_name(self, name: str) -> "Gui":
        """
        Set name of the eye element in the gui

        @type name: str
        @param name: The name of the element in the gui

        @rtype: Gui
        @returns: The instance of the changed object
        """

        self.eye_gui_name = name
        return self

    def with_gui_translate_x(self, value: float) -> "Gui":
        """
        Set the value the gui should be additionally translated on the X axis

        @type value: float
        @param value: The value the gui should be translated on the X axis

        @rtype: Gui
        @returns: The instance of the changed object
        """

        self.gui_translate_x = value
        return self
