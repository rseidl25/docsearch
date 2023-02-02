#!/bin/bash

# Check if a directory path is provided
if [ $# -eq 0 ]; then
  echo "Error: No directory provided"
  echo "Usage: $0 directory_path"
  exit 1
fi

# Set the directory to be searched
dir="$1"

# Initialize a counter
count=0

# Loop through all files in the directory
for file in $dir/*; do
  # Check if the file is a text file
  if [ ${file##*.} == "txt" ]; then
    # Count the number of words in the file
    words=$(wc -w "$file" | awk '{print $1}')
    # Check if the number of words is greater than 500
    if [ $words -gt 500 ]; then
      # Increment the counter
      count=$((count + 1))
    fi
  fi
done

# Print the final count
echo "Number of text files with more than 500 words in $dir: $count"
