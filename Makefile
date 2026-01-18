FC = gfortran
FFLAGS = -Wall -Wextra -Wpedantic -Iobj -Jobj -Wl,-znoexecstack
TARGET = bin/program
OBJS = obj/models.o obj/models/*.o obj/integrators.o obj/main.o

all: setup $(TARGET)

setup:
	mkdir -p obj bin

$(TARGET): $(OBJS)
	$(FC) $(FFLAGS) -o $@ $^

obj/%.o: src/%.f90
	$(FC) $(FFLAGS) -c $< -o $@

.PHONY: clean

clean:
	rm -rf obj bin
