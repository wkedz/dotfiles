#!/bin/bash

# Function to safely execute scripts
safe_execute() {
    local script_path="$1"
    # Ensure the script is executable
    if [[ -x "$script_path" ]]; then
        echo "Executing $script_path..."
        # Execute the script
        bash "$script_path"
    else
        echo "Skipping $script_path as it is not executable. Making it executable..."
        chmod +x "$script_path"
        bash "$script_path"
    fi
}

# Directories to search for scripts
directories=("bash" "scripts")

# Loop through each directory
for dir in "${directories[@]}"; do
    # Check if directory exists
    if [[ -d "$dir" ]]; then
        echo "Searching for scripts in $dir..."
        # Find all .sh files in the directory, including subdirectories
        while IFS= read -r script; do
            safe_execute "$script"
        done < <(find "$dir" -type f -name "*.sh")
    else
        echo "Directory $dir does not exist."
    fi
done

echo "All scripts have been executed."

