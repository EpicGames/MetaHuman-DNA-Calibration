cmake_minimum_required(VERSION 3.14)
project(dnacalib)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/CMakeModulesExtra")

add_subdirectory(DNACalib)
add_subdirectory(SPyUS)
add_subdirectory(PyDNA)
add_subdirectory(PyDNACalib)
