import logging

from maya import cmds, mel

from ..util.error import DNAViewerError


class Shader:
    @staticmethod
    def default_lambert_shader(
        mesh_name: str, character_name: str = None, create_character_node: bool = False
    ) -> None:
        try:
            if create_character_node:
                names = cmds.ls(f"*|{mesh_name}", l=True)
                name = [
                    item for item in names if item.startswith(f"|{character_name}")
                ][0]
                cmds.select(name, r=True)
            else:
                cmds.select(mesh_name, r=True)

            mel.eval("sets -e -forceElement initialShadingGroup")

        except Exception as e:
            logging.error(
                f"Couldn't set lambert shader for mesh {mesh_name}. Reason: {e}"
            )
            raise DNAViewerError(e) from e
