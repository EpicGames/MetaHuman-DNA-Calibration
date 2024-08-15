# Change Log

All notable changes to this project will be documented in this file. This project adheres to [Semantic Versioning](http://semver.org/).


## [1.3.0] - 2024-08-15

### Added
- support for Maya 2024
- support for Python 3.11
- added source code comments to python wrappers

### Fixed
- `CalculateMeshLowerLODsCommand` was rewritten to address edge cases discovered with eyelashes and to handle some common cases of invalid UV data. 
- `RotateCommand` to rotate blend shape target deltas as well.
- `SetBlendShapeTargetDeltasCommand` to allow setting vertex indices as well.
- Swig generated classes are now wrapped instead of being monkey-patched to invoke constructors and destructors (which allows building with newer Swig versions - 4.0.x and 4.1.x).

### Changed
- CMake files to add test cases that execute the example scripts and allow generating bundled archives with CPack. 
- Binaries for embeddedRL4 plugin to be .so files.


## [1.2.0] - 2023-06-30

### Added
- assets (gui.ma, Ada.dna, additional_assemble_script.py) which support MHC 2.x.x releases (UE 5.2 and 5.3)


## [1.1.0] - 2023-04-20

### Added
- support for Maya 2023
- support for Python 3.9
- `RenameAnimatedMapCommand` class to DNACalib API. Command to remove animated maps.
- `RemoveBlendShapeCommand` class to DNACalib API. Command to remove blend shapes.
- `DNA` class to DNAViewer API. This class is used for accessing data in DNA file.
- `rig_build` method to DNAViewer API. Method used for creating maya scene with functional rig. Replacement of method `assemble_rig`.
- `Config` class to DNAViewer API. Configuration class used for `build_meshes`.
- `RigConfig` class to DNAViewer API. Configuration class used for `rig_build`.
- documentation for DNA library.

### Fixed
- `ClearBlendShapesCommand` blend shape channel LODs were not correctly set.
- `RotateCommand` to rotate blend shape target deltas as well.
- `SetBlendShapeTargetDeltasCommand` to allow setting vertex indices as well.

### Changed
- changed signature of `build_meshes`. Method used for creating maya scene with meshes. 
- Simplification of additional assemble script.
- option to pass list of indices to remove in remove commands.

### Removed
- removed method `assemble_rig` from DNAViewer API.
