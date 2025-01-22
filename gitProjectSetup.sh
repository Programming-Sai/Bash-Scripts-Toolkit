# #!/bin/bash

set -e

is_valid_url() {
    local link="$1"  
    if [[ "$link" =~ ^https://github.com/[a-zA-Z0-9_-]+/[a-zA-Z0-9_-]+\.git$ ]]; then
        echo "true"
    else
        echo "false"
    fi
}



get_cloned_dir(){
    local link="$1"
    local last_section=$(echo "$1" | sed 's/\.git$//' | awk -F/ '{print $NF}')
    echo "$last_section"
}



main(){
    if [ -z "$1" ]; then
        echo "Please provide a git repository link."
        exit 1
    else
        if [ $(is_valid_url "$1") == "true" ]; then
            echo "Navigating into project parent dir"
            if [ -z "$2" ]; then
                cd ~/Desktop
            else
                if [ ! -d "$2" ]; then
                    echo "Directory $2 does not exist. Creating it..."
                    mkdir -p "$2"
                fi
                cd "$2"
            fi
            echo "Cloning..."
            git clone "$1" 
            if [ $? -eq 0 ]; then  # Check if git clone was successful
                echo "Git clone successful!"
                echo "Navigating Into Repo"
                cd "$(get_cloned_dir "$1")"  # Ensure that the result is quoted in case of spaces
                echo "Starting VScode..."
                code .
                echo "Process Complete."
            else
                echo "Git clone failed!"
                exit 1
            fi
        else
            echo "Please Provide a Valid Github HTTPS link"
        fi

    fi
}

main "$1" "$2"

