# Compiler and flags
CXX := g++
CXXFLAGS := -std=c++23 -Wall -Wextra -O2 -DLOCAL

# Default source file (can be overridden from command line)
SRC ?= main.cpp
OUT := $(basename $(notdir $(SRC)))

# Default target
all: $(OUT)

# Build target
$(OUT): $(SRC)
	$(CXX) $(CXXFLAGS) -o $(OUT) $(SRC)

# Run target
run: all
	./$(OUT)

# Clean target
clean:
	rm -f $(OUT)