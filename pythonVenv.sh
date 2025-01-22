#!/bin/bash

create_venv(){
    if [ -z "$1" ]; then
        VENV_DIR=".venv"
    else
        VENV_DIR="$1"
    fi

    echo "Creating Venv..."
    python3 -m venv "$VENV_DIR"
    if [ $? -eq 0 ]; then
        echo "Created $VENV_DIR Virtual Environment Successfully"

        if [ -r "$VENV_DIR/bin/activate" ]; then
            echo "Activating Virtual Environment..."
            source "$VENV_DIR"/bin/activate
            echo "Virtual environment '$VENV_DIR' has been activated."
        else
            echo "Error: Failed to activate the virtual environment."
        fi
    else    
        echo "Error: Failed to create the virtual environment."
    fi
}

create_venv $1