# Compiler and flags
CC = gcc
CFLAGS = -Wall -Wextra

# Directories
SRC_DIR = src
INC_DIR = inc
BIN_DIR = /usr/local/bin
INCLUDE_DIR = /usr/local/include

# Source files
SRC_FILES = $(wildcard $(SRC_DIR)/*.c)

# Targets
all: my_program

my_program: $(SRC_FILES)
	$(CC) $(CFLAGS) -I$(INC_DIR) $^ -o $@

install: my_program
	cp my_program $(BIN_DIR)
	cp $(INC_DIR)/math_lib.h $(INCLUDE_DIR)

clean:
	rm -f my_program

clean-all: clean
	rm -f $(BIN_DIR)/my_program
	rm -f $(INCLUDE_DIR)/math_lib.h
