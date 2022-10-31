%module dnacalib

%include <exception.i>
%include <stdint.i>

%include <spyus/Caster.i>
%include <spyus/ArrayView.i>
%include <spyus/Vector3.i>

%import "DNA.i"

%{
#include "dnacalib/Command.h"
#include "dnacalib/Defs.h"
#include "dnacalib/commands/CalculateMeshLowerLODsCommand.h"
#include "dnacalib/commands/ClearBlendShapesCommand.h"
#include "dnacalib/commands/CommandSequence.h"
#include "dnacalib/commands/PruneBlendShapeTargetsCommand.h"
#include "dnacalib/commands/RemoveJointAnimationCommand.h"
#include "dnacalib/commands/RemoveJointCommand.h"
#include "dnacalib/commands/RemoveMeshCommand.h"
#include "dnacalib/commands/RenameAnimatedMapCommand.h"
#include "dnacalib/commands/RenameBlendShapeCommand.h"
#include "dnacalib/commands/RenameJointCommand.h"
#include "dnacalib/commands/RenameMeshCommand.h"
#include "dnacalib/commands/RotateCommand.h"
#include "dnacalib/commands/ScaleCommand.h"
#include "dnacalib/commands/SetBlendShapeTargetDeltasCommand.h"
#include "dnacalib/commands/SetLODsCommand.h"
#include "dnacalib/commands/SetNeutralJointRotationsCommand.h"
#include "dnacalib/commands/SetNeutralJointTranslationsCommand.h"
#include "dnacalib/commands/SetSkinWeightsCommand.h"
#include "dnacalib/commands/SetVertexPositionsCommand.h"
#include "dnacalib/commands/TranslateCommand.h"
#include "dnacalib/commands/VectorOperations.h"
#include "dnacalib/dna/DNACalibDNAReader.h"
#include "dnacalib/types/Aliases.h"
#include "dnacalib/version/VersionInfo.h"
%}

py_list_to_array_view(dnac::ConstArrayView<dnac::Vector3>, SWIG_TYPECHECK_FLOAT_ARRAY)
py_list_to_array_view(dnac::ConstArrayView<float>, SWIG_TYPECHECK_FLOAT_ARRAY)
py_list_to_array_view(dnac::ConstArrayView<std::uint16_t>, SWIG_TYPECHECK_INT16_ARRAY)

array_view_to_py_list(trust::ArrayView);
%apply trust::ArrayView {
    trust::ConstArrayView,
    dnac::ArrayView,
    dnac::ConstArrayView
};

string_view_to_py_string(trust::StringView);
%apply trust::StringView {
    dnac::StringView
};

vector3_typemap(dnac::Vector3);

// Ignore all `add` and `remove` overloads
%rename("$ignore") dnac::CommandSequence::add;
%rename("$ignore") dnac::CommandSequence::remove;
// Selectively enable only one of the overloads
%rename("%s") dnac::CommandSequence::add(Command* command);
%rename("%s") dnac::CommandSequence::remove(Command* command);

%include "dnacalib/Defs.h"
%include "dnacalib/types/Aliases.h"
%include "dnacalib/version/VersionInfo.h"
%include "dnacalib/dna/DNACalibDNAReader.h"
pythonize_unmanaged_type(DNACalibDNAReader, create, destroy)
%include "dnacalib/Command.h"
%include "dnacalib/commands/VectorOperations.h"

%include "dnacalib/commands/CommandSequence.h"
// CommandSequence doesn't take ownership over the provided commands.
// To avoid use-after-free issues, references to the command instances must be kept
// on the Python side as well.
%pythoncode %{
def command_sequence_init(_init):
    def wrapper(self, *args, **kwargs):
        self._commands = []
        _init(self, *args, **kwargs)
    return wrapper

def command_sequence_add(_add):
    def wrapper(self, command):
        self._commands.append(command)
        _add(self, command)
    return wrapper

def command_sequence_remove(_remove):
    def wrapper(self, command):
        self._commands.remove(command)
        _remove(self, command)
    return wrapper

CommandSequence.__init__ = command_sequence_init(CommandSequence.__init__)
CommandSequence.add = command_sequence_add(CommandSequence.add)
CommandSequence.remove = command_sequence_remove(CommandSequence.remove)
%}

%include "dnacalib/commands/CalculateMeshLowerLODsCommand.h"
%include "dnacalib/commands/ClearBlendShapesCommand.h"
%include "dnacalib/commands/PruneBlendShapeTargetsCommand.h"
%include "dnacalib/commands/RemoveJointAnimationCommand.h"
%include "dnacalib/commands/RemoveJointCommand.h"
%include "dnacalib/commands/RemoveMeshCommand.h"
%include "dnacalib/commands/RenameAnimatedMapCommand.h"
%include "dnacalib/commands/RenameBlendShapeCommand.h"
%include "dnacalib/commands/RenameJointCommand.h"
%include "dnacalib/commands/RenameMeshCommand.h"
%include "dnacalib/commands/RotateCommand.h"
%include "dnacalib/commands/ScaleCommand.h"
%include "dnacalib/commands/SetBlendShapeTargetDeltasCommand.h"
%include "dnacalib/commands/SetLODsCommand.h"
%include "dnacalib/commands/SetNeutralJointRotationsCommand.h"
%include "dnacalib/commands/SetNeutralJointTranslationsCommand.h"
%include "dnacalib/commands/SetSkinWeightsCommand.h"
%include "dnacalib/commands/SetVertexPositionsCommand.h"
%include "dnacalib/commands/TranslateCommand.h"
