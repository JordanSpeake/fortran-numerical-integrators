set -e
mkdir -p build && cd build
cmake ..
cmake --build .
./program
uv run "../analysis/analysis.py"

