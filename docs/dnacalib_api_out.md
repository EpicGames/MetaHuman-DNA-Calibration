# API overview
DNA modification is done through available commands. Each command implements the `run(DNACalibDNAReader* output)` method
that modifies the DNA specified through its argument. To configure the modification that occurs in `run()`, parameters
can be passed through constructor or specific setter methods.
The following documentation is for C++. Currently, there is no Python documentation.

List of all available commands:

## Commands that remove certain parts of DNA:

  - [`RemoveJointAnimationCommand`](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/dnacalib/DNACalib/include/dnacalib/commands/RemoveJointAnimationCommand.h) Removes
animation of joint with given index from the DNA.

  - [`RemoveJointCommand`](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/dnacalib/DNACalib/include/dnacalib/commands/RemoveJointCommand.h) Removes joint with given
index from the DNA.

  - [`RemoveMeshCommand`](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/dnacalib/DNACalib/include/dnacalib/commands/RemoveMeshCommand.h) Removes mesh with given index
from the DNA.

  - [`ClearBlendShapesCommand`](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/dnacalib/DNACalib/include/dnacalib/commands/ClearBlendShapesCommand.h) Clears all blend shape data
from the DNA.

## Commands that rename certain parts of DNA:

  - [`RenameAnimatedMapCommand`](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/dnacalib/DNACalib/include/dnacalib/commands/RenameAnimatedMapCommand.h) Renames animated
map with given index or previous name.

  - [`RenameBlendShapeCommand`](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/dnacalib/DNACalib/include/dnacalib/commands/RenameBlendShapeCommand.h) Renames blendshape
  with given index or previous name.

  - [`RenameJointCommand`](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/dnacalib/DNACalib/include/dnacalib/commands/RenameJointCommand.h) Renames joint with given
index or previous name.

  - [`RenameMeshCommand`](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/dnacalib/DNACalib/include/dnacalib/commands/RenameMeshCommand.h) Renames mesh with given index
or previous name.

## Commands that transform DNA:

  - [`RotateCommand`](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/dnacalib/DNACalib/include/dnacalib/commands/RotateCommand.h) Rotates neutral joints and vertex
positions around given origin.

  - [`ScaleCommand`](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/dnacalib/DNACalib/include/dnacalib/commands/ScaleCommand.h) Scales neutral joints, vertex positions,
and joint and blendshape deltas by a factor. For neutral joints and joint deltas, only translation attributes are scaled.

  - [`TranslateCommand`](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/dnacalib/DNACalib/include/dnacalib/commands/TranslateCommand.h) Translates neutral joints and
vertex positions.

## Commands that modify blendshapes:

  - [`SetBlendShapeTargetDeltasCommand`](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/dnacalib/DNACalib/include/dnacalib/commands/SetBlendShapeTargetDeltasCommand.h)
 Changes blendshape target deltas.

  - [`PruneBlendShapeTargetsCommand`](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/dnacalib/DNACalib/include/dnacalib/commands/PruneBlendShapeTargetsCommand.h)
Prunes blendshape target deltas which are lower than or equal to the specified threshold.

## Commands that change bind pose:

  - [`SetNeutralJointRotationsCommand`](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/dnacalib/DNACalib/include/dnacalib/commands/SetNeutralJointRotationsCommand.h)
Sets new rotation values to neutral joints.

  - [`SetNeutralJointTranslationsCommand`](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/dnacalib/DNACalib/include/dnacalib/commands/SetNeutralJointTranslationsCommand.h)
Sets new translation values to neutral joints.

  - [`SetVertexPositionsCommand`](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/dnacalib/DNACalib/include/dnacalib/commands/SetVertexPositionsCommand.h) Changes
vertex positions values.

## Commands that perform useful calculations or provide additional functionality:

  - [`SetLODsCommand`](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/dnacalib/DNACalib/include/dnacalib/commands/SetLODsCommand.h) Filters DNA so that it only contains
data for specified LODs.

  - [`CalculateMeshLowerLODsCommand`](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/dnacalib/DNACalib/include/dnacalib/commands/CalculateMeshLowerLODsCommand.h)
Recalculates vertex positions for lower LOD meshes of the specified mesh.

  - [`CommandSequence`](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/dnacalib/DNACalib/include/dnacalib/commands/CommandSequence.h) Runs a sequence of commands on
the specified DNA.


A more detailed description of each available command and its methods can be found in
[`DNACalib/include/dnacalib/commands`](https://github.com/EpicGames/MetaHuman-DNA-Calibration/tree/main/dnacalib/DNACalib/include/dnacalib/commands/).