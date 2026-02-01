# If there's an error, quit the build and run process
set -e

# Check that the figures directory exists
mkdir -p figures

# Run cmake
cmake -S . -B build
cmake --build build --parallel

# Run the program
./build/program

# Run the analysis file inside the uv environment
uv run --project=analysis ./analysis/analysis.py


