set(PYTHON3_EXACT_VERSION "" CACHE STRING "Specify exact python3 version against which the extension should be built")
if(PYTHON3_EXACT_VERSION)
    set(find_python3_extra_args ${PYTHON3_EXACT_VERSION} EXACT)
endif()
find_package(Python3 ${find_python3_extra_args} COMPONENTS Development Interpreter)

set(py_version "py${Python3_VERSION_MAJOR}.${Python3_VERSION_MINOR}")
set(output_dir "${py_version}")
set_property(SOURCE DNACalib.i PROPERTY CPLUSPLUS ON)
set_property(SOURCE DNACalib.i PROPERTY SWIG_MODULE_NAME dnacalib)
set_property(SOURCE DNACalib.i PROPERTY SWIG_FLAGS "-doxygen")

option(TYPEMAP_DEBUG "Debug deducing of typemaps" OFF)
if(TYPEMAP_DEBUG)
    set_property(SOURCE DNACalib.i PROPERTY SWIG_FLAGS "-debug-tmsearch")
endif()

swig_add_library(py3dnacalib
    TYPE
        SHARED
    LANGUAGE
        python
    OUTPUT_DIR
        ${CMAKE_BINARY_DIR}/${output_dir}
    OUTFILE_DIR
        ${CMAKE_BINARY_DIR}/python3
    SOURCES
        DNACalib.i)
add_library(PyDNACalib::py3dnacalib ALIAS py3dnacalib)

set_target_properties(py3dnacalib PROPERTIES SWIG_USE_TARGET_INCLUDE_DIRECTORIES ON)
target_link_libraries(py3dnacalib
    PUBLIC
        PyDNA::py3dna
    PRIVATE
        Spyus::spyus
        DNACalib::dnacalib
        Python3::Python)

set(component_name "${PROJECT_NAME}-${py_version}")
get_property(wrapper_files TARGET py3dnacalib PROPERTY SWIG_SUPPORT_FILES)
install(FILES ${wrapper_files} DESTINATION ${output_dir} COMPONENT ${component_name})
install(TARGETS py3dnacalib
    RUNTIME
        DESTINATION ${output_dir}
        COMPONENT ${component_name}
    LIBRARY
        DESTINATION ${output_dir}
        COMPONENT ${component_name}
        NAMELINK_COMPONENT ${component_name}
    ARCHIVE
        DESTINATION ${output_dir}
        COMPONENT ${component_name})
install(FILES ${CMAKE_CURRENT_LIST_DIR}/examples/clear_blend_shapes.py DESTINATION ${output_dir}/examples RENAME dnacalib_clear_blend_shapes.py COMPONENT ${component_name})
install(FILES ${CMAKE_CURRENT_LIST_DIR}/examples/demo.py DESTINATION ${output_dir}/examples RENAME dnacalib_demo.py COMPONENT ${component_name})
install(FILES ${CMAKE_CURRENT_LIST_DIR}/examples/remove_joint.py DESTINATION ${output_dir}/examples RENAME dnacalib_remove_joint.py COMPONENT ${component_name})
set(CPACK_COMPONENTS_ALL "${CPACK_COMPONENTS_ALL};${component_name}" PARENT_SCOPE)

if(WIN32)
    set(extra_env "PATH=${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}")
endif()
set(DNACALIB_TEST_NAMES dnacalib_clear_blend_shapes
                        dnacalib_demo
                        dnacalib_lod_demo
                        dnacalib_neutral_mesh_subtract
                        dnacalib_remove_joint
                        dnacalib_rename_joint_demo)
foreach(test_name ${DNACALIB_TEST_NAMES})
    add_test(NAME ${test_name}
            COMMAND ${CMAKE_COMMAND} -E env ${extra_env} LD_LIBRARY_PATH=${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR} PYTHONPATH=. ${Python3_EXECUTABLE} "${CMAKE_CURRENT_LIST_DIR}/../../../examples/${test_name}.py"
            WORKING_DIRECTORY ${CMAKE_BINARY_DIR}/${output_dir})
    set_property(TEST ${test_name} PROPERTY PASS_REGULAR_EXPRESSION "Done\.")
endforeach()
