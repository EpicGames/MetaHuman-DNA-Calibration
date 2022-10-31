import maya.cmds as cmds
from sys import stderr


def both_guis_loaded():
    return gui_loaded() and analog_gui_loaded()


def gui_loaded():
    return cmds_exists("CTRL_expressions")


def analog_gui_loaded():
    return cmds_exists("GRP_C_eyesAim")


def run_after_assemble():
    if analog_gui_loaded():
        adjust_aim_control()
    if gui_loaded():
        connect_expressions()

    if analog_gui_loaded():
        eyes_setup()

    clean_up()

    if gui_loaded():
        connect_neck_correctives()
    if both_guis_loaded():
        connect_follow_head()
    print("Rig assembly finished")


# ****************************************************************************************************
def adjust_aim_control():
    """
    This method would properly position aim controls based on the position of eye joints for specific characters.
    """

    facial_root_jnt = cmds_xform("FACIAL_C_FacialRoot", query=True, worldSpace=True, translation=True)
    eye_jnt_left = cmds_xform("FACIAL_L_Eye", query=True, worldSpace=True, translation=True)
    eye_jnt_right = cmds_xform("FACIAL_R_Eye", query=True, worldSpace=True, translation=True)

    cmds_xform("LOC_C_eyeDriver", worldSpace=True, absolute=True, translation=facial_root_jnt)
    cmds_xform("LOC_L_eyeDriver", worldSpace=True, absolute=True, translation=eye_jnt_left)
    cmds_xform("LOC_R_eyeDriver", worldSpace=True, absolute=True, translation=eye_jnt_right)

    cmds_xform("LOC_L_eyeAimUp", worldSpace=True, absolute=True, translation=eye_jnt_left)
    cmds_set_attr("LOC_L_eyeAimUp.ty", 10.0)
    cmds_xform("LOC_R_eyeAimUp", worldSpace=True, absolute=True, translation=eye_jnt_right)
    cmds_set_attr("LOC_R_eyeAimUp.ty", 10.0)

    cmds_space_locator(name="LOC_temp", absolute=True, position=[0.0, 0.0, 0.0])
    root_orientation = cmds_xform("LOC_C_eyeDriver", query=True, worldSpace=True, rotation=True)
    cmds_xform("LOC_temp", worldSpace=True, absolute=True, rotation=root_orientation)

    cmds_parent("GRP_L_eyeAim", "LOC_temp")
    cmds_xform("GRP_L_eyeAim", worldSpace=True, absolute=True, translation=eye_jnt_left)
    cmds_set_attr("GRP_L_eyeAim.tz", 30.0)
    cmds_parent("GRP_R_eyeAim", "LOC_temp")
    cmds_xform("GRP_R_eyeAim", worldSpace=True, absolute=True, translation=eye_jnt_right)
    cmds_set_attr("GRP_R_eyeAim.tz", 30.0)
    cmds_parent("GRP_C_eyesAim", "LOC_temp")
    cmds_set_attr("GRP_C_eyesAim.tx", 0.0)
    ty_grp_eye_aim_l = cmds_get_attr("GRP_L_eyeAim.ty")
    ty_grp_eye_aim_r = cmds_get_attr("GRP_R_eyeAim.ty")

    ty_grp_eye_aim_c = (ty_grp_eye_aim_l + ty_grp_eye_aim_r) / 2
    cmds_set_attr("GRP_C_eyesAim.ty", ty_grp_eye_aim_c)
    cmds_set_attr("GRP_C_eyesAim.tz", 30.0)

    cmds_parent("GRP_L_eyeAim", "CTRL_C_eyesAim")
    cmds_parent("GRP_R_eyeAim", "CTRL_C_eyesAim")
    cmds_parent("GRP_C_eyesAim", world=True)
    cmds_delete("LOC_temp")

    cmds_parent("GRP_convergenceGUI", "CTRL_C_eyesAim")
    cmds_set_attr("GRP_convergenceGUI.tx", 0.4)
    cmds_set_attr("GRP_convergenceGUI.ty", 0.0)
    cmds_set_attr("GRP_convergenceGUI.tz", 0.0)


# ****************************************************************************************************
def connect_expression(driverCtrl, driverAttr, minVal, maxVal, driverKey1, driverKey2, expCtrl, expAttr, expKey1,
                       expKey2):
    """
    Connects one GUI control with raw control.
    """

    # create driver attribute if dont exists
    if not cmds.objExists(f"{driverCtrl}.{driverAttr}"):
        cmds_set_attr(driverCtrl, longName=driverAttr, keyable=True, attributeType="float", minValue=minVal,
                      maxValue=maxVal, dv=0.0)

    # connect CTRL driver with driven expression
    cmds_set_driven_keyframe(f"{expCtrl}.{expAttr}", itt="linear", ott="linear",
                             currentDriver=f"{driverCtrl}.{driverAttr}", driverValue=driverKey1, value=expKey1)
    cmds_set_driven_keyframe(f"{expCtrl}.{expAttr}", itt="linear", ott="linear",
                             currentDriver=f"{driverCtrl}.{driverAttr}", driverValue=driverKey2, value=expKey2)


