# Makefile

# Get the current timestamp to ensure a unique folder name
TIMESTAMP := $(shell date +%Y%m%d%H%M%S)

# Define the source directory and the base name for the new directory
SRC_DIR := machine-deployment
NEW_DIR_BASE := machine-deployment

# Define the new directory name using the namespace
NEW_DIR := $(NEW_DIR_BASE)-$(NAMESPACE)-$(TIMESTAMP)

# Default target
all: create-dir

# Target to create a new folder, copy the files, and replace the namespace in values.yaml
create-dir:
	@if [ -z "$(NAMESPACE)" ]; then \
		echo "Error: NAMESPACE is not set."; \
		exit 1; \
	fi
	@echo "Creating a new folder $(NEW_DIR)..."
	@mkdir -p $(NEW_DIR)
	@echo "Copying files from $(SRC_DIR) to $(NEW_DIR)..."
	@cp -r $(SRC_DIR)/* $(NEW_DIR)
	@echo "Setting namespace to $(NAMESPACE) in $(NEW_DIR)/values.yaml..."
	@sed -i.bak 's/namespace: .*/namespace: "$(NAMESPACE)"/' $(NEW_DIR)/values.yaml
	@echo "Copy created: $(NEW_DIR)"

.PHONY: all create-dir
