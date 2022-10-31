import logging
from typing import Any

from ..config.character import Character
from ..util.error import DNAViewerError
from ..util.import_util import Import


class AdditionalAssemblyScript:
    """
    A utility class used for running python scripts
    """

    @staticmethod
    def run_additional_assembly_script(config: Character) -> None:
        """
        Runs the additional assembly script using the provided character configuration.

        @type config: Character
        @param config: The character configuration object with the needed settings for running the additional assembly script
        """

        if config.aas:
            logging.info("running after assembly script...")
            AdditionalAssemblyScript.run_script(
                config.aas.module_name,
                config.aas.path,
                config.aas.method,
                config.aas.parameter,
            )

    @staticmethod
    def run_script(
        module_name: str, path: str, method: str, parameter: Any = None
    ) -> None:
        """
        Runs the additional assembly script using the provided parameters.

        @type module_name: str
        @param module_name: The module name that gets loaded

        @type path: str
        @param path: The path where the additional assembly script is located

        @type method: str
        @param method: The name of the method that gets called

        @type parameter: Any
        @param parameter: The parameters that get passed in the method (defaults to None)
        """

        try:
            script = Import.source_py_file(module_name, path)
            script_method = getattr(script, method)
            if parameter:
                script_method(parameter)
            else:
                script_method()
        except Exception as e:
            raise DNAViewerError(f"Can't run aas script. Reason: {e}") from e
