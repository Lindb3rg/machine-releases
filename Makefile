# Makefile

# Get the current timestamp to ensure a unique folder name
TIMESTAMP := $(shell date +%Y%m%d%H%M%S)

# Define the source directory
SRC_DIR := data-server

# Define the new directory base name, can be overridden by a command-line argument
NEW_DIR_BASE := $(if $(NAME),$(NAME),data-server-copy)

# Define the new directory name using the timestamp
NEW_DIR := $(NEW_DIR_BASE)-$(TIMESTAMP)

# Default target
all: copy

# Target to copy the folder
copy:
	@echo "Creating a copy of $(SRC_DIR) as $(NEW_DIR)..."
	@cp -r $(SRC_DIR) $(NEW_DIR)
	@echo "Copy created: $(NEW_DIR)"

.PHONY: all copy
