from typing import Union

from maya.api.OpenMaya import MDagPath, MFnDagNode, MFnTransform, MGlobal, MVector

from ..const.space import OBJECT
from ..util.error import DNAViewerError


class Maya:
    """A utility class used for interfacing with maya transforms"""

    @staticmethod
    def get_element(name: str) -> Union[MDagPath, MFnDagNode]:
        """gets the Union[MDagPath, MFnDagNode] object of the element with the given name

        @type name: str
        @param name: The name of the element to be retrieved

        @rtype: Union[MDagPath, MFnDagNode]
        @returns: A OpenMaya object representing the given element
        """
        try:
            sellist = MGlobal.getSelectionListByName(name)
        except Exception as exception:
            raise DNAViewerError(f"Element with name:{name} not found!") from exception

        try:
            return sellist.getDagPath(0)
        except Exception:
            return sellist.getDependNode(0)

    @staticmethod
    def get_transform(name: str) -> MFnTransform:
        """gets the transform of the element with the given name

        @type element: str
        @param element: The element name that we want the transform of

        @rtype: MFnTransform
        @returns: A MFnTransform object representing the given elements transform
        """
        return MFnTransform(Maya.get_element(name))

    @staticmethod
    def get_translation(element: str, space: int = OBJECT) -> MVector:
        """gets the translation of the element with the given name

        @type element: str
        @param element: The element name that we want the translation of

        @type space: str
        @param space: A string value representing the translation space (default is "world")

        @rtype: MVector
        @returns: A MVector object representing the given elements translation
        """
        return MFnTransform(Maya.get_element(element)).translation(space)

    @staticmethod
    def set_translation(
        element: str, translation: MVector, space: int = OBJECT
    ) -> None:
        """sets the translation of the element with the given name

        @type element: str
        @param element: The element name that we want to set the translation of

        @type translation: MVector
        @param translation: The new translation value

        @type space: str
        @param space: A string value representing the translation space (default is "object")
        """
        element_obj = Maya.get_transform(element)
        element_obj.setTranslation(translation, space)
