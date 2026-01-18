cmake_minimum_required(VERSION 3.12)
project(FortranIntegrators LANGUAGES Fortran)

set(CMAKE_Fortran_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/modules)
set(SOURCES
	"src/main.f90"
	"src/integrators_mod.f90"
	"src/models_mod.f90"
	"src/models/damped_harmonic_oscillator_mod.f90"
	"src/models/lotka_volterra_mod.f90"
	"src/models/van_der_pol_oscillator_mod.f90"
)

add_executable(program ${SOURCES})

if(CMAKE_Fortran_COMPILER_ID STREQUAL "GNU")
	target_compile_options(program PRIVATE -Wall -Wextra -Wpedantic -Wl,-znoexecstack -std=f2008)
endif()

