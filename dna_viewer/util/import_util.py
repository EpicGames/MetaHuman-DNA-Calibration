from importlib.machinery import SourceFileLoader
from importlib.util import module_from_spec, spec_from_loader
from pathlib import Path
from types import ModuleType
from typing import Optional

from ..util.error import DNAViewerError


class Import:
    """
    A utility class containing methods for reading outside python files.
    """

    @staticmethod
    def source_py_file(name: str, path: str) -> Optional[ModuleType]:
        """
        Used for loading a python file, used for additional assembly script.

        @type name: str
        @param name: The name of the module.

        @type path: str
        @param path: The path of the python file.

        @rtype: Optional[ModuleType]
        @returns: The loaded module.
        """

        path_obj = Path(path.strip())
        if (
            path
            and path_obj.exists()
            and path_obj.is_file()
            and path_obj.suffix == ".py"
        ):
            spec = spec_from_loader(name, SourceFileLoader(name, path))
            module = module_from_spec(spec)
            spec.loader.exec_module(module)
            return module
        raise DNAViewerError(f"File {path} is not found!")
