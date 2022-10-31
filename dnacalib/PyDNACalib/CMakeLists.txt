cmake_minimum_required(VERSION 3.14)
project(PyDNACalib)

set(CMAKE_CXX_STANDARD 11)

find_package(SWIG 4.0.0)
include(UseSWIG)

add_subdirectory(python3)
