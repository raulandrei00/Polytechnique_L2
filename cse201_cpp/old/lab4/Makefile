# Compiler and flags
CXX := g++
CXXFLAGS := -std=c++20 -Wall -Wextra -O2 -DLOCAL

# Default source file (can be overridden from command line)
SRC ?= main.cpp
OUT := bilbao

LDFLAGS=
LIBS=
CFLAGS=-Wall -g
BIN=bilbao

all: $(BIN)

bilbao: main.o location.o shortest_path.o
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LIBS)
%.o: %.cpp location.h shortest_path.h
	g++ $(CXXFLAGS) -o $@ -c $<

clean:
	rm -f $(BIN) *.o *~ 
