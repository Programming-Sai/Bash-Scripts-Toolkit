#!/bin/bash

# Function to extract the tool name from the script path
get_tool_name(){
    local last_section=$(echo "$1" | sed 's/\.sh$//' | awk -F/ '{print $NF}')
    echo "$last_section"
}

# Function to globalize the script
globalize(){
    if [ -z "$1" ]; then
        echo "Please provide a relative/absolute path to the script to globalize."
        exit 1
    fi

    if [ ! -f "$1" ]; then
        echo "Error: $1 does not exist."
        exit 1
    fi

    echo "Granting executable access..."
    chmod +x "$1"
    echo "Access granted."

    echo "Checking permissions for /usr/local/bin..."
    if [ ! -w /usr/local/bin ]; then
        echo "Error: You do not have write permissions for /usr/local/bin."
        exit 1
    fi

    local tool_name
    tool_name=$(get_tool_name "$1")

    if [ -f "/usr/local/bin/$tool_name" ]; then
        echo "Warning: A script with the name '$tool_name' already exists in /usr/local/bin."
        read -p "Overwrite it? (y/n): " choice
        case "$choice" in
            y|Y ) echo "Overwriting existing script...";;
            n|N ) echo "Operation canceled."; exit 1 ;;
            * ) echo "Invalid choice. Operation canceled."; exit 1 ;;
        esac
    fi

    echo "Globalizing..."
    sudo cp "$1" /usr/local/bin/"$tool_name"
    echo "'$1' has been globalized. You can now call '$tool_name' from anywhere on your system."
}

# Call the globalize function with the provided argument
globalize "$1"
