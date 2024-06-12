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
CONVERT_LIB_DIR = convert_lib

# Source and object files
SRC_FILES = $(wildcard $(SRC_DIR)/*.c)
OBJ_FILES = $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(SRC_FILES))
STATIC_MATH_LIB = $(LIB_DIR)/libcalc.a
SHARED_CONVERT_LIB = $(CONVERT_LIB_DIR)/libconvert.so

# Targets
all: calculator upper lower

# List available programs
list:
	@echo "Available programs to build:"
	@echo "  calculator - Main calculator program"
	@echo "  upper - Convert text to uppercase"
	@echo "  lower - Convert text to lowercase"

# Compile static library
$(STATIC_MATH_LIB): $(OBJ_FILES)
	ar rcs $@ $^

# Compile object files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -I$(INC_DIR) -c $< -o $@

# Compile calculator program and link with the static library
calculator: calculator.c $(STATIC_MATH_LIB)
	$(CC) $(CFLAGS) -I$(INC_DIR) $^ -o $@ -L$(LIB_DIR) -lcalc -lm

# Compile shared library for convert_lib
$(SHARED_CONVERT_LIB): $(CONVERT_LIB_DIR)/convert.o
	$(CC) -shared -o $@ $^

# Compile convert.o
$(CONVERT_LIB_DIR)/convert.o: $(CONVERT_LIB_DIR)/convert.c
	$(CC) $(CFLAGS) -fPIC -c $< -o $@

# Compile upper program
upper: upper.c $(SHARED_CONVERT_LIB)
	$(CC) $(CFLAGS) -I$(CONVERT_LIB_DIR) $< -o $@ -L$(CONVERT_LIB_DIR) -lconvert

# Compile lower program
lower: lower.c $(SHARED_CONVERT_LIB)
	$(CC) $(CFLAGS) -I$(CONVERT_LIB_DIR) $< -o $@ -L$(CONVERT_LIB_DIR) -lconvert

# Install the program and header file
install: calculator upper lower
	cp calculator $(BIN_DIR)
	cp $(INC_DIR)/math_lib.h $(INCLUDE_DIR)
	cp upper $(BIN_DIR)
	cp lower $(BIN_DIR)
	cp $(CONVERT_LIB_DIR)/convert.h $(INCLUDE_DIR)

# Clean object files, static library, shared library, and executables
clean:
	rm -f $(OBJ_DIR)/*.o $(STATIC_MATH_LIB) calculator upper lower $(CONVERT_LIB_DIR)/convert.o $(SHARED_CONVERT_LIB)

# Clean all including installed files
clean-all: clean
	rm -f $(BIN_DIR)/calculator $(BIN_DIR)/upper $(BIN_DIR)/lower
	rm -f $(INCLUDE_DIR)/math_lib.h $(INCLUDE_DIR)/convert.h

# Create necessary directories
$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

$(LIB_DIR):
	mkdir -p $(LIB_DIR)

# Ensure directories exist before building
$(OBJ_FILES): | $(OBJ_DIR)
$(STATIC_MATH_LIB): | $(LIB_DIR)
$(CONVERT_LIB_DIR)/convert.o: | $(CONVERT_LIB_DIR)
$(SHARED_CONVERT_LIB): | $(CONVERT_LIB_DIR)
