# Standard CMake library installation procedure
#
# Usage:
#   include(InstallLibrary)
#   install_library(my_target)
#
# Module dependencies:
#   CMakePackageConfigHelpers
#   GNUInstallDirs
#
# Preconditions:
#   Assumes that standard, global CMake variables are accessible, such as PROJECT_NAME

set(INSTALL_LIBRARY_SOURCE_DIR "${CMAKE_CURRENT_LIST_DIR}")

macro(install_library target_name)
    include(GNUInstallDirs)
    set(REPRESENTATIVE_TARGET_NAME ${target_name})
    set(INSTALL_CONFIGDIR ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME})

    # Set install destinations and associate installed target files with an export
    install(TARGETS ${REPRESENTATIVE_TARGET_NAME}
        EXPORT ${PROJECT_NAME}-targets
        RUNTIME DESTINATION ${CMAKE_INSTALL_LIBDIR}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
        INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

    # Write build-tree targets
    export(TARGETS ${REPRESENTATIVE_TARGET_NAME}
        FILE ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Targets.cmake
        NAMESPACE ${PROJECT_NAME}::)
    # Allow find_package to locate package without installing it (find it's build-tree)
    export(PACKAGE ${PROJECT_NAME})

    # Write install-tree targets
    install(EXPORT ${PROJECT_NAME}-targets
        FILE ${PROJECT_NAME}Targets.cmake
        NAMESPACE ${PROJECT_NAME}::
        DESTINATION ${INSTALL_CONFIGDIR})

    include(CMakePackageConfigHelpers)

    # Generate build-tree configuration
    set(INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/include)
    set(LIB_DIR ${CMAKE_CURRENT_BINARY_DIR})
    configure_package_config_file("${INSTALL_LIBRARY_SOURCE_DIR}/Config.cmake.in"
        "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake"
        INSTALL_DESTINATION ${CMAKE_CURRENT_BINARY_DIR}
        PATH_VARS INCLUDE_DIR LIB_DIR
        INSTALL_PREFIX ${CMAKE_CURRENT_BINARY_DIR})

    # Generate install-tree configuration
    set(INCLUDE_DIR ${CMAKE_INSTALL_INCLUDEDIR})
    set(LIB_DIR ${CMAKE_INSTALL_LIBDIR})
    configure_package_config_file("${INSTALL_LIBRARY_SOURCE_DIR}/Config.cmake.in"
        "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.install.cmake"
        INSTALL_DESTINATION ${INSTALL_CONFIGDIR}
        PATH_VARS INCLUDE_DIR LIB_DIR)

    # Generate package version file
    write_basic_package_version_file(
        "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake"
        VERSION ${PROJECT_VERSION}
        COMPATIBILITY SameMajorVersion)

    # Install the install-tree configuration
    install(FILES
        "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.install.cmake"
        DESTINATION ${INSTALL_CONFIGDIR}
        RENAME "${PROJECT_NAME}Config.cmake")

    # Install package version file
    install(FILES
        "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake"
        DESTINATION ${INSTALL_CONFIGDIR})

    # Install include files
    install(DIRECTORY include/ DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
endmacro()
