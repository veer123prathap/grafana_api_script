#!/bin/bash

# 1. Specify the directory where you want to delete files:
directory="/path/to/directory"  # Replace with the actual directory path

# 2. List the files you want to exclude from deletion:
excluded_files=(
    "file1.txt"
    "important_data.csv"
    "subdirectory/keep_this_file.log"  # Example of a file in a subdirectory
)

# 3. Use the `find` command to locate files within the directory, excluding the specified files:
find "$directory" -type f ! -name "${excluded_files[@]}" -print0 | while IFS= read -r -d '' file
do
    # 4. Delete each file using the `rm` command:
    rm "$file"
done




Directory Path: Replace /path/to/directory with the actual directory where you want to delete files.
Excluded Files: Add the names or full paths of files you want to keep within the excluded_files array.
find Command: This command searches for files in the specified directory, excludes the listed files, and prints their full paths with null delimiters.
while Loop: Iterates through each found file and deletes it using rm.
Safety Precautions:
Use -print0 and IFS= read -r -d '' to handle filenames with spaces or special characters correctly.
Consider adding a -i flag to rm for interactive confirmation before deletion.
To Use:

Save the script as a file with a .sh extension (e.g., delete_files.sh).
Make the script executable using chmod +x delete_files.sh.
Run the script: ./delete_files.sh
