#!/bin/bash

# Function to extract the namespace from the values.yaml file
get_namespace_from_values() {
    local values_file="values.yaml"
    if [ ! -f "$values_file" ]; then
        echo "Error: $values_file not found in the current directory."
        exit 1
    fi

    local namespace=$(grep -E '^namespace:' "$values_file" | awk -F': ' '{print $2}' | tr -d '[:space:]' | tr -d '"')
    if [ -z "$namespace" ]; then
        echo "Error: Namespace not found in $values_file."
        exit 1
    fi

    echo "$namespace"
}

# Get the current directory name
FOLDER_NAME=${PWD##*/}

# Get the namespace from values.yaml
NAMESPACE=$(get_namespace_from_values)

# Execute the Helm install command
helm install "$FOLDER_NAME" . --namespace "$NAMESPACE"
