cmake_minimum_required(VERSION 3.13)

################################################
# Project setup
set(DNAC dnacalib)
set(DNAC_VERSION 6.6.0)
# Prevent in-source-tree builds
set(CMAKE_DISABLE_IN_SOURCE_BUILD ON)
# Create compilation database
set(CMAKE_EXPORT_COMPILE_COMMANDS ON CACHE BOOL "" FORCE)

project(DNACalib VERSION ${DNAC_VERSION} LANGUAGES CXX)

set_property(GLOBAL PROPERTY USE_FOLDERS ON)

set(CMAKE_MODULES_ROOT_DIR "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
list(APPEND CMAKE_MODULE_PATH ${CMAKE_MODULES_ROOT_DIR})

include(FetchContent)
function(module_exists module_name)
    include(${module_name} OPTIONAL RESULT_VARIABLE found)
    set("${module_name}_FOUND" ${found} PARENT_SCOPE)
endfunction()

# Make custom cmake modules available
module_exists(CMakeModulesExtra)
if(NOT CMakeModulesExtra_FOUND)
    include(CMakeModulesExtraLoader)
endif()

include(CMakeModulesExtra)
list(APPEND CMAKE_MODULE_PATH ${CMakeModulesExtra_DIRS})

option(READ_ONLY_SOURCE_TREE "Prevent autogeneration of files in source tree" OFF)

################################################
# Generate version information header
if (NOT READ_ONLY_SOURCE_TREE)
    include(VersionHeader)
    generate_version_header(
        OUTPUT_FILE "${CMAKE_CURRENT_SOURCE_DIR}/include/dnacalib/version/Version.h"
        PREFIX "DNAC"
        MAJOR ${PROJECT_VERSION_MAJOR}
        MINOR ${PROJECT_VERSION_MINOR}
        PATCH ${PROJECT_VERSION_PATCH})
endif()

################################################
# Generate export definitions header
if (NOT READ_ONLY_SOURCE_TREE)
    include(Symbols)
    generate_export_definitions(
        OUTPUT_FILE "${CMAKE_CURRENT_SOURCE_DIR}/include/dnacalib/Defs.h"
        EXPORT_ATTR_NAME DNACAPI
        BUILD_SHARED_NAME DNAC_BUILD_SHARED
        USE_SHARED_NAME DNAC_SHARED)
endif()

################################################
# Source code
set(HEADERS
    include/dnacalib/DNACalib.h
    include/dnacalib/Command.h
    include/dnacalib/Defs.h

    include/dnacalib/commands/CalculateMeshLowerLODsCommand.h
    include/dnacalib/commands/ClearBlendShapesCommand.h
    include/dnacalib/commands/CommandSequence.h
    include/dnacalib/commands/ConditionalCommand.h
    include/dnacalib/commands/PruneBlendShapeTargetsCommand.h
    include/dnacalib/commands/RemoveJointAnimationCommand.h
    include/dnacalib/commands/RemoveJointCommand.h
    include/dnacalib/commands/RemoveMeshCommand.h
    include/dnacalib/commands/RenameAnimatedMapCommand.h
    include/dnacalib/commands/RenameBlendShapeCommand.h
    include/dnacalib/commands/RenameJointCommand.h
    include/dnacalib/commands/RenameMeshCommand.h
    include/dnacalib/commands/RotateCommand.h
    include/dnacalib/commands/ScaleCommand.h
    include/dnacalib/commands/SetBlendShapeTargetDeltasCommand.h
    include/dnacalib/commands/SetLODsCommand.h
    include/dnacalib/commands/SetNeutralJointRotationsCommand.h
    include/dnacalib/commands/SetNeutralJointTranslationsCommand.h
    include/dnacalib/commands/SetSkinWeightsCommand.h
    include/dnacalib/commands/SetVertexPositionsCommand.h
    include/dnacalib/commands/TranslateCommand.h
    include/dnacalib/commands/VectorOperations.h

    include/dnacalib/dna/DNACalibDNAReader.h

    include/dnacalib/types/Aliases.h

    include/dnacalib/version/Version.h
    include/dnacalib/version/VersionInfo.h)
set(SOURCES
    src/dnacalib/Command.cpp
    src/dnacalib/CommandImplBase.h
    src/dnacalib/TypeDefs.h

    src/dnacalib/commands/CalculateMeshLowerLODsCommand.cpp
    src/dnacalib/commands/ClearBlendShapesCommand.cpp
    src/dnacalib/commands/CommandSequence.cpp
    src/dnacalib/commands/PruneBlendShapeTargetsCommand.cpp
    src/dnacalib/commands/RemoveJointAnimationCommand.cpp
    src/dnacalib/commands/RemoveJointCommand.cpp
    src/dnacalib/commands/RemoveMeshCommand.cpp
    src/dnacalib/commands/RenameAnimatedMapCommand.cpp
    src/dnacalib/commands/RenameBlendShapeCommand.cpp
    src/dnacalib/commands/RenameJointCommand.cpp
    src/dnacalib/commands/RenameMeshCommand.cpp
    src/dnacalib/commands/RenameResourceCommand.h
    src/dnacalib/commands/RotateCommand.cpp
    src/dnacalib/commands/ScaleCommand.cpp
    src/dnacalib/commands/SetBlendShapeTargetDeltasCommand.cpp
    src/dnacalib/commands/SetLODsCommand.cpp
    src/dnacalib/commands/SetNeutralJointRotationsCommand.cpp
    src/dnacalib/commands/SetNeutralJointTranslationsCommand.cpp
    src/dnacalib/commands/SetSkinWeightsCommand.cpp
    src/dnacalib/commands/SetVertexPositionsCommand.cpp
    src/dnacalib/commands/TranslateCommand.cpp
    src/dnacalib/commands/SupportFactories.h

    src/dnacalib/dna/DNACalibDNAReaderImpl.cpp
    src/dnacalib/dna/DNACalibDNAReaderImpl.h
    src/dnacalib/dna/BaseImpl.h
    src/dnacalib/dna/DenormalizedData.h
    src/dnacalib/dna/DNA.h
    src/dnacalib/dna/LODConstraint.cpp
    src/dnacalib/dna/LODConstraint.h
    src/dnacalib/dna/LODMapping.cpp
    src/dnacalib/dna/LODMapping.h
    src/dnacalib/dna/ReaderImpl.h
    src/dnacalib/dna/SurjectiveMapping.h
    src/dnacalib/dna/WriterImpl.h
    src/dnacalib/dna/filters/AnimatedMapFilter.cpp
    src/dnacalib/dna/filters/AnimatedMapFilter.h
    src/dnacalib/dna/filters/BlendShapeFilter.cpp
    src/dnacalib/dna/filters/BlendShapeFilter.h
    src/dnacalib/dna/filters/JointFilter.cpp
    src/dnacalib/dna/filters/JointFilter.h
    src/dnacalib/dna/filters/MeshFilter.cpp
    src/dnacalib/dna/filters/MeshFilter.h
    src/dnacalib/dna/filters/Remap.h

    src/dnacalib/types/BoundingBox.h
    src/dnacalib/types/Triangle.cpp
    src/dnacalib/types/Triangle.h
    src/dnacalib/types/UVBarycentricMapping.cpp
    src/dnacalib/types/UVBarycentricMapping.h

    src/dnacalib/utils/Algorithm.h
    src/dnacalib/utils/Extd.h
    src/dnacalib/utils/ScopedEnumEx.h

    src/dnacalib/version/VersionInfo.cpp)

################################################
# Add target and build options
option(BUILD_SHARED_LIBS "Build shared libraries" OFF)

set(DNAC_DEFAULT_LIBRARY_TYPE STATIC)

if(BUILD_SHARED_LIBS)
    set(DNAC_DEFAULT_LIBRARY_TYPE SHARED)
endif()

set(DNAC_LIBRARY_TYPE ${DNAC_DEFAULT_LIBRARY_TYPE} CACHE STRING "Build DNACalib as a library of type")
set_property(CACHE DNAC_LIBRARY_TYPE PROPERTY STRINGS STATIC SHARED MODULE)

# Python wrapper builds a shared object (e.g. .pyd, .so), so DNACalib library has to be built with -fPIC flag.
option(DNAC_BUILD_PIC "Build with position independent code" ON)

add_library(${DNAC} ${DNAC_LIBRARY_TYPE})
add_library(DNACalib::dnacalib ALIAS ${DNAC})

set_target_properties(${DNAC} PROPERTIES
    CXX_STANDARD 11
    CXX_STANDARD_REQUIRED NO
    CXX_EXTENSIONS NO
    CXX_VISIBILITY_PRESET hidden
    POSITION_INDEPENDENT_CODE ${DNAC_BUILD_PIC}
    SOURCE_ROOT "${CMAKE_CURRENT_SOURCE_DIR}/src"
    SOVERSION ${PROJECT_VERSION_MAJOR}
    VERSION ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}.${PROJECT_VERSION_PATCH})

