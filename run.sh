# If there's an error, quit the build and run process
set -e

# Make sure we're in the build/ directory
mkdir -p build && cd build

# Run cmake
cmake ..
cmake --build .

# Run the program
./program

# Run the analysis file inside the uv environment
uv run "../analysis/analysis.py"

