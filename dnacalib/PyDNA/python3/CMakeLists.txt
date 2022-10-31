set(PYTHON3_EXACT_VERSION "" CACHE STRING "Specify exact python3 version against which the extension should be built")
if(PYTHON3_EXACT_VERSION)
    set(find_python3_extra_args ${PYTHON3_EXACT_VERSION} EXACT)
endif()
find_package(Python3 ${find_python3_extra_args} COMPONENTS Development)

set_property(SOURCE DNA.i PROPERTY CPLUSPLUS ON)
set_property(SOURCE DNA.i PROPERTY SWIG_MODULE_NAME dna)

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
        ${CMAKE_BINARY_DIR}/py3bin
    SOURCES
        DNA.i)

set_property(TARGET py3dna PROPERTY SWIG_USE_TARGET_INCLUDE_DIRECTORIES ON)

target_include_directories(py3dna PUBLIC ${CMAKE_CURRENT_LIST_DIR})
target_link_libraries(py3dna
    PUBLIC
        DNACalib::dnacalib
        Spyus::spyus
    PRIVATE
        Python3::Python)

add_custom_target(py3dna-distribution ALL
    DEPENDS
        py3dna
    COMMAND
        ${CMAKE_COMMAND} -E make_directory ${CMAKE_BINARY_DIR}/py3bin
    COMMAND
        ${CMAKE_COMMAND} -E copy $<TARGET_FILE:py3dna> ${CMAKE_BINARY_DIR}/py3bin
    COMMAND
        ${CMAKE_COMMAND} -E copy $<TARGET_FILE:DNACalib::dnacalib> ${CMAKE_BINARY_DIR}/py3bin
    COMMAND
        ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_LIST_DIR}/examples/demo.py ${CMAKE_BINARY_DIR}/py3bin/dna_demo.py)
