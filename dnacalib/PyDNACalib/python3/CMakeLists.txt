set(PYTHON3_EXACT_VERSION "" CACHE STRING "Specify exact python3 version against which the extension should be built")
if(PYTHON3_EXACT_VERSION)
    set(find_python3_extra_args ${PYTHON3_EXACT_VERSION} EXACT)
endif()
find_package(Python3 ${find_python3_extra_args} COMPONENTS Development)

set_property(SOURCE DNACalib.i PROPERTY CPLUSPLUS ON)
set_property(SOURCE DNACalib.i PROPERTY SWIG_MODULE_NAME dnacalib)

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
        ${CMAKE_BINARY_DIR}/py3bin
    SOURCES
        DNACalib.i)

set_property(TARGET py3dnacalib PROPERTY SWIG_USE_TARGET_INCLUDE_DIRECTORIES ON)

target_link_libraries(py3dnacalib
    PUBLIC
        py3dna
    PRIVATE
        Spyus::spyus
        DNACalib::dnacalib
        Python3::Python)

add_custom_target(py3dnacalib-distribution ALL
    DEPENDS
        py3dnacalib
    COMMAND
        ${CMAKE_COMMAND} -E make_directory ${CMAKE_BINARY_DIR}/py3bin
    COMMAND
        ${CMAKE_COMMAND} -E copy $<TARGET_FILE:py3dnacalib> ${CMAKE_BINARY_DIR}/py3bin
    COMMAND
        ${CMAKE_COMMAND} -E copy $<TARGET_FILE:DNACalib::dnacalib> ${CMAKE_BINARY_DIR}/py3bin
    COMMAND
        ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_LIST_DIR}/examples/demo.py ${CMAKE_BINARY_DIR}/py3bin/dnacalib_demo.py
    COMMAND
        ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_LIST_DIR}/examples/remove_joint.py ${CMAKE_BINARY_DIR}/py3bin/dnacalib_remove_joint.py
    COMMAND
        ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_LIST_DIR}/examples/clear_blend_shapes.py ${CMAKE_BINARY_DIR}/py3bin/dnacalib_clear_blend_shapes.py)
