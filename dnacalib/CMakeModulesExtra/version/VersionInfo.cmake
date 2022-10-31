# Generate a Version.rc file populated with the supplied values and add the
# generated file to the target's list of sources
#
# Usage:
#   include(VersionInfo)
#   add_version_info(
#       target_name
#       NAME "Product name"
#       FILENAME "SomeFile.dll"
#       MAJOR_VERSION 1
#       MINOR_VERSION 0
#       PATCH_VERSION 3
#       COMPANY_NAME "Some Company"
#       COPYRIGHT "Copyright notice")
#
# Module dependencies:
#   CMakeParseArguments

set(VERSION_INFO_SOURCE_DIR ${CMAKE_CURRENT_LIST_DIR})

function(add_version_info target_name)
    set(options)
    set(one_value_args NAME
                       FILENAME
                       MAJOR_VERSION
                       MINOR_VERSION
                       PATCH_VERSION
                       COMPANY_NAME
                       COPYRIGHT)
    set(multi_value_args)
    cmake_parse_arguments(VI "${options}" "${one_value_args}" "${multi_value_args}" ${ARGN})

    get_target_property(TARGET_TYPE ${target_name} TYPE)
    if(TARGET_TYPE STREQUAL EXECUTABLE)
        set(VI_TARGET_TYPE 0)
    elseif(TARGET_TYPE STREQUAL SHARED_LIBRARY)
        set(VI_TARGET_TYPE 1)
    elseif(TARGET_TYPE STREQUAL STATIC_LIBRARY)
        set(VI_TARGET_TYPE 2)
    else()
        set(VI_TARGET_TYPE 3)
    endif()

    get_target_property(TARGET_BINARY_DIR ${target_name} BINARY_DIR)
    set(version_output_name "${TARGET_BINARY_DIR}/Version.rc")
    configure_file("${VERSION_INFO_SOURCE_DIR}/Version.rc.in"
                   ${version_output_name}
                   @ONLY)
    target_sources(${target_name} PRIVATE ${version_output_name})

endfunction()