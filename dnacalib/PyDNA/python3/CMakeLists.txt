set(PYTHON3_EXACT_VERSION "" CACHE STRING "Specify exact python3 version against which the extension should be built")
if(PYTHON3_EXACT_VERSION)
    set(find_python3_extra_args ${PYTHON3_EXACT_VERSION} EXACT)
endif()
find_package(Python3 ${find_python3_extra_args} COMPONENTS Development Interpreter)

set(py_version "py${Python3_VERSION_MAJOR}.${Python3_VERSION_MINOR}")
set(output_dir "${py_version}")
set_property(SOURCE DNA.i PROPERTY CPLUSPLUS ON)
set_property(SOURCE DNA.i PROPERTY SWIG_MODULE_NAME dna)
set_property(SOURCE DNA.i PROPERTY SWIG_FLAGS "-doxygen")

option(TYPEMAP_DEBUG "Debug deducing of typemaps" OFF)
if(TYPEMAP_DEBUG)
    set_property(SOURCE DNA.i PROPERTY SWIG_FLAGS "-debug-tmsearch")
endif()

swig_add_library(py3dna
    TYPE
        SHARED
    LANGUAGE
        python
    OUTPUT_DIR
        ${CMAKE_BINARY_DIR}/${output_dir}
    OUTFILE_DIR
        ${CMAKE_BINARY_DIR}/python3
    SOURCES
        DNA.i)
add_library(PyDNA::py3dna ALIAS py3dna)

set_target_properties(py3dna PROPERTIES
    SWIG_USE_TARGET_INCLUDE_DIRECTORIES ON
    SWIG_COMPILE_DEFINITIONS DNA_BUILD_WITH_JSON_SUPPORT=ON)
target_compile_definitions(py3dna PRIVATE DNA_BUILD_WITH_JSON_SUPPORT=ON)
target_include_directories(py3dna PUBLIC ${CMAKE_CURRENT_LIST_DIR})
target_link_libraries(py3dna
    PUBLIC
        DNACalib::dnacalib
        Spyus::spyus
    PRIVATE
        Python3::Python)

set(component_name "${PROJECT_NAME}-${py_version}")
get_property(wrapper_files TARGET py3dna PROPERTY SWIG_SUPPORT_FILES)
install(FILES ${wrapper_files} DESTINATION ${output_dir} COMPONENT ${component_name})
install(TARGETS py3dna
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
install(FILES ${CMAKE_CURRENT_LIST_DIR}/examples/demo.py DESTINATION ${output_dir} RENAME dna_demo.py COMPONENT ${component_name})

set(CPACK_COMPONENTS_ALL "${CPACK_COMPONENTS_ALL};${component_name}" PARENT_SCOPE)

if(WIN32)
    set(extra_env "PATH=${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}")
endif()
set(DNA_TEST_NAMES dna_binary_to_json_demo dna_demo)
foreach(test_name ${DNA_TEST_NAMES})
    add_test(NAME ${test_name}
            COMMAND ${CMAKE_COMMAND} -E env ${extra_env} LD_LIBRARY_PATH=${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR} PYTHONPATH=. ${Python3_EXECUTABLE} "${CMAKE_CURRENT_LIST_DIR}/../../../examples/${test_name}.py"
            WORKING_DIRECTORY ${CMAKE_BINARY_DIR}/${output_dir})
    set_property(TEST ${test_name} PROPERTY PASS_REGULAR_EXPRESSION "Done\.")
endforeach()