if (DNAC_LIBRARY_TYPE STREQUAL SHARED)
    target_compile_definitions(${DNAC} PUBLIC DNAC_SHARED PRIVATE DNAC_BUILD_SHARED)
endif()

include(GNUInstallDirs)

set(DNAC_PUBLIC_INCLUDE_DIRS
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>)

target_include_directories(${DNAC}
    PUBLIC
        ${DNAC_PUBLIC_INCLUDE_DIRS}
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/src)

option(TREAT_WARNINGS_AS_ERRORS "Treat warnings as errors" OFF)
if(MSVC)
    set(CXX_FLAGS /W4 /w14061 /w14062 /w14121 /w14242 /w14245
                /w14254 /w14263 /w14265 /w14266 /w14287 /w14289 /w14296
                /w14302 /w14311 /w14365 /w14388 /w14545 /w14546 /w14547
                /w14549 /w14555 /w14619 /w14640 /w14826 /w14905 /w14906
                /w14928 /w14987 /w14946)
    if(TREAT_WARNINGS_AS_ERRORS)
        list(APPEND CXX_FLAGS /WX)
    endif()
    set(CXX_EXTRA_FLAGS /permissive-)
else()
    set(CXX_FLAGS -Wall -Wextra -Wpedantic)
    if(TREAT_WARNINGS_AS_ERRORS)
        list(APPEND CXX_FLAGS -Werror)
    endif()
    set(CXX_EXTRA_FLAGS -Wcast-align -Wconversion -Wduplicated-branches
                -Wduplicated-cond -Wexit-time-destructors
                -Wglobal-constructors -Wlogical-op -Wmissing-noreturn
                -Wnon-virtual-dtor -Wnull-dereference -Wold-style-cast
                -Woverloaded-virtual -Wshadow -Wsign-conversion -Wunreachable-code
                -Wunused -Wuseless-cast -Wweak-vtables -Wno-unknown-pragmas)
