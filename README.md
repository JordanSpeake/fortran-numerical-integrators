# Fortran Numerical Integration
This is half a practice project and also just  where I'm going to work on ODE solver modules for other projects.

The meat of the code is contained in `integrators_mod.f90` and `models_mod.f90`, which is the actual RKF4/5 integrator, and ODE model interface respectively.

Some ODE models are included for testing, currently these are a damped harmonic oscillator, lotka-volterra, and Van der Pol oscillator.

## Prerequisites
This project requires `gfortran`, `python` (with `uv`), and `CMake`.

## Running the program
To run the program, execute `run.sh` from the shell in the form:

This:
1. Builds the fortran project.
2. Executes the generated binary, which outputs (by default) to `analysis/data.csv`.
3. Runs the python script, which reads the data file and saves generated figures to `figures/` as PNGs.
