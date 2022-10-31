cmake_minimum_required(VERSION 3.14)

################################################
# Project setup
set(SPYUS spyus)
set(SPYUS_VERSION 1.2.0)

# Prevent in-source-tree builds
set(CMAKE_DISABLE_IN_SOURCE_BUILD ON)
# Create compilation database
set(CMAKE_EXPORT_COMPILE_COMMANDS ON CACHE BOOL "" FORCE)

project(Spyus VERSION ${SPYUS_VERSION} LANGUAGES CXX)

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

################################################
# Source code
set(HEADERS
    include/spyus/ArrayView.i
    include/spyus/Caster.i
    include/spyus/ExceptionHandling.i
    include/spyus/TDM.i
    include/spyus/Vector3.i)

source_group(TREE ${CMAKE_CURRENT_SOURCE_DIR} FILES ${HEADERS})

################################################
# Add target and build options
add_library(${SPYUS} INTERFACE)
add_library(Spyus::spyus ALIAS ${SPYUS})

include(GNUInstallDirs)

set(SPYUS_PUBLIC_INCLUDE_DIRS
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>)

target_include_directories(${SPYUS} INTERFACE ${SPYUS_PUBLIC_INCLUDE_DIRS})

################################################
# Export and install target
include(InstallLibrary)
install_library(${SPYUS})