endif()

target_compile_options(${DNAC} PRIVATE "${CXX_FLAGS}")
include(SupportedCompileOptions)
target_supported_compile_options(${DNAC} PRIVATE "${CXX_EXTRA_FLAGS}")


################################################
# Dependencies
include(Dependencies)

set(ADAPTABLE_HEADERS)
foreach(hdr IN LISTS HEADERS)
    list(APPEND ADAPTABLE_HEADERS $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/${hdr}> $<INSTALL_INTERFACE:${hdr}>)
endforeach()

source_group(TREE ${CMAKE_CURRENT_SOURCE_DIR} FILES ${HEADERS} ${SOURCES})
target_sources(${DNAC} PRIVATE ${SOURCES} ${OBJECT_SOURCES} PUBLIC ${ADAPTABLE_HEADERS})
target_link_libraries(${DNAC} PUBLIC ${DNAC_PUBLIC_DEPENDENCIES} PRIVATE ${DNAC_PRIVATE_DEPENDENCIES})

################################################
# VersionInfo
if(WIN32 AND (DNAC_LIBRARY_TYPE STREQUAL SHARED OR DNAC_LIBRARY_TYPE STREQUAL MODULE))
    include(VersionInfo)
    add_version_info(${DNAC}
                     NAME ${PROJECT_NAME}
                     FILENAME "${DNAC}.dll"
                     MAJOR_VERSION ${PROJECT_VERSION_MAJOR}
                     MINOR_VERSION ${PROJECT_VERSION_MINOR}
                     PATCH_VERSION ${PROJECT_VERSION_PATCH}
                     COMPANY_NAME "Epic Games"
                     COPYRIGHT "Copyright Epic Games, Inc. All Rights Reserved.")
endif()

################################################
# Export and install target
include(InstallLibrary)
install_library(${DNAC})

################################################
# Examples
option(DNAC_BUILD_EXAMPLES "Build examples" ON)
if(DNAC_BUILD_EXAMPLES)
    set(COPY_LIB_TO_EXAMPLES OFF)
    if(BUILD_SHARED_LIBS)
        set(COPY_LIB_TO_EXAMPLES ON)
    endif()
    add_subdirectory(examples)
endif()
