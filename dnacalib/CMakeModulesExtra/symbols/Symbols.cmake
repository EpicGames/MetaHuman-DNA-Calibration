# Generate header file that contains preprocessor definitions for exporting symbols from shared libraries.
#
# Usage:
#   include(Symbols)
#   generate_export_definitions(
#       OUTPUT_FILE /abs/path/to/include/mylib/Defs.h
#       EXPORT_ATTR_NAME MLAPI
#       BUILD_SHARED_NAME ML_BUILD_SHARED
#       USE_SHARED_NAME ML_SHARED)
#
# Module dependencies:
#   CMakeParseArguments

set(SYMBOLS_SOURCE_DIR ${CMAKE_CURRENT_LIST_DIR})

function(generate_export_definitions)
    set(options)
    set(one_value_args OUTPUT_FILE EXPORT_ATTR_NAME BUILD_SHARED_NAME USE_SHARED_NAME)
    set(multi_value_args)
    cmake_parse_arguments(DEF "${options}" "${one_value_args}" "${multi_value_args}" ${ARGN})
    configure_file("${SYMBOLS_SOURCE_DIR}/Defs.h.in"
                   "${DEF_OUTPUT_FILE}"
                   @ONLY
                   NEWLINE_STYLE LF)
endfunction()
