# Compiler and flags
CC = gcc
CFLAGS = -Wall -Wextra

# Directories
SRC_DIR = math_lib/src
INC_DIR = math_lib/inc
OBJ_DIR = math_lib/obj
LIB_DIR = math_lib/lib
BIN_DIR = /usr/local/bin
INCLUDE_DIR = /usr/local/include

# Source and object files
SRC_FILES = $(wildcard $(SRC_DIR)/*.c)
OBJ_FILES = $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(SRC_FILES))
LIB_STATIC = $(LIB_DIR)/libcalc.a
MAIN_FILE = main.c

# Targets
all: my_program

# Compile static library
$(LIB_STATIC): $(OBJ_FILES)
	ar rcs $@ $^

# Compile object files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -I$(INC_DIR) -c $< -o $@

# Compile main program and link with the static library
my_program: $(MAIN_FILE) $(LIB_STATIC)
	$(CC) $(CFLAGS) -I$(INC_DIR) $^ -o $@ -L$(LIB_DIR) -lcalc -lm

# Install the program and header file
install: my_program
	cp my_program $(BIN_DIR)
	cp $(INC_DIR)/math_lib.h $(INCLUDE_DIR)

# Clean object files, static library, and executable
clean:
	rm -f $(OBJ_DIR)/*.o $(LIB_STATIC) my_program

# Clean all including installed files
clean-all: clean
	rm -f $(BIN_DIR)/my_program
	rm -f $(INCLUDE_DIR)/math_lib.h

# Create necessary directories
$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

$(LIB_DIR):
	mkdir -p $(LIB_DIR)

# Ensure directories exist before building
$(OBJ_FILES): | $(OBJ_DIR)
$(LIB_STATIC): | $(LIB_DIR)
