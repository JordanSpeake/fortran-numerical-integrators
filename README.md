# Fortran Numerical Integration
This is a practice project for me to learn Fortran, it implements a few different numerical ODE solvers, including RK4 and backwards euler, I plan to add more.

It also implements a few ODE models, currently these are a damped harmonic oscillator and the lotka-volterra model.

## Running the program
To run the program, execute `run.sh` from the shell.

## Writing your own
Copy the structure of the modules in `src/models/`, you can then modify `main.f90` to use your new model.
