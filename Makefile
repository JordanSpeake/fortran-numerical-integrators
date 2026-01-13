FC = gfortran
FFLAGS = -Wall -Wextra -Wpedantic -Werror -Iobj -Jobj
TARGET = bin/program
OBJS = obj/integrators.o obj/main.o

all: setup $(TARGET)

setup:
	mkdir -p obj bin

$(TARGET): $(OBJS)
	$(FC) $(FFLAGS) -o $(TARGET) $(OBJS)

obj/%.o: src/%.f90
	$(FC) $(FFLAGS) -c $< -o $@

clean:
	rm -rf obj bin
