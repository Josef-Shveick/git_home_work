# Compiler and flags
CC = gcc
CFLAGS = -Wall -Wextra

MAIN_SOURCE = main.c
MAIN_OBJECT = $(MAIN_SOURCE:.c=.o)
OBJ_FILES = src1.o src2.o src3.o
EXECUTABLE = main


# Check the environment variable USE_INCLUDE
ifeq ($(USE_INCLUDE), 1)
$(info Building sources using include)	
include make1.mk	
include make2.mk	
include make3.mk
else
$(info Building sources using 'make -f')	
$(shell make -f make1.mk)	
$(shell make -f make2.mk)	
$(shell make -f make3.mk)
endif


# Compile main program
$(EXECUTABLE): $(MAIN_OBJECT) $(OBJ_FILES)
	$(CC) $(CFLAGS) -o $@ $(MAIN_OBJECT) $(OBJ_FILES)

# Compile main.c to main.o
$(MAIN_OBJECT): $(MAIN_SOURCE)
	$(CC) $(CFLAGS) -c $< -o $@


# Clean target to remove object files and executable
clean:
	rm -f $(OBJ_FILES) $(MAIN_OBJECT) $(EXECUTABLE)

# Phony targets
.PHONY: all clean

# Default target
all: $(EXECUTABLE)
