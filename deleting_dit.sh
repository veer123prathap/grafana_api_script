#!/bin/bash

directory="/path/to/directory"  # Replace with the actual directory path

excluded_items=(
    "file1.txt" 
    "keep_this_dir"    
)

for item in "${excluded_items[@]}"; do
    find "$directory" -mindepth 1 -type d ! -path "$directory/$item/*" -print0 | while IFS= read -r -d '' dir; do
    
    echo "Directory to be deleted: $dir" 
    read -p "Press enter to delete this directory or type anything else to skip: " -r
    echo    # move to a new line
    if [[ -z $REPLY ]]
    then
        rm -r "$dir"
    fi
done
