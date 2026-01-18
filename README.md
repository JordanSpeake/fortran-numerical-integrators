# Fortran Numerical Integration
This is a practice project for me to learn Fortran, it implements a few different numerical ODE solvers. Currently these are: RK4 (3/8) and backwards euler.

It also implements a few ODE models, currently these are a damped harmonic oscillator, lotka-volterra, and Van der Pol oscillator.

## Prerequisitees
This project requires `gfortran`, `python` (with `uv`), and `CMake`.

## Running the program
To run the program, execute `run.sh` from the shell.

This:
1. Builds the fortran project.
2. Executes the generated binary, which outputs (by default) to `analysis/data.csv`.
3. Runs the python script, which reads the data file and saves generated figures to `figures/` as PNGs.

## Writing your own
Copy the structure of the modules in `src/models/`, you can then modify `main.f90` to use your new model.
