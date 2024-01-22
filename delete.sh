#!/bin/bash

# Directory to delete files from
dir=$1

# Shift all arguments to the left (original $1 gets lost)
shift

# Convert the remaining arguments into an array
exclude_files=("$@")

# Loop over all files in directory
for file in "$dir"/*; do
  # Extract the filename from the file path
  filename=$(basename "$file")
  
  # Check if the filename is in the list of files to keep
  keep=false
  for exclude in "${exclude_files[@]}"; do
    if [[ $exclude == *"$filename"* ]]; then
      keep=true
      break
    fi
  done
  
  # If the file is not in the list of files to keep
  if ! $keep; then
    # Delete the file
    rm "$file"
  fi
done
bash script.sh directory 'file1,file2'
