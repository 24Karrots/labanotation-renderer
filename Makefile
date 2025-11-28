CFLAGS = -g
CC = gcc
#CXX = i686-w64-mingw32-g++
CXX = g++
ASM = nasm
ASMFLAGS = -f elf64
executables = led lintel 

all: ${executables}

functions.o: loverlap.asm 
	$(ASM) $(ASMFLAGS) loverlap.asm -o functions.o

led: led.cpp
	$(CXX) -I /usr/include/GL led.cpp -o led -lm -lglut -lGL

lintel: lintel.cpp functions.o
	$(CXX) -g -I /usr/include/GL lintel.cpp functions.o -o lintel -lm -lglut -lGL

