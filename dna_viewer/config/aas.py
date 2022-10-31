from dataclasses import dataclass, field
from typing import Any, Dict, Optional


@dataclass
class AdditionalAssemblyScript:
    """
    A class used to represent the additional assembly script config

    Attributes
    ----------
    @type path: Optional[str]
    @param path: The location of the script file

    @type module_name: Optional[str]
    @param module_name: The module name to be used

    @type method: str
    @param method: The method that should be called

    @type parameter: Dict[Any, Any]
    @param parameter: The parameters that will be passed as the method arguments
    """

    path: Optional[str] = field(default=None)
    module_name: Optional[str] = field(default=None)
    method: str = "run_after_assemble"
    parameter: Dict[Any, Any] = field(default_factory=dict)
