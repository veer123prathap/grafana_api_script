#!/bin/bash

directory="/path/to/directory"  # Replace with the actual directory path

excluded_items=(
    "file1.txt" 
    "keep_this_dir"    
)

find "$directory" -mindepth 1 -type d -print0 | while IFS= read -r -d '' dir; do
    exclude_flag=0
    for item in "${excluded_items[@]}"; do
        if [[ $dir == "$directory/$item" || $dir == "$directory/$item"* ]]; then
            exclude_flag=1
            break
        fi
    done
    if [[ $exclude_flag -eq 0 ]]; then
        echo "Directory to be deleted: $dir" 
        read -p "Press enter to delete this directory or type anything else to skip: " -r
        echo    # move to a new line
        if [[ -z $REPLY ]]
        then
            rm -r "$dir"
        fi
    fi
done
