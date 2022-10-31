from dataclasses import dataclass, field


@dataclass
class AnalogGui:
    """
    A class used to represent the analog gui config

    Attributes
    ----------
    @type gui_path: str
    @param gui_path: The location of the gui file

    @type facial_root_joint_name: str
    @param facial_root_joint_name: The name of the facial root joint

    @type left_eye_joint_name: str
    @param left_eye_joint_name: The name of the left eye joint

    @type right_eye_joint_name: str
    @param right_eye_joint_name: The name of the right eye joint

    @type central_driver_name: str
    @param central_driver_name: The name of the central driver

    @type left_eye_driver_name: str
    @param left_eye_driver_name: The name of the left eye driver

    @type right_eye_driver_name: str
    @param right_eye_driver_name: The name of the right eye driver

    @type central_aim: str
    @param central_aim: The name of the central aim

    @type le_aim: str
    @param le_aim: The name of the left eye aim

    @type re_aim: str
    @param re_aim: The name of the right eye aim
    """

    gui_path: str = field(default=None)

    facial_root_joint_name: str = "FACIAL_C_FacialRoot"
    left_eye_joint_name: str = "FACIAL_L_Eye"
    right_eye_joint_name: str = "FACIAL_R_Eye"

    central_driver_name: str = "LOC_C_eyeDriver"
    left_eye_driver_name: str = "LOC_L_eyeDriver"
    right_eye_driver_name: str = "LOC_R_eyeDriver"

    left_eye_aim_up_name: str = "LOC_L_eyeAimUp"
    right_eye_aim_up_name: str = "LOC_R_eyeAimUp"
    central_aim: str = "GRP_C_eyesAim"

    le_aim: str = "GRP_L_eyeAim"
    re_aim: str = "GRP_R_eyeAim"

    def with_gui_path(self, gui_path: str) -> "AnalogGui":
        """Set the gui path

        @type gui_path: str
        @param gui_path: The location of the gui file

        @rtype: AnalogGui
        @returns: The instance of the changed object
        """

        self.gui_path = gui_path
        return self

    def with_facial_root_joint_name(self, joint_name: str) -> "AnalogGui":
        """Set the facial root joint name

        @type joint_name: str
        @param joint_name: The value to set the facial root joint name to

        @rtype: AnalogGui
        @returns: The instance of the changed object
        """

        self.facial_root_joint_name = joint_name
        return self

    def with_left_eye_joint_name(self, joint_name: str) -> "AnalogGui":
        """Set the left eye joint name

        @type joint_name: str
        @param joint_name: The value to set the left eye joint name to

        @rtype: AnalogGui
        @returns: The instance of the changed object
        """

        self.left_eye_joint_name = joint_name
        return self

    def with_right_eye_joint_name(self, joint_name: str) -> "AnalogGui":
        """Set the right eye joint name

        @type joint_name: str
        @param joint_name: The value to set the right eye joint name to

        @rtype: AnalogGui
        @returns: The instance of the changed object
        """

        self.right_eye_joint_name = joint_name
        return self

    def with_central_driver_name(self, driver_name: str) -> "AnalogGui":
        """Set the central driver name

        @type driver_name: str
        @param driver_name: The value to set the central driver name to

        @rtype: AnalogGui
        @returns: The instance of the changed object
        """

        self.central_driver_name = driver_name
        return self

    def with_left_eye_driver_name(self, driver_name: str) -> "AnalogGui":
        """Set the left eye driver name

        @type driver_name: str
        @param driver_name: The value to set the left eye driver name to

        @rtype: AnalogGui
        @returns: The instance of the changed object
        """

        self.left_eye_driver_name = driver_name
        return self

    def with_right_eye_driver_name(self, driver_name: str) -> "AnalogGui":
        """Set right eye driver name

        @type driver_name: str
        @param driver_name: The value to set the left eye driver name to

        @rtype: AnalogGui
        @returns: The instance of the changed object
        """

        self.right_eye_driver_name = driver_name
        return self

    def with_left_eye_aim_up_name(self, name: str) -> "AnalogGui":
        """Set the left eye aim up name

        @type name: str
        @param name: The value to set the left eye aim up name to

        @rtype: AnalogGui
        @returns: The instance of the changed object
        """

        self.left_eye_aim_up_name = name
        return self

    def with_right_eye_aim_up_name(self, name: str) -> "AnalogGui":
        """Set the right eye aim up name

        @type name: str
        @param name: The value to set the right eye aim up name to

        @rtype: AnalogGui
        @returns: The instance of the changed object
        """

        self.right_eye_aim_up_name = name
        return self

    def with_central_aim(self, name: str) -> "AnalogGui":
        """Set the central aim name

        @type name: str
        @param name: The value to set the central aim name to

        @rtype: AnalogGui
        @returns: The instance of the changed object
        """

        self.central_aim = name
        return self

    def with_left_eye_aim(self, name: str) -> "AnalogGui":
        """Set the left eye aim name

        @type name: str
        @param name: The value to set the left eye aim name to

        @rtype: AnalogGui
        @returns: The instance of the changed object
        """

        self.le_aim = name
        return self

    def with_right_eye_aim(self, name: str) -> "AnalogGui":
        """Set the right eye aim name

        @type name: str
        @param name: The value to set the central aim name to

        @rtype: AnalogGui
        @returns: The instance of the changed object
        """

        self.re_aim = name
        return self
