# Compiler and flags
CXX := g++
CXXFLAGS := -std=c++20 -Wall -Wextra -O2 -DLOCAL

# Default source file (can be overridden from command line)
SRC ?= main.cpp
OUT := main

LDFLAGS=
LIBS=
CFLAGS=-Wall -g
BIN=main

all: $(BIN)

main: main.o 
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LIBS)
%.o: %.cpp treemap.h
	g++ $(CXXFLAGS) -o $@ -c $<

clean:
	rm -f $(BIN) *.o *~ 