# ****************************************************************************************************
def connect_expressions():
    """
    This method would connect GUI with raw controls. Raw controls are driven by rig logic while the user
    manipulates GUI controls.
    """

    # brows down
    connect_expression("CTRL_L_brow_down", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "browDownL", 0.0, 1.0)
    connect_expression("CTRL_R_brow_down", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "browDownR", 0.0, 1.0)
    # brows lateral
    connect_expression("CTRL_L_brow_lateral", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "browLateralL", 0.0, 1.0)
    connect_expression("CTRL_R_brow_lateral", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "browLateralR", 0.0, 1.0)
    # brows raise
    connect_expression("CTRL_L_brow_raiseIn", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "browRaiseInL", 0.0, 1.0)
    connect_expression("CTRL_R_brow_raiseIn", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "browRaiseInR", 0.0, 1.0)
    connect_expression("CTRL_L_brow_raiseOut", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "browRaiseOuterL", 0.0,
                       1.0)
    connect_expression("CTRL_R_brow_raiseOut", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "browRaiseOuterR", 0.0,
                       1.0)
    # ears up
    connect_expression("CTRL_L_ear_up", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "earUpL", 0.0, 1.0)
    connect_expression("CTRL_R_ear_up", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "earUpR", 0.0, 1.0)
    # eyes widen/blink
    connect_expression("CTRL_L_eye_blink", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "eyeBlinkL", 0.0, 1.0)
    connect_expression("CTRL_R_eye_blink", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "eyeBlinkR", 0.0, 1.0)
    connect_expression("CTRL_L_eye_blink", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "eyeWidenL", 0.0, 1.0)
    connect_expression("CTRL_R_eye_blink", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "eyeWidenR", 0.0, 1.0)
    # lid press
    connect_expression("CTRL_L_eye_lidPress", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "eyeLidPressL", 0.0, 1.0)
    connect_expression("CTRL_R_eye_lidPress", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "eyeLidPressR", 0.0, 1.0)
    # eyes squint inner
    connect_expression("CTRL_L_eye_squintInner", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "eyeSquintInnerL", 0.0,
                       1.0)
    connect_expression("CTRL_R_eye_squintInner", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "eyeSquintInnerR", 0.0,
                       1.0)
    # eyes cheek raise
    connect_expression("CTRL_L_eye_cheekRaise", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "eyeCheekRaiseL", 0.0,
                       1.0)
    connect_expression("CTRL_R_eye_cheekRaise", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "eyeCheekRaiseR", 0.0,
                       1.0)
    # face scrunch
    connect_expression("CTRL_L_eye_faceScrunch", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "eyeFaceScrunchL", 0.0,
                       1.0)
    connect_expression("CTRL_R_eye_faceScrunch", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "eyeFaceScrunchR", 0.0,
                       1.0)
    # eyelids up/down (and eyes relax)
    connect_expression("CTRL_L_eye_eyelidU", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "eyeUpperLidUpL", 0.0, 1.0)
    connect_expression("CTRL_R_eye_eyelidU", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "eyeUpperLidUpR", 0.0, 1.0)
    connect_expression("CTRL_L_eye_eyelidU", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "eyeRelaxL", 0.0, 1.0)
    connect_expression("CTRL_R_eye_eyelidU", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "eyeRelaxR", 0.0, 1.0)
    connect_expression("CTRL_L_eye_eyelidD", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "eyeLowerLidDownL", 0.0,
                       1.0)
    connect_expression("CTRL_R_eye_eyelidD", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "eyeLowerLidDownR", 0.0,
                       1.0)
    connect_expression("CTRL_L_eye_eyelidD", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "eyeLowerLidUpL", 0.0, 1.0)
    connect_expression("CTRL_R_eye_eyelidD", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "eyeLowerLidUpR", 0.0, 1.0)

    if analog_gui_loaded():
        # eyes look up/down/left/right
        connect_expression("LOC_L_eyeDriver", "rx", -30.0, 40.0, 0.0, -30.0, "CTRL_expressions", "eyeLookUpL", 0.0, 1.0)
        connect_expression("LOC_R_eyeDriver", "rx", -30.0, 40.0, 0.0, -30.0, "CTRL_expressions", "eyeLookUpR", 0.0, 1.0)
        connect_expression("LOC_L_eyeDriver", "rx", -30.0, 40.0, 0.0, 40.0, "CTRL_expressions", "eyeLookDownL", 0.0, 1.0)
        connect_expression("LOC_R_eyeDriver", "rx", -30.0, 40.0, 0.0, 40.0, "CTRL_expressions", "eyeLookDownR", 0.0, 1.0)
        connect_expression("LOC_L_eyeDriver", "ry", -40.0, 40.0, 0.0, 40.0, "CTRL_expressions", "eyeLookLeftL", 0.0, 1.0)
        connect_expression("LOC_R_eyeDriver", "ry", -40.0, 40.0, 0.0, 40.0, "CTRL_expressions", "eyeLookLeftR", 0.0, 1.0)
        connect_expression("LOC_L_eyeDriver", "ry", -40.0, 40.0, 0.0, -40.0, "CTRL_expressions", "eyeLookRightL", 0.0, 1.0)
        connect_expression("LOC_R_eyeDriver", "ry", -40.0, 40.0, 0.0, -40.0, "CTRL_expressions", "eyeLookRightR", 0.0, 1.0)
    # pupils wide/narrow
    connect_expression("CTRL_L_eye_pupil", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "eyePupilWideL", 0.0, 1.0)
    connect_expression("CTRL_R_eye_pupil", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "eyePupilWideR", 0.0, 1.0)
    connect_expression("CTRL_L_eye_pupil", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "eyePupilNarrowL", 0.0, 1.0)
    connect_expression("CTRL_R_eye_pupil", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "eyePupilNarrowR", 0.0, 1.0)
    # eyes parallel
    connect_expression("CTRL_C_eye_parallelLook", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions",
                       "eyeParallelLookDirection", 0.0, 1.0)
    # eyelashes tweakers
    connect_expression("CTRL_L_eyelashes_tweakerIn", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "eyelashesDownINL",
                       0.0, 1.0)
    connect_expression("CTRL_R_eyelashes_tweakerIn", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "eyelashesDownINR",
                       0.0, 1.0)
    connect_expression("CTRL_L_eyelashes_tweakerOut", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions",
                       "eyelashesDownOUTL",
                       0.0, 1.0)
    connect_expression("CTRL_R_eyelashes_tweakerOut", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions",
                       "eyelashesDownOUTR",
                       0.0, 1.0)
    connect_expression("CTRL_L_eyelashes_tweakerIn", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "eyelashesUpINL",
                       0.0, 1.0)
    connect_expression("CTRL_R_eyelashes_tweakerIn", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "eyelashesUpINR",
                       0.0, 1.0)
    connect_expression("CTRL_L_eyelashes_tweakerOut", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "eyelashesUpOUTL",
                       0.0, 1.0)
    connect_expression("CTRL_R_eyelashes_tweakerOut", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "eyelashesUpOUTR",
                       0.0, 1.0)
    # nose wrinkle/depress/dilate/compress
    connect_expression("CTRL_L_nose", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "noseWrinkleL", 0.0, 1.0)
    connect_expression("CTRL_R_nose", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "noseWrinkleR", 0.0, 1.0)
    connect_expression("CTRL_L_nose", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "noseNostrilDepressL", 0.0, 1.0)
    connect_expression("CTRL_R_nose", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "noseNostrilDepressR", 0.0, 1.0)
    connect_expression("CTRL_L_nose", "tx", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "noseNostrilDilateL", 0.0, 1.0)
    connect_expression("CTRL_R_nose", "tx", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "noseNostrilDilateR", 0.0, 1.0)
    connect_expression("CTRL_L_nose", "tx", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "noseNostrilCompressL", 0.0, 1.0)
    connect_expression("CTRL_R_nose", "tx", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "noseNostrilCompressR", 0.0, 1.0)
    # nose wrinkle upper
    connect_expression("CTRL_L_nose_wrinkleUpper", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "noseWrinkleUpperL",
                       0.0, 1.0)
    connect_expression("CTRL_R_nose_wrinkleUpper", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "noseWrinkleUpperR",
                       0.0, 1.0)
    # nasolabial deepener
    connect_expression("CTRL_L_nose_nasolabialDeepen", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions",
                       "noseNasolabialDeepenL", 0.0, 1.0)
    connect_expression("CTRL_R_nose_nasolabialDeepen", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions",
                       "noseNasolabialDeepenR", 0.0, 1.0)
    # cheek suck/blow
    connect_expression("CTRL_L_mouth_suckBlow", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthCheekBlowL", 0.0,
                       1.0)
    connect_expression("CTRL_R_mouth_suckBlow", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthCheekBlowR", 0.0,
                       1.0)
    connect_expression("CTRL_L_mouth_suckBlow", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "mouthCheekSuckL", 0.0,
                       1.0)
    connect_expression("CTRL_R_mouth_suckBlow", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "mouthCheekSuckR", 0.0,
                       1.0)
    # lips blow
    connect_expression("CTRL_L_mouth_lipsBlow", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthLipsBlowL", 0.0,
                       1.0)
    connect_expression("CTRL_R_mouth_lipsBlow", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthLipsBlowR", 0.0,
                       1.0)
    # mouth up/down/left/right
    connect_expression("CTRL_C_mouth", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthUp", 0.0, 1.0)
    connect_expression("CTRL_C_mouth", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "mouthDown", 0.0, 1.0)
    connect_expression("CTRL_C_mouth", "tx", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthLeft", 0.0, 1.0)
    connect_expression("CTRL_C_mouth", "tx", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "mouthRight", 0.0, 1.0)
    # upper lip raise
    connect_expression("CTRL_L_mouth_upperLipRaise", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions",
                       "mouthUpperLipRaiseL",
                       0.0, 1.0)
    connect_expression("CTRL_R_mouth_upperLipRaise", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions",
                       "mouthUpperLipRaiseR",
                       0.0, 1.0)
    # lower lip depress
    connect_expression("CTRL_L_mouth_lowerLipDepress", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions",
                       "mouthLowerLipDepressL", 0.0, 1.0)
    connect_expression("CTRL_R_mouth_lowerLipDepress", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions",
                       "mouthLowerLipDepressR", 0.0, 1.0)
    # corner pull
    connect_expression("CTRL_L_mouth_cornerPull", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthCornerPullL", 0.0,
                       1.0)
    connect_expression("CTRL_R_mouth_cornerPull", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthCornerPullR", 0.0,
                       1.0)
    # mouth stretch
    connect_expression("CTRL_L_mouth_stretch", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthStretchL", 0.0, 1.0)
    connect_expression("CTRL_R_mouth_stretch", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthStretchR", 0.0, 1.0)
    # mouth stretch lips close
    connect_expression("CTRL_L_mouth_stretchLipsClose", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions",
                       "mouthStretchLipsCloseL", 0.0, 1.0)
    connect_expression("CTRL_R_mouth_stretchLipsClose", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions",
                       "mouthStretchLipsCloseR", 0.0, 1.0)
    # dimpler
    connect_expression("CTRL_L_mouth_dimple", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthDimpleL", 0.0, 1.0)
    connect_expression("CTRL_R_mouth_dimple", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthDimpleR", 0.0, 1.0)
    # corner depress
    connect_expression("CTRL_L_mouth_cornerDepress", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions",
                       "mouthCornerDepressL",
                       0.0, 1.0)
    connect_expression("CTRL_R_mouth_cornerDepress", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions",
                       "mouthCornerDepressR",
                       0.0, 1.0)
    # mouth press
    connect_expression("CTRL_L_mouth_pressU", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthPressUL", 0.0, 1.0)
    connect_expression("CTRL_R_mouth_pressU", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthPressUR", 0.0, 1.0)
    connect_expression("CTRL_L_mouth_pressD", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthPressDL", 0.0, 1.0)
    connect_expression("CTRL_R_mouth_pressD", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthPressDR", 0.0, 1.0)
    # purse
    connect_expression("CTRL_L_mouth_purseU", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthLipsPurseUL", 0.0,
                       1.0)
    connect_expression("CTRL_R_mouth_purseU", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthLipsPurseUR", 0.0,
                       1.0)
    connect_expression("CTRL_L_mouth_purseD", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthLipsPurseDL", 0.0,
                       1.0)
    connect_expression("CTRL_R_mouth_purseD", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthLipsPurseDR", 0.0,
                       1.0)
    # lips towards
    connect_expression("CTRL_L_mouth_towardsU", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthLipsTowardsUL", 0.0,
                       1.0)
    connect_expression("CTRL_R_mouth_towardsU", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthLipsTowardsUR", 0.0,
                       1.0)
    connect_expression("CTRL_L_mouth_towardsD", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthLipsTowardsDL", 0.0,
                       1.0)
    connect_expression("CTRL_R_mouth_towardsD", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthLipsTowardsDR", 0.0,
                       1.0)
    # funnel
    connect_expression("CTRL_L_mouth_funnelU", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthFunnelUL", 0.0, 1.0)
    connect_expression("CTRL_R_mouth_funnelU", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthFunnelUR", 0.0, 1.0)
    connect_expression("CTRL_L_mouth_funnelD", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthFunnelDL", 0.0, 1.0)
    connect_expression("CTRL_R_mouth_funnelD", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthFunnelDR", 0.0, 1.0)
    # lips together
    connect_expression("CTRL_L_mouth_lipsTogetherU", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions",
                       "mouthLipsTogetherUL",
                       0.0, 1.0)
    connect_expression("CTRL_R_mouth_lipsTogetherU", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions",
                       "mouthLipsTogetherUR",
                       0.0, 1.0)
    connect_expression("CTRL_L_mouth_lipsTogetherD", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions",
                       "mouthLipsTogetherDL",
                       0.0, 1.0)
    connect_expression("CTRL_R_mouth_lipsTogetherD", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions",
                       "mouthLipsTogetherDR",
                       0.0, 1.0)
    # upper lip bite
    connect_expression("CTRL_L_mouth_lipBiteU", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthUpperLipBiteL", 0.0,
                       1.0)
    connect_expression("CTRL_R_mouth_lipBiteU", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthUpperLipBiteR", 0.0,
                       1.0)
    # lower lip bite
    connect_expression("CTRL_L_mouth_lipBiteD", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthLowerLipBiteL", 0.0,
                       1.0)
    connect_expression("CTRL_R_mouth_lipBiteD", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthLowerLipBiteR", 0.0,
                       1.0)
    # lips tighten
    connect_expression("CTRL_L_mouth_tightenU", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthLipsTightenUL", 0.0,
                       1.0)
    connect_expression("CTRL_R_mouth_tightenU", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthLipsTightenUR", 0.0,
                       1.0)
    connect_expression("CTRL_L_mouth_tightenD", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthLipsTightenDL", 0.0,
                       1.0)
    connect_expression("CTRL_R_mouth_tightenD", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthLipsTightenDR", 0.0,
                       1.0)
    # lips press
    connect_expression("CTRL_L_mouth_lipsPressU", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthLipsPressL", 0.0,
                       1.0)
    connect_expression("CTRL_R_mouth_lipsPressU", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthLipsPressR", 0.0,
                       1.0)
    # sharp corner pull
    connect_expression("CTRL_L_mouth_sharpCornerPull", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions",
                       "mouthSharpCornerPullL", 0.0, 1.0)
    connect_expression("CTRL_R_mouth_sharpCornerPull", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions",
                       "mouthSharpCornerPullR", 0.0, 1.0)
    # mouth sticky
    connect_expression("CTRL_C_mouth_stickyU", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthStickyUC", 0.0, 1.0)
    connect_expression("CTRL_L_mouth_stickyInnerU", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthStickyUINL",
                       0.0,
                       1.0)
    connect_expression("CTRL_R_mouth_stickyInnerU", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthStickyUINR",
                       0.0,
                       1.0)
    connect_expression("CTRL_L_mouth_stickyOuterU", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthStickyUOUTL",
                       0.0, 1.0)
    connect_expression("CTRL_R_mouth_stickyOuterU", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthStickyUOUTR",
                       0.0, 1.0)
    connect_expression("CTRL_C_mouth_stickyD", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthStickyDC", 0.0, 1.0)
    connect_expression("CTRL_L_mouth_stickyInnerD", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthStickyDINL",
                       0.0,
                       1.0)
    connect_expression("CTRL_R_mouth_stickyInnerD", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthStickyDINR",
                       0.0,
                       1.0)
    connect_expression("CTRL_L_mouth_stickyOuterD", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthStickyDOUTL",
                       0.0, 1.0)
    connect_expression("CTRL_R_mouth_stickyOuterD", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthStickyDOUTR",
                       0.0, 1.0)
    # sticky lips
    cmds_set_driven_keyframe("CTRL_expressions.mouthLipsStickyLPh1", itt="linear", ott="linear",
                             currentDriver="CTRL_L_mouth_lipSticky.ty", driverValue=0, value=0)
    cmds_set_driven_keyframe("CTRL_expressions.mouthLipsStickyLPh1", itt="linear", ott="linear",
                             currentDriver="CTRL_L_mouth_lipSticky.ty", driverValue=0.33, value=1)
    cmds_set_driven_keyframe("CTRL_expressions.mouthLipsStickyLPh1", itt="linear", ott="linear",
                             currentDriver="CTRL_L_mouth_lipSticky.ty", driverValue=0.66, value=0)
    cmds_set_driven_keyframe("CTRL_expressions.mouthLipsStickyLPh2", itt="linear", ott="linear",
                             currentDriver="CTRL_L_mouth_lipSticky.ty", driverValue=0.33, value=0)
    cmds_set_driven_keyframe("CTRL_expressions.mouthLipsStickyLPh2", itt="linear", ott="linear",
                             currentDriver="CTRL_L_mouth_lipSticky.ty", driverValue=0.66, value=1)
    cmds_set_driven_keyframe("CTRL_expressions.mouthLipsStickyLPh2", itt="linear", ott="linear",
                             currentDriver="CTRL_L_mouth_lipSticky.ty", driverValue=1, value=0)
    cmds_set_driven_keyframe("CTRL_expressions.mouthLipsStickyLPh3", itt="linear", ott="linear",
                             currentDriver="CTRL_L_mouth_lipSticky.ty", driverValue=0.66, value=0)
    cmds_set_driven_keyframe("CTRL_expressions.mouthLipsStickyLPh3", itt="linear", ott="linear",
                             currentDriver="CTRL_L_mouth_lipSticky.ty", driverValue=1, value=1)
    cmds_set_driven_keyframe("CTRL_expressions.mouthLipsStickyRPh1", itt="linear", ott="linear",
                             currentDriver="CTRL_R_mouth_lipSticky.ty", driverValue=0, value=0)
    cmds_set_driven_keyframe("CTRL_expressions.mouthLipsStickyRPh1", itt="linear", ott="linear",
                             currentDriver="CTRL_R_mouth_lipSticky.ty", driverValue=0.33, value=1)
    cmds_set_driven_keyframe("CTRL_expressions.mouthLipsStickyRPh1", itt="linear", ott="linear",
                             currentDriver="CTRL_R_mouth_lipSticky.ty", driverValue=0.66, value=0)
    cmds_set_driven_keyframe("CTRL_expressions.mouthLipsStickyRPh2", itt="linear", ott="linear",
                             currentDriver="CTRL_R_mouth_lipSticky.ty", driverValue=0.33, value=0)
    cmds_set_driven_keyframe("CTRL_expressions.mouthLipsStickyRPh2", itt="linear", ott="linear",
                             currentDriver="CTRL_R_mouth_lipSticky.ty", driverValue=0.66, value=1)
    cmds_set_driven_keyframe("CTRL_expressions.mouthLipsStickyRPh2", itt="linear", ott="linear",
                             currentDriver="CTRL_R_mouth_lipSticky.ty", driverValue=1, value=0)
    cmds_set_driven_keyframe("CTRL_expressions.mouthLipsStickyRPh3", itt="linear", ott="linear",
                             currentDriver="CTRL_R_mouth_lipSticky.ty", driverValue=0.66, value=0)
    cmds_set_driven_keyframe("CTRL_expressions.mouthLipsStickyRPh3", itt="linear", ott="linear",
                             currentDriver="CTRL_R_mouth_lipSticky.ty", driverValue=1, value=1)
    # lips push/pull
    connect_expression("CTRL_L_mouth_pushPullU", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthLipsPushUL", 0.0,
                       1.0)
    connect_expression("CTRL_R_mouth_pushPullU", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthLipsPushUR", 0.0,
                       1.0)
    connect_expression("CTRL_L_mouth_pushPullD", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthLipsPushDL", 0.0,
                       1.0)
    connect_expression("CTRL_R_mouth_pushPullD", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthLipsPushDR", 0.0,
                       1.0)
    connect_expression("CTRL_L_mouth_pushPullU", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "mouthLipsPullUL", 0.0,
                       1.0)
    connect_expression("CTRL_R_mouth_pushPullU", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "mouthLipsPullUR", 0.0,
                       1.0)
    connect_expression("CTRL_L_mouth_pushPullD", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "mouthLipsPullDL", 0.0,
                       1.0)
    connect_expression("CTRL_R_mouth_pushPullD", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "mouthLipsPullDR", 0.0,
                       1.0)
    # lips thin/thick
    connect_expression("CTRL_L_mouth_thicknessU", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthLipsThinUL", 0.0,
                       1.0)
    connect_expression("CTRL_R_mouth_thicknessU", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthLipsThinUR", 0.0,
                       1.0)
    connect_expression("CTRL_L_mouth_thicknessD", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthLipsThinDL", 0.0,
                       1.0)
    connect_expression("CTRL_R_mouth_thicknessD", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthLipsThinDR", 0.0,
                       1.0)
    connect_expression("CTRL_L_mouth_thicknessU", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "mouthLipsThickUL",
                       0.0, 1.0)
    connect_expression("CTRL_R_mouth_thicknessU", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "mouthLipsThickUR",
                       0.0, 1.0)
    connect_expression("CTRL_L_mouth_thicknessD", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "mouthLipsThickDL",
                       0.0, 1.0)
    connect_expression("CTRL_R_mouth_thicknessD", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "mouthLipsThickDR",
                       0.0, 1.0)
    # corner sharpen
    connect_expression("CTRL_L_mouth_cornerSharpnessU", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions",
                       "mouthCornerSharpenUL", 0.0, 1.0)
    connect_expression("CTRL_R_mouth_cornerSharpnessU", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions",
                       "mouthCornerSharpenUR", 0.0, 1.0)
    connect_expression("CTRL_L_mouth_cornerSharpnessD", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions",
                       "mouthCornerSharpenDL", 0.0, 1.0)
    connect_expression("CTRL_R_mouth_cornerSharpnessD", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions",
                       "mouthCornerSharpenDR", 0.0, 1.0)
    connect_expression("CTRL_L_mouth_cornerSharpnessU", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions",
                       "mouthCornerRounderUL", 0.0, 1.0)
    connect_expression("CTRL_R_mouth_cornerSharpnessU", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions",
                       "mouthCornerRounderUR", 0.0, 1.0)
    connect_expression("CTRL_L_mouth_cornerSharpnessD", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions",
                       "mouthCornerRounderDL", 0.0, 1.0)
    connect_expression("CTRL_R_mouth_cornerSharpnessD", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions",
                       "mouthCornerRounderDR", 0.0, 1.0)
    # lips towards
    connect_expression("CTRL_L_mouth_lipsTowardsTeethU", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions",
                       "mouthUpperLipTowardsTeethL", 0.0, 1.0)
    connect_expression("CTRL_R_mouth_lipsTowardsTeethU", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions",
                       "mouthUpperLipTowardsTeethR", 0.0, 1.0)
    connect_expression("CTRL_L_mouth_lipsTowardsTeethD", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions",
                       "mouthLowerLipTowardsTeethL", 0.0, 1.0)
    connect_expression("CTRL_R_mouth_lipsTowardsTeethD", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions",
                       "mouthLowerLipTowardsTeethR", 0.0, 1.0)
    # lips shift
    connect_expression("CTRL_C_mouth_lipShiftU", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions",
                       "mouthUpperLipShiftLeft",
                       0.0, 1.0)
    connect_expression("CTRL_C_mouth_lipShiftU", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions",
                       "mouthUpperLipShiftRight", 0.0, 1.0)
    connect_expression("CTRL_C_mouth_lipShiftD", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions",
                       "mouthLowerLipShiftLeft",
                       0.0, 1.0)
    connect_expression("CTRL_C_mouth_lipShiftD", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions",
                       "mouthLowerLipShiftRight", 0.0, 1.0)
    # lips roll
    connect_expression("CTRL_L_mouth_lipsRollU", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthUpperLipRollInL",
                       0.0, 1.0)
    connect_expression("CTRL_R_mouth_lipsRollU", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthUpperLipRollInR",
                       0.0, 1.0)
    connect_expression("CTRL_L_mouth_lipsRollD", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthLowerLipRollInL",
                       0.0, 1.0)
    connect_expression("CTRL_R_mouth_lipsRollD", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthLowerLipRollInR",
                       0.0, 1.0)
    connect_expression("CTRL_L_mouth_lipsRollU", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions",
                       "mouthUpperLipRollOutL",
                       0.0, 1.0)
    connect_expression("CTRL_R_mouth_lipsRollU", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions",
                       "mouthUpperLipRollOutR",
                       0.0, 1.0)
    connect_expression("CTRL_L_mouth_lipsRollD", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions",
                       "mouthLowerLipRollOutL",
                       0.0, 1.0)
    connect_expression("CTRL_R_mouth_lipsRollD", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions",
                       "mouthLowerLipRollOutR",
                       0.0, 1.0)
    # corners
    connect_expression("CTRL_L_mouth_corner", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthCornerUpL", 0.0, 1.0)
    connect_expression("CTRL_L_mouth_corner", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "mouthCornerDownL", 0.0,
                       1.0)
    connect_expression("CTRL_L_mouth_corner", "tx", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthCornerWideL", 0.0,
                       1.0)
    connect_expression("CTRL_L_mouth_corner", "tx", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "mouthCornerNarrowL", 0.0,
                       1.0)
    connect_expression("CTRL_R_mouth_corner", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthCornerUpR", 0.0, 1.0)
    connect_expression("CTRL_R_mouth_corner", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "mouthCornerDownR", 0.0,
                       1.0)
    connect_expression("CTRL_R_mouth_corner", "tx", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "mouthCornerWideR", 0.0,
                       1.0)
    connect_expression("CTRL_R_mouth_corner", "tx", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "mouthCornerNarrowR", 0.0,
                       1.0)
    # tongue up/down/left/right
    connect_expression("CTRL_C_tongue", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "tongueUp", 0.0, 1.0)
    connect_expression("CTRL_C_tongue", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "tongueDown", 0.0, 1.0)
    connect_expression("CTRL_C_tongue", "tx", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "tongueLeft", 0.0, 1.0)
    connect_expression("CTRL_C_tongue", "tx", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "tongueRight", 0.0, 1.0)
    # tongue roll up/down/left/right
    connect_expression("CTRL_C_tongue_roll", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "tongueRollUp", 0.0, 1.0)
    connect_expression("CTRL_C_tongue_roll", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "tongueRollDown", 0.0, 1.0)
    connect_expression("CTRL_C_tongue_roll", "tx", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "tongueRollLeft", 0.0, 1.0)
    connect_expression("CTRL_C_tongue_roll", "tx", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "tongueRollRight", 0.0,
                       1.0)
    # tongue tip up/down/left/right
    connect_expression("CTRL_C_tongue_tip", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "tongueTipUp", 0.0, 1.0)
    connect_expression("CTRL_C_tongue_tip", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "tongueTipDown", 0.0, 1.0)
    connect_expression("CTRL_C_tongue_tip", "tx", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "tongueTipLeft", 0.0, 1.0)
    connect_expression("CTRL_C_tongue_tip", "tx", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "tongueTipRight", 0.0, 1.0)
    # tongue in/out
    connect_expression("CTRL_C_tongue_inOut", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "tongueIn", 0.0, 1.0)
    connect_expression("CTRL_C_tongue_inOut", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "tongueOut", 0.0, 1.0)
    # tongue press
    connect_expression("CTRL_C_tongue_press", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "tonguePress", 0.0, 1.0)
    # tongue wide/narrow
    connect_expression("CTRL_C_tongue_narrowWide", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "tongueWide", 0.0,
                       1.0)
    connect_expression("CTRL_C_tongue_narrowWide", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "tongueNarrow", 0.0,
                       1.0)
    # jaw open
    connect_expression("CTRL_C_jaw", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "jawOpen", 0.0, 1.0)
    # jaw left/right
    connect_expression("CTRL_C_jaw", "tx", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "jawLeft", 0.0, 1.0)
    connect_expression("CTRL_C_jaw", "tx", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "jawRight", 0.0, 1.0)
    # jaw back/fwd
    connect_expression("CTRL_C_jaw_fwdBack", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "jawFwd", 0.0, 1.0)
    connect_expression("CTRL_C_jaw_fwdBack", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "jawBack", 0.0, 1.0)
    # jaw clench
    connect_expression("CTRL_L_jaw_clench", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "jawClenchL", 0.0, 1.0)
    connect_expression("CTRL_R_jaw_clench", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "jawClenchR", 0.0, 1.0)
    # chin raise
    connect_expression("CTRL_L_jaw_ChinRaiseU", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "jawChinRaiseUL", 0.0,
                       1.0)
    connect_expression("CTRL_R_jaw_ChinRaiseU", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "jawChinRaiseUR", 0.0,
                       1.0)
    connect_expression("CTRL_L_jaw_ChinRaiseD", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "jawChinRaiseDL", 0.0,
                       1.0)
    connect_expression("CTRL_R_jaw_ChinRaiseD", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "jawChinRaiseDR", 0.0,
                       1.0)
    # chin compress
    connect_expression("CTRL_L_jaw_chinCompress", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "jawChinCompressL", 0.0,
                       1.0)
    connect_expression("CTRL_R_jaw_chinCompress", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "jawChinCompressR", 0.0,
                       1.0)
    # jaw open extreme
    connect_expression("CTRL_C_jaw_openExtreme", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "jawOpenExtreme", 0.0,
                       1.0)
    # neck stretch
    connect_expression("CTRL_L_neck_stretch", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "neckStretchL", 0.0, 1.0)
    connect_expression("CTRL_R_neck_stretch", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "neckStretchR", 0.0, 1.0)
    # swallow
    cmds_set_driven_keyframe("CTRL_expressions.neckSwallowPh1", itt="linear", ott="linear",
                             currentDriver="CTRL_C_neck_swallow.ty", driverValue=0, value=0)
    cmds_set_driven_keyframe("CTRL_expressions.neckSwallowPh1", itt="linear", ott="linear",
                             currentDriver="CTRL_C_neck_swallow.ty", driverValue=0.2, value=1)
    cmds_set_driven_keyframe("CTRL_expressions.neckSwallowPh1", itt="linear", ott="linear",
                             currentDriver="CTRL_C_neck_swallow.ty", driverValue=0.4, value=0)
    cmds_set_driven_keyframe("CTRL_expressions.neckSwallowPh2", itt="linear", ott="linear",
                             currentDriver="CTRL_C_neck_swallow.ty", driverValue=0.2, value=0)
    cmds_set_driven_keyframe("CTRL_expressions.neckSwallowPh2", itt="linear", ott="linear",
                             currentDriver="CTRL_C_neck_swallow.ty", driverValue=0.4, value=1)
    cmds_set_driven_keyframe("CTRL_expressions.neckSwallowPh2", itt="linear", ott="linear",
                             currentDriver="CTRL_C_neck_swallow.ty", driverValue=0.6, value=0)
    cmds_set_driven_keyframe("CTRL_expressions.neckSwallowPh3", itt="linear", ott="linear",
                             currentDriver="CTRL_C_neck_swallow.ty", driverValue=0.4, value=0)
    cmds_set_driven_keyframe("CTRL_expressions.neckSwallowPh3", itt="linear", ott="linear",
                             currentDriver="CTRL_C_neck_swallow.ty", driverValue=0.6, value=1)
    cmds_set_driven_keyframe("CTRL_expressions.neckSwallowPh3", itt="linear", ott="linear",
                             currentDriver="CTRL_C_neck_swallow.ty", driverValue=0.8, value=0)
    cmds_set_driven_keyframe("CTRL_expressions.neckSwallowPh4", itt="linear", ott="linear",
                             currentDriver="CTRL_C_neck_swallow.ty", driverValue=0.6, value=0)
    cmds_set_driven_keyframe("CTRL_expressions.neckSwallowPh4", itt="linear", ott="linear",
                             currentDriver="CTRL_C_neck_swallow.ty", driverValue=0.8, value=1)
    cmds_set_driven_keyframe("CTRL_expressions.neckSwallowPh4", itt="linear", ott="linear",
                             currentDriver="CTRL_C_neck_swallow.ty", driverValue=1, value=0)
    # mastoid contract
    connect_expression("CTRL_L_neck_mastoidContract", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions",
                       "neckMastoidContractL", 0.0, 1.0)
    connect_expression("CTRL_R_neck_mastoidContract", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions",
                       "neckMastoidContractR", 0.0, 1.0)
    # throat down/up
    connect_expression("CTRL_neck_throatUpDown", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "neckThroatDown", 0.0,
                       1.0)
    connect_expression("CTRL_neck_throatUpDown", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "neckThroatUp", 0.0,
                       1.0)
    # digastric down/up
    connect_expression("CTRL_neck_digastricUpDown", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "neckDigastricDown",
                       0.0, 1.0)
    connect_expression("CTRL_neck_digastricUpDown", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "neckDigastricUp",
                       0.0, 1.0)
    # exhale/inhale
    connect_expression("CTRL_neck_throatExhaleInhale", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions",
                       "neckThroatExhale", 0.0, 1.0)
    connect_expression("CTRL_neck_throatExhaleInhale", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions",
                       "neckThroatInhale",
                       0.0, 1.0)
    # upper teeth
    connect_expression("CTRL_C_teethU", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "teethUpU", 0.0, 1.0)
    connect_expression("CTRL_C_teethU", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "teethDownU", 0.0, 1.0)
    connect_expression("CTRL_C_teethU", "tx", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "teethLeftU", 0.0, 1.0)
    connect_expression("CTRL_C_teethU", "tx", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "teethRightU", 0.0, 1.0)
    connect_expression("CTRL_C_teeth_fwdBackU", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "teethBackU", 0.0, 1.0)
    connect_expression("CTRL_C_teeth_fwdBackU", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "teethFwdU", 0.0, 1.0)
    # lower teeth
    connect_expression("CTRL_C_teethD", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "teethUpD", 0.0, 1.0)
    connect_expression("CTRL_C_teethD", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "teethDownD", 0.0, 1.0)
    connect_expression("CTRL_C_teethD", "tx", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "teethLeftD", 0.0, 1.0)
    connect_expression("CTRL_C_teethD", "tx", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "teethRightD", 0.0, 1.0)
    connect_expression("CTRL_C_teeth_fwdBackD", "ty", -1.0, 1.0, 0.0, 1.0, "CTRL_expressions", "teethBackD", 0.0, 1.0)
    connect_expression("CTRL_C_teeth_fwdBackD", "ty", -1.0, 1.0, 0.0, -1.0, "CTRL_expressions", "teethFwdD", 0.0, 1.0)

    # look at switch
    cmds_add_attr("CTRL_expressions", longName="lookAtSwitch", attributeType="float", defaultValue=0.0, minValue=0.0,
                  maxValue=1.0, keyable=1)
    connect_expression("CTRL_lookAtSwitch", "ty", 0.0, 1.0, 0.0, 1.0, "CTRL_expressions", "lookAtSwitch", 0.0, 1.0)


# ****************************************************************************************************
def eyes_setup():
    """
    This method would create proper eys setup meaning that it would connect GUI controls
    with raw controls for look expressions.
    """

    jntEyeL = "FACIAL_L_Eye"
    locEyeL = "LOC_L_eyeDriver"
    locUIEyeL = "LOC_L_eyeUIDriver"
    locAimEyeL = "LOC_L_eyeAimDriver"
    locAimUpL = "LOC_L_eyeAimUp"
    offGrpEyeL = "GRP_L_eyeAim"
    ctrlEyeL = "CTRL_L_eyeAim"
    ctrlUIEyeL = "CTRL_L_eye"

    jntEyeR = "FACIAL_R_Eye"
    locEyeR = "LOC_R_eyeDriver"
    locUIEyeR = "LOC_R_eyeUIDriver"
    locAimEyeR = "LOC_R_eyeAimDriver"
    locAimUpR = "LOC_R_eyeAimUp"
    offGrpEyeR = "GRP_R_eyeAim"
    ctrlEyeR = "CTRL_R_eyeAim"
    ctrlUIEyeR = "CTRL_R_eye"

    ctrlUIEyeC = "CTRL_C_eye"
    jntFacialRoot = "FACIAL_C_FacialRoot"
    attrAimAt = "CTRL_expressions.lookAtSwitch"
    offGrp = "GRP_C_eyesAim"
    ctrl = "CTRL_C_eyesAim"
    locEyeRoot = "LOC_C_eyeDriver"

    eye_setup(jntEyeL, locEyeL, locUIEyeL, locAimEyeL, ctrlEyeL, ctrlUIEyeL, attrAimAt, ctrlUIEyeC, locEyeRoot,
              locAimUpL)
    eye_setup(jntEyeR, locEyeR, locUIEyeR, locAimEyeR, ctrlEyeR, ctrlUIEyeR, attrAimAt, ctrlUIEyeC, locEyeRoot,
              locAimUpR)

    # create visibility switch
    cmds_set_driven_keyframe(f"{offGrp}.visibility", itt="linear", ott="linear", currentDriver=attrAimAt,
                             driverValue=0,
                             value=0)
    cmds_set_driven_keyframe(f"{offGrp}.visibility", itt="linear", ott="linear", currentDriver=attrAimAt,
                             driverValue=1,
                             value=1)

    # connect convergence attribute
    current_tzl = cmds_get_attr(f"{offGrpEyeL}.tz")
    current_tzr = cmds_get_attr(f"{offGrpEyeR}.tz")
    cmds_set_driven_keyframe(f"{offGrpEyeL}.tz", itt="linear", ott="linear",
                             currentDriver="CTRL_convergenceSwitch.ty", driverValue=0, value=current_tzl)
    cmds_set_driven_keyframe(f"{offGrpEyeL}.tz", itt="linear", ott="linear",
                             currentDriver="CTRL_convergenceSwitch.ty", driverValue=1, value=0)
    cmds_set_driven_keyframe(f"{offGrpEyeR}.tz", itt="linear", ott="linear",
                             currentDriver="CTRL_convergenceSwitch.ty", driverValue=0, value=current_tzr)
    cmds_set_driven_keyframe(f"{offGrpEyeR}.tz", itt="linear", ott="linear",
                             currentDriver="CTRL_convergenceSwitch.ty", driverValue=1, value=0)

    # look direction splines
    cmds_curve(degree=1, point=([0, 0, 0], [0, 0, 0]), knot=(0, 1), name="L_lookDirection")
    cmds_set_attr("L_lookDirection.overrideEnabled", 1)
    cmds_set_attr("L_lookDirection.overrideColor", 1)
    cmds_set_attr("L_lookDirection.overrideDisplayType", 2)
    cmds_curve(degree=1, point=([0, 0, 0], [0, 0, 0]), knot=(0, 1), name="R_lookDirection")
    cmds_set_attr("R_lookDirection.overrideEnabled", 1)
    cmds_set_attr("R_lookDirection.overrideColor", 1)
    cmds_set_attr("R_lookDirection.overrideDisplayType", 2)

    cmds_select("L_lookDirection.cv[0]", r=True)
    cmds_cluster(name="L_lookDirStart")
    cmds_set_attr("L_lookDirStartHandle.visibility", 0)
    cmds_select("L_lookDirection.cv[1]", r=True)
    cmds_cluster(name="L_lookDirEnd")
    cmds_set_attr("L_lookDirEndHandle.visibility", 0)
    cmds_select("R_lookDirection.cv[0]", r=True)
    cmds_cluster(name="R_lookDirStart")
    cmds_set_attr("R_lookDirStartHandle.visibility", 0)
    cmds_select("R_lookDirection.cv[1]", r=True)
    cmds_cluster(name="R_lookDirEnd")
    cmds_set_attr("R_lookDirEndHandle.visibility", 0)

    cmds_point_constraint(jntEyeL, "L_lookDirStartHandle")
    cmds_point_constraint(ctrlEyeL, "L_lookDirEndHandle")
    cmds_point_constraint(jntEyeR, "R_lookDirStartHandle")
    cmds_point_constraint(ctrlEyeR, "R_lookDirEndHandle")

    # create look direction splines visibility switch
    cmds_set_driven_keyframe("L_lookDirection.visibility", itt="linear", ott="linear", currentDriver=attrAimAt,
                             driverValue=0, value=0)
    cmds_set_driven_keyframe("L_lookDirection.visibility", itt="linear", ott="linear", currentDriver=attrAimAt,
                             driverValue=1, value=1)
    cmds_set_driven_keyframe("R_lookDirection.visibility", itt="linear", ott="linear", currentDriver=attrAimAt,
                             driverValue=0, value=0)
    cmds_set_driven_keyframe("R_lookDirection.visibility", itt="linear", ott="linear", currentDriver=attrAimAt,
                             driverValue=1, value=1)


# ****************************************************************************************************
def eye_setup(jnt_eye, loc_eye, loc_ui_eye, loc_aim_eye, ctrl_eye, ctrl_ui_eye, attr_aim_at, ctrl_ui_eye_c,
              loc_eye_root, loc_aim_up):
    """
    Setup for one eye.
    """

    jnt_pos = cmds_xform(jnt_eye, query=True, worldSpace=True, translation=True)

    # position and create locators
    cmds_xform(loc_eye, worldSpace=True, absolute=True, translation=jnt_pos)

    cmds_space_locator(name=loc_ui_eye)
    cmds_xform(loc_ui_eye, worldSpace=True, absolute=True, translation=jnt_pos)
    cmds_set_attr(f"{loc_ui_eye}.visibility", 0)
    cmds_parent(loc_ui_eye, loc_eye_root)
    cmds_set_attr(f"{loc_ui_eye}.rx", 0.0)
    cmds_set_attr(f"{loc_ui_eye}.ry", 0.0)
    cmds_set_attr(f"{loc_ui_eye}.rz", 0.0)

    cmds_space_locator(name=loc_aim_eye)
    cmds_xform(loc_aim_eye, worldSpace=True, absolute=True, translation=jnt_pos)
    cmds_set_attr(f"{loc_aim_eye}.visibility", 0)
    cmds_parent(loc_aim_eye, loc_eye_root)
    cmds_set_attr(f"{loc_aim_eye}.rx", 0.0)
    cmds_set_attr(f"{loc_aim_eye}.ry", 0.0)
    cmds_set_attr(f"{loc_aim_eye}.rz", 0.0)

    # connect aim loc
    cmds_aim_constraint(ctrl_eye, loc_aim_eye, mo=True, weight=1, aimVector=[0, 0, 1], upVector=[0, 1, 0],
                        worldUpType="object", worldUpObject=loc_aim_up)
    orient_list = cmds_orient_constraint(loc_aim_eye, loc_eye)
    orient_aim_con = ""
    if orient_list and len(orient_list) > 0:
        orient_aim_con = orient_list[0]

    # connect ui loc to L/R control
    cmds_set_driven_keyframe(f"{loc_ui_eye}.ry", itt="linear", ott="linear", currentDriver=f"{ctrl_ui_eye}.tx",
                             driverValue=0, value=0)
    cmds_set_driven_keyframe(f"{loc_ui_eye}.ry", itt="linear", ott="linear", currentDriver=f"{ctrl_ui_eye}.tx",
                             driverValue=1, value=40)
    cmds_set_driven_keyframe(f"{loc_ui_eye}.ry", itt="linear", ott="linear", currentDriver=f"{ctrl_ui_eye}.tx",
                             driverValue=-1, value=-40)

    cmds_set_driven_keyframe(f"{loc_ui_eye}.rx", itt="linear", ott="linear", currentDriver=f"{ctrl_ui_eye}.ty",
                             driverValue=0, value=0)
    cmds_set_driven_keyframe(f"{loc_ui_eye}.rx", itt="linear", ott="linear", currentDriver=f"{ctrl_ui_eye}.ty",
                             driverValue=1, value=-30)
    cmds_set_driven_keyframe(f"{loc_ui_eye}.rx", itt="linear", ott="linear", currentDriver=f"{ctrl_ui_eye}.ty",
                             driverValue=-1, value=40)

    # connect ui loc to C control
    cmds_set_driven_keyframe(f"{loc_ui_eye}.ry", itt="linear", ott="linear", currentDriver=f"{ctrl_ui_eye_c}.tx",
                             driverValue=0, value=0)
    cmds_set_driven_keyframe(f"{loc_ui_eye}.ry", itt="linear", ott="linear", currentDriver=f"{ctrl_ui_eye_c}.tx",
                             driverValue=1, value=40)
    cmds_set_driven_keyframe(f"{loc_ui_eye}.ry", itt="linear", ott="linear", currentDriver=f"{ctrl_ui_eye_c}.tx",
                             driverValue=-1, value=-40)

    cmds_set_driven_keyframe(f"{loc_ui_eye}.rx", itt="linear", ott="linear", currentDriver=f"{ctrl_ui_eye_c}.ty",
                             driverValue=0, value=0)
    cmds_set_driven_keyframe(f"{loc_ui_eye}.rx", itt="linear", ott="linear", currentDriver=f"{ctrl_ui_eye_c}.ty",
                             driverValue=1, value=-30)
    cmds_set_driven_keyframe(f"{loc_ui_eye}.rx", itt="linear", ott="linear", currentDriver=f"{ctrl_ui_eye_c}.ty",
                             driverValue=-1, value=40)

    constraint_list = cmds_orient_constraint(loc_ui_eye, loc_eye)
    orient_ui_con = ""
    if constraint_list and len(constraint_list) > 0:
        orient_ui_con = constraint_list[0]

    # create aim at switch
    cmds_set_driven_keyframe(f"{orient_aim_con}.{loc_aim_eye}W0", itt="linear", ott="linear",
                             currentDriver=attr_aim_at,
                             driverValue=0, value=0)
    cmds_set_driven_keyframe(f"{orient_aim_con}.{loc_aim_eye}W0", itt="linear", ott="linear",
                             currentDriver=attr_aim_at,
                             driverValue=1, value=1)
    cmds_set_driven_keyframe(f"{orient_ui_con}.{loc_ui_eye}W1", itt="linear", ott="linear",
                             currentDriver=attr_aim_at,
                             driverValue=0, value=1)
    cmds_set_driven_keyframe(f"{orient_ui_con}.{loc_ui_eye}W1", itt="linear", ott="linear",
                             currentDriver=attr_aim_at,
                             driverValue=1, value=0)


# ****************************************************************************************************
def clean_up():
    """
    This method is responsible for hierarchical organization of objects in the scene.
    """

    # deleting layers
    layers = ["sculpted_layer", "corrective_layer", "joints_layer",
              "head_mesh_layer", "teeth_mesh_layer", "saliva_mesh_layer", "eyeLeft_mesh_layer", "eyeRight_mesh_layer",
              "eyeshell_mesh_layer", "eyelashes_mesh_layer", "eyeEdge_mesh_layer", "cartilage_mesh_layer",
              "headMatchPass1_mesh_layer", "headMatchPass2_mesh_layer", "headMatchPass3_mesh_layer",
              "head_lod1_mesh_layer", "teeth_lod1_mesh_layer", "saliva_lod1_mesh_layer", "eyeLeft_lod1_mesh_layer",
              "eyeRight_lod1_mesh_layer", "eyeshell_lod1_mesh_layer", "eyelashes_lod1_mesh_layer",
              "eyeEdge_lod1_mesh_layer", "cartilage_lod1_mesh_layer",
              "head_lod2_mesh_layer", "teeth_lod2_mesh_layer", "saliva_lod2_mesh_layer", "eyeLeft_lod2_mesh_layer",
              "eyeRight_lod2_mesh_layer", "eyeshell_lod2_mesh_layer", "eyelashes_lod2_mesh_layer",
              "eyeEdge_lod2_mesh_layer",
              "head_lod3_mesh_layer", "teeth_lod3_mesh_layer", "eyeLeft_lod3_mesh_layer", "eyeRight_lod3_mesh_layer",
              "eyeshell_lod3_mesh_layer", "eyelashes_lod3_mesh_layer", "eyeEdge_lod3_mesh_layer",
              "head_lod4_mesh_layer", "teeth_lod4_mesh_layer", "eyeLeft_lod4_mesh_layer", "eyeRight_lod4_mesh_layer",
              "eyeshell_lod4_mesh_layer",
              "head_lod5_mesh_layer", "teeth_lod5_mesh_layer", "eyeLeft_lod5_mesh_layer", "eyeRight_lod5_mesh_layer",
              "head_lod6_mesh_layer", "teeth_lod6_mesh_layer", "eyeLeft_lod6_mesh_layer", "eyeRight_lod6_mesh_layer",
              "head_lod7_mesh_layer", "teeth_lod7_mesh_layer", "eyeLeft_lod7_mesh_layer", "eyeRight_lod7_mesh_layer"]

    for layer in layers:
        if cmds.objExists(layer):
            cmds_delete(layer)

    # making groups and hierarchy
    cmds_group(world=True, empty=True, name="head_grp")
    cmds_group(parent="head_grp", empty=True, name="geometry_grp")
    cmds_group(parent="head_grp", empty=True, name="headRig_grp")
    cmds_group(parent="headRig_grp", empty=True, name="headRigging_grp")
    cmds_group(parent="headRig_grp", empty=True, name="headGui_grp")
    cmds_group(parent="headRigging_grp", empty=True, name="eyesSetup_grp")

    cmds_group(parent="head_grp", empty=True, name="morphs_grp")
    cmds_set_attr("morphs_grp.visibility", 0)
    if cmds.ls("corrective_*"):
        cmds_parent("corrective_*", "morphs_grp")
    cmds_delete("morphs_grp")

    if both_guis_loaded():
        cmds_parent("GRP_C_eyesAim", "headGui_grp")  # eyes aim GUI
        cmds_parent("GRP_faceGUI", "headGui_grp")  # 2D GUI
        # look direction clusters and splines
        look_dir_cmds = cmds.ls("*lookDir*")
        for cmd in look_dir_cmds:
            obj_type = cmds.objectType(cmd).strip()
            if obj_type not in ("clusterHandle", "cluster", "animCurveUU"):
                cmds_parent(cmd, "eyesSetup_grp")
        cmds_parent("LOC_C_eyeDriver", "eyesSetup_grp")  # eyes setup
        cmds_parent_constraint(["FACIAL_C_FacialRoot", "LOC_C_eyeDriver"], maintainOffset=True)
        cmds_parent("spine_04", "head_grp")
        cmds_delete("gui")
        cmds_delete("analog_gui")

    # LODs hierarchy
    cmds_group(parent="geometry_grp", empty=True, name="head_lod0_grp")
    cmds_group(parent="geometry_grp", empty=True, name="head_lod1_grp")
    cmds_group(parent="geometry_grp", empty=True, name="head_lod2_grp")
    cmds_group(parent="geometry_grp", empty=True, name="head_lod3_grp")
    cmds_group(parent="geometry_grp", empty=True, name="head_lod4_grp")
    cmds_group(parent="geometry_grp", empty=True, name="head_lod5_grp")
    cmds_group(parent="geometry_grp", empty=True, name="head_lod6_grp")
    cmds_group(parent="geometry_grp", empty=True, name="head_lod7_grp")

    cmds_select(clear=True)
    cmds_select("head_lod7_grp", replace=True)
    cmds.createDisplayLayer(name="head_lod7_layer", noRecurse=True)
    cmds_set_attr("head_lod7_layer.visibility", 0)
    cmds_select("head_lod6_grp", replace=True)
    cmds.createDisplayLayer(name="head_lod6_layer", noRecurse=True)
    cmds_set_attr("head_lod6_layer.visibility", 0)
    cmds_select("head_lod5_grp", replace=True)
    cmds.createDisplayLayer(name="head_lod5_layer", noRecurse=True)
    cmds_set_attr("head_lod5_layer.visibility", 0)
    cmds_select("head_lod4_grp", replace=True)
    cmds.createDisplayLayer(name="head_lod4_layer", noRecurse=True)
    cmds_set_attr("head_lod4_layer.visibility", 0)
    cmds_select("head_lod3_grp", replace=True)
    cmds.createDisplayLayer(name="head_lod3_layer", noRecurse=True)
    cmds_set_attr("head_lod3_layer.visibility", 0)
    cmds_select("head_lod2_grp", replace=True)
    cmds.createDisplayLayer(name="head_lod2_layer", noRecurse=True)
    cmds_set_attr("head_lod2_layer.visibility", 0)
    cmds_select("head_lod1_grp", replace=True)
    cmds.createDisplayLayer(name="head_lod1_layer", noRecurse=True)
    cmds_set_attr("head_lod1_layer.visibility", 0)
    cmds_select("head_lod0_grp", replace=True)
    cmds.createDisplayLayer(name="head_lod0_layer", noRecurse=True)
    cmds_set_attr("head_lod0_layer.visibility", 1)
    cmds_select(clear=True)

    # LOD 0
    cmds_parent("head_lod0_mesh", "head_lod0_grp")
    cmds_parent("teeth_lod0_mesh", "head_lod0_grp")
    cmds_parent("saliva_lod0_mesh", "head_lod0_grp")
    cmds_parent("eyeLeft_lod0_mesh", "head_lod0_grp")
    cmds_parent("eyeRight_lod0_mesh", "head_lod0_grp")
    cmds_parent("eyeshell_lod0_mesh", "head_lod0_grp")
    cmds_parent("eyelashes_lod0_mesh", "head_lod0_grp")
    cmds_parent("eyeEdge_lod0_mesh", "head_lod0_grp")
    cmds_parent("cartilage_lod0_mesh", "head_lod0_grp")
    # LOD 1
    cmds_parent("head_lod1_mesh", "head_lod1_grp")
    cmds_parent("teeth_lod1_mesh", "head_lod1_grp")
    cmds_parent("saliva_lod1_mesh", "head_lod1_grp")
    cmds_parent("eyeLeft_lod1_mesh", "head_lod1_grp")
    cmds_parent("eyeRight_lod1_mesh", "head_lod1_grp")
    cmds_parent("eyeshell_lod1_mesh", "head_lod1_grp")
    cmds_parent("eyelashes_lod1_mesh", "head_lod1_grp")
    cmds_parent("eyeEdge_lod1_mesh", "head_lod1_grp")
    cmds_parent("cartilage_lod1_mesh", "head_lod1_grp")
    # LOD 2
    cmds_parent("head_lod2_mesh", "head_lod2_grp")
    cmds_parent("teeth_lod2_mesh", "head_lod2_grp")
    cmds_parent("saliva_lod2_mesh", "head_lod2_grp")
    cmds_parent("eyeLeft_lod2_mesh", "head_lod2_grp")
    cmds_parent("eyeRight_lod2_mesh", "head_lod2_grp")
    cmds_parent("eyeshell_lod2_mesh", "head_lod2_grp")
    cmds_parent("eyelashes_lod2_mesh", "head_lod2_grp")
    cmds_parent("eyeEdge_lod2_mesh", "head_lod2_grp")
    # LOD 3
    cmds_parent("head_lod3_mesh", "head_lod3_grp")
    cmds_parent("teeth_lod3_mesh", "head_lod3_grp")
    cmds_parent("eyeLeft_lod3_mesh", "head_lod3_grp")
    cmds_parent("eyeRight_lod3_mesh", "head_lod3_grp")
    cmds_parent("eyeshell_lod3_mesh", "head_lod3_grp")
    cmds_parent("eyelashes_lod3_mesh", "head_lod3_grp")
    cmds_parent("eyeEdge_lod3_mesh", "head_lod3_grp")
    # LOD 4
    cmds_parent("head_lod4_mesh", "head_lod4_grp")
    cmds_parent("teeth_lod4_mesh", "head_lod4_grp")
    cmds_parent("eyeLeft_lod4_mesh", "head_lod4_grp")
    cmds_parent("eyeRight_lod4_mesh", "head_lod4_grp")
    cmds_parent("eyeshell_lod4_mesh", "head_lod4_grp")
    # LOD 5
    cmds_parent("head_lod5_mesh", "head_lod5_grp")
    cmds_parent("teeth_lod5_mesh", "head_lod5_grp")
    cmds_parent("eyeLeft_lod5_mesh", "head_lod5_grp")
    cmds_parent("eyeRight_lod5_mesh", "head_lod5_grp")
    # LOD 6
    cmds_parent("head_lod6_mesh", "head_lod6_grp")
    cmds_parent("teeth_lod6_mesh", "head_lod6_grp")
    cmds_parent("eyeLeft_lod6_mesh", "head_lod6_grp")
    cmds_parent("eyeRight_lod6_mesh", "head_lod6_grp")
    # LOD 7
    cmds_parent("head_lod7_mesh", "head_lod7_grp")
    cmds_parent("teeth_lod7_mesh", "head_lod7_grp")
    cmds_parent("eyeLeft_lod7_mesh", "head_lod7_grp")
    cmds_parent("eyeRight_lod7_mesh", "head_lod7_grp")

    if gui_loaded():
        # CTRL_expressions visibility
        cmds_set_attr("CTRL_expressions.visibility", keyable=True, lock=False)
        cmds_set_attr("CTRL_expressions.visibility", 0)
        cmds_set_attr("CTRL_expressions.visibility", lock=True, keyable=False, channelBox=False)

    # containers
    cmds.container(name="PSD")
    containers = cmds.ls("*_CONTAINER")
    for container in containers:
        cmds.container("PSD", e=True, addNode=container)

    # deleting body joints animation
    body_joints = ["spine_04", "spine_05", "clavicle_l", "upperarm_l", "upperarm_correctiveRoot_l", "upperarm_out_l",
                  "upperarm_fwd_l", "upperarm_in_l", "upperarm_bck_l", "clavicle_out_l", "clavicle_scap_l",
                  "clavicle_r", "upperarm_r", "upperarm_correctiveRoot_r", "upperarm_out_r", "upperarm_fwd_r",
                  "upperarm_in_r", "upperarm_bck_r", "clavicle_out_r", "clavicle_scap_r", "clavicle_pec_l",
                  "clavicle_pec_r", "spine_04_latissimus_l", "spine_04_latissimus_r", "neck_01", "neck_02", "head"]
    for joint in body_joints:
        try:
            cmds.delete(f"{joint}_scaleX", f"{joint}_scaleY", f"{joint}_scaleZ", f"{joint}_translateX",
                        f"{joint}_translateY", f"{joint}_translateZ", f"{joint}_rotateX", f"{joint}_rotateY",
                        f"{joint}_rotateZ")
        except:
            pass

    # far and near clip plane
    cmds_set_attr("perspShape.nearClipPlane", 5)
    cmds_set_attr("perspShape.farClipPlane", 5000)


# ****************************************************************************************************
def rename_skin_clusters():
    cmds_rename("head_mesh_skinCluster", "head_lod0_mesh_skinCluster")
    cmds_rename("teeth_mesh_skinCluster", "teeth_lod0_mesh_skinCluster")
    cmds_rename("saliva_mesh_skinCluster", "saliva_lod0_mesh_skinCluster")
    cmds_rename("eyeLeft_mesh_skinCluster", "eyeLeft_lod0_mesh_skinCluster")
    cmds_rename("eyeRight_mesh_skinCluster", "eyeRight_lod0_mesh_skinCluster")
    cmds_rename("eyeshell_mesh_skinCluster", "eyeshell_lod0_mesh_skinCluster")
    cmds_rename("eyelashes_mesh_skinCluster", "eyelashes_lod0_mesh_skinCluster")
    cmds_rename("eyeEdge_mesh_skinCluster", "eyeEdge_lod0_mesh_skinCluster")
    cmds_rename("cartilage_mesh_skinCluster", "cartilage_lod0_mesh_skinCluster")


# ****************************************************************************************************
def connect_neck_correctives():
    """
    This method is used for neck setup. Neck deformations are not only coming from the GUI but also
    from movement of the body. It will connect neck joint rotations with raw controls for corrective blendshapes
    for neck turn expressions.
    """

    cmds_set_attr("CTRL_neckCorrectivesMultiplyerU.translateY", 0.8)
    cmds_set_attr("CTRL_neckCorrectivesMultiplyerM.translateY", 0.5)
    cmds_set_attr("CTRL_neckCorrectivesMultiplyerD.translateY", 0.2)

    cmds_connect_attr("neck_01.rx", "LOC_neck01JointInput.rx")
    cmds_connect_attr("neck_01.ry", "LOC_neck01JointInput.ry")
    cmds_connect_attr("neck_01.rz", "LOC_neck01JointInput.rz")
    cmds_connect_attr("neck_02.rx", "LOC_neck02JointInput.rx")
    cmds_connect_attr("neck_02.ry", "LOC_neck02JointInput.ry")
    cmds_connect_attr("neck_02.rz", "LOC_neck02JointInput.rz")
    cmds_connect_attr("head.rx", "LOC_headJointInput.rx")
    cmds_connect_attr("head.ry", "LOC_headJointInput.ry")
    cmds_connect_attr("head.rz", "LOC_headJointInput.rz")

    cmds_connect_attr("LOC_expListOutputToRL.headTurnUpU", "CTRL_expressions.headTurnUpU")
    cmds_connect_attr("LOC_expListOutputToRL.headTurnUpM", "CTRL_expressions.headTurnUpM")
    cmds_connect_attr("LOC_expListOutputToRL.headTurnUpD", "CTRL_expressions.headTurnUpD")
    cmds_connect_attr("LOC_expListOutputToRL.headTurnDownU", "CTRL_expressions.headTurnDownU")
    cmds_connect_attr("LOC_expListOutputToRL.headTurnDownM", "CTRL_expressions.headTurnDownM")
    cmds_connect_attr("LOC_expListOutputToRL.headTurnDownD", "CTRL_expressions.headTurnDownD")
    cmds_connect_attr("LOC_expListOutputToRL.headTurnLeftU", "CTRL_expressions.headTurnLeftU")
    cmds_connect_attr("LOC_expListOutputToRL.headTurnLeftM", "CTRL_expressions.headTurnLeftM")
    cmds_connect_attr("LOC_expListOutputToRL.headTurnLeftD", "CTRL_expressions.headTurnLeftD")
    cmds_connect_attr("LOC_expListOutputToRL.headTurnRightU", "CTRL_expressions.headTurnRightU")
    cmds_connect_attr("LOC_expListOutputToRL.headTurnRightM", "CTRL_expressions.headTurnRightM")
    cmds_connect_attr("LOC_expListOutputToRL.headTurnRightD", "CTRL_expressions.headTurnRightD")
    cmds_connect_attr("LOC_expListOutputToRL.headTiltLeftU", "CTRL_expressions.headTiltLeftU")
    cmds_connect_attr("LOC_expListOutputToRL.headTiltLeftM", "CTRL_expressions.headTiltLeftM")
    cmds_connect_attr("LOC_expListOutputToRL.headTiltLeftD", "CTRL_expressions.headTiltLeftD")
    cmds_connect_attr("LOC_expListOutputToRL.headTiltRightU", "CTRL_expressions.headTiltRightU")
    cmds_connect_attr("LOC_expListOutputToRL.headTiltRightM", "CTRL_expressions.headTiltRightM")
    cmds_connect_attr("LOC_expListOutputToRL.headTiltRightD", "CTRL_expressions.headTiltRightD")

    cmds_set_attr("GRP_neckSetupGUI.visibility", 0)


# ****************************************************************************************************
def connect_follow_head():  # 2d + aim da prate glavu
    """
    This method would connect switch which will enable user to enable/disable option to GUI and Aim interface to
    follow head rotations.
    """

    cmds_space_locator(name="LOC_world")
    cmds_parent("LOC_world", "headGui_grp")
    cmds_set_attr("LOC_world.rx", 0.0)
    cmds_set_attr("LOC_world.ry", 0.0)
    cmds_set_attr("LOC_world.rz", 0.0)
    cmds_set_attr("LOC_world.visibility", 0)

    cmds_parent_constraint(["head", "GRP_faceGUI"], maintainOffset=True, name="GRP_faceGUI_parentConstraint1")
    cmds_parent_constraint(["LOC_world", "GRP_faceGUI"], maintainOffset=True, name="GRP_faceGUI_parentConstraint1")
    cmds_set_attr("GRP_faceGUI_parentConstraint1.interpType", 0)
    cmds_set_driven_keyframe("GRP_faceGUI_parentConstraint1.LOC_worldW1", itt="linear", ott="linear",
                             currentDriver="CTRL_faceGUIfollowHead.ty", driverValue=0.0, value=1.0)
    cmds_set_driven_keyframe("GRP_faceGUI_parentConstraint1.LOC_worldW1", itt="linear", ott="linear",
                             currentDriver="CTRL_faceGUIfollowHead.ty", driverValue=1.0, value=0.0)
    cmds_set_driven_keyframe("GRP_faceGUI_parentConstraint1.headW0", itt="linear", ott="linear",
                             currentDriver="CTRL_faceGUIfollowHead.ty", driverValue=0.0, value=0.0)
    cmds_set_driven_keyframe("GRP_faceGUI_parentConstraint1.headW0", itt="linear", ott="linear",
                             currentDriver="CTRL_faceGUIfollowHead.ty", driverValue=1.0, value=1.0)

    cmds_parent_constraint(["head", "GRP_C_eyesAim"], maintainOffset=True, name="GRP_C_eyesAim_parentConstraint1")
    cmds_parent_constraint(["LOC_world", "GRP_C_eyesAim"], maintainOffset=True, name="GRP_C_eyesAim_parentConstraint1")
    cmds_set_attr("GRP_C_eyesAim_parentConstraint1.interpType", 0)
    cmds_set_driven_keyframe("GRP_C_eyesAim_parentConstraint1.LOC_worldW1", itt="linear", ott="linear",
                             currentDriver="CTRL_eyesAimFollowHead.ty", driverValue=0.0, value=1.0)
    cmds_set_driven_keyframe("GRP_C_eyesAim_parentConstraint1.LOC_worldW1", itt="linear", ott="linear",
                             currentDriver="CTRL_eyesAimFollowHead.ty", driverValue=1.0, value=0.0)
    cmds_set_driven_keyframe("GRP_C_eyesAim_parentConstraint1.headW0", itt="linear", ott="linear",
                             currentDriver="CTRL_eyesAimFollowHead.ty", driverValue=0.0, value=0.0)
    cmds_set_driven_keyframe("GRP_C_eyesAim_parentConstraint1.headW0", itt="linear", ott="linear",
                             currentDriver="CTRL_eyesAimFollowHead.ty", driverValue=1.0, value=1.0)


# Wrappers around maya functions in order to catch/print errors
def cmds_parent(*args, **kwargs):
    try:
        return cmds.parent(*args, **kwargs)
    except Exception as ex:
        stderr.write(f"Failed to parent. Error: {ex} \n")


def cmds_set_attr(*args, **kwargs):
    try:
        cmds.setAttr(*args, **kwargs)
    except Exception as ex:
        stderr.write(f"Failed to set attribute. Error: {ex} \n")


def cmds_connect_attr(attr1, attr2):
    try:
        cmds.connectAttr(attr1, attr2)
    except Exception as ex:
        stderr.write(f"Failed to connect attributes. Error: {ex} \n")


def cmds_get_attr(attr):
    try:
        return cmds.getAttr(attr)
    except Exception as ex:
        stderr.write(f"Failed to get attribute. Error: {ex} \n")


def cmds_add_attr(*args, **kwargs):
    try:
        return cmds.addAttr(*args, **kwargs)
    except Exception as ex:
        stderr.write(f"Failed to add attribute. Error: {ex} \n")


def cmds_xform(*args, **kwargs):
    try:
        return cmds.xform(*args, **kwargs)
    except Exception as ex:
        stderr.write(f"Transformation failed. Error: {ex} \n")


def cmds_space_locator(**kwargs):
    try:
        return cmds.spaceLocator(**kwargs)
    except Exception as ex:
        stderr.write(f"Setting locator failed. Error: {ex} \n")


def cmds_delete(*args):
    try:
        cmds.delete(*args)
    except Exception as ex:
        stderr.write(f"Deletion failed. Error: {ex} \n")


def cmds_set_driven_keyframe(*args, **kwargs):
    try:
        cmds.setDrivenKeyframe(*args, **kwargs)
    except Exception as ex:
        stderr.write(f"Setting driven keyframe failed. Error: {ex} \n")


def cmds_rename(old_name, new_name):
    try:
        cmds.rename(old_name, new_name)
    except Exception as ex:
        stderr.write(f"Renaming failed. Error: {ex} \n")


def cmds_select(*args, **kwargs):
    try:
        cmds.select(*args, **kwargs)
    except Exception as ex:
        stderr.write(f"Select command failed. Error: {ex} \n")


def cmds_cluster(**kwargs):
    try:
        cmds.cluster(**kwargs)
    except Exception as ex:
        stderr.write(f"Cluster command failed. Error: {ex} \n")


def cmds_curve(**kwargs):
    try:
        cmds.curve(**kwargs)
    except Exception as ex:
        stderr.write(f"Curve command failed. Error: {ex} \n")


def cmds_parent_constraint(*args, **kwargs):
    try:
        cmds.parentConstraint(*args, **kwargs)
    except Exception as ex:
        stderr.write(f"Parent constraint command failed. Error: {ex} \n")


def cmds_aim_constraint(*args, **kwargs):
    try:
        cmds.aimConstraint(*args, **kwargs)
    except Exception as ex:
        stderr.write(f"Aim constraint command failed. Error: {ex} \n")


def cmds_orient_constraint(*args, **kwargs):
    try:
        return cmds.orientConstraint(*args, **kwargs)
    except Exception as ex:
        stderr.write(f"Orient constraint command failed. Error: {ex} \n")


def cmds_point_constraint(target, object):
    try:
        cmds.pointConstraint(target, object)
    except Exception as ex:
        stderr.write(f"Point constraint command failed. Error: {ex} \n")


def cmds_group(**kwargs):
    try:
        cmds.group(**kwargs)
    except Exception as ex:
        stderr.write(f"Group command failed. Error: {ex} \n")

def cmds_exists(*args, **kwargs):
    try:
        return cmds.objExists(*args, **kwargs)
    except Exception as ex:
        stderr.write(f"Failed to parent. Error: {ex} \n")