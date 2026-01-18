cmake_minimum_required(VERSION 3.12)
project(FortranIntegrators LANGUAGES Fortran)

set(CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/modules)
file(GLOB_RECURSE SOURCES "src/*.f90")

add_executable(program ${SOURCES})

if(CMAKE_Fortran_COMPILER_ID STREQUAL "GNU")
	target_compile_options(program PRIVATE -Wall -Wextra -Wpedantic -Wl,-znoexecstack)
endif()

