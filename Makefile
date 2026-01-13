# Variables
FC = gfortran
FFLAGS = -Wall -Wextra -Wpedantic -Werror
TARGET = program.out
SRC = main.f90

# Default rule
all: $(TARGET)

$(TARGET): $(SRC)
	$(FC) $(FFLAGS) -o $(TARGET) $(SRC)

# Cleanup rule
clean:
	rm -f $(TARGET)
