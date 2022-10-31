# Generate a Version.h file populated with the supplied values
#
# Usage:
#   include(VersionHeader)
#   generate_version_header(
#       OUTPUT_FILE "/path/to/lib/include/name/version/Version.h"
#       PREFIX "MYLIB"
#       MAJOR 1
#       MINOR 0
#       PATCH 3)
#
# Module dependencies:
#   CMakeParseArguments

set(VERSION_HEADER_SOURCE_DIR ${CMAKE_CURRENT_LIST_DIR})

function(generate_version_header)
    set(options)
    set(one_value_args OUTPUT_FILE PREFIX MAJOR MINOR PATCH)
    set(multi_value_args)
    cmake_parse_arguments(VERSION "${options}" "${one_value_args}" "${multi_value_args}" ${ARGN})
    configure_file("${VERSION_HEADER_SOURCE_DIR}/VersionHeader.h.in"
                   ${VERSION_OUTPUT_FILE}
                   @ONLY
                   NEWLINE_STYLE LF)
endfunction()