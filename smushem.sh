#!/bin/bash
#Bash script to sum all eer or mrc files in a given directory. The output is a tif file with the same basename.
#This takes the directory as a command line parameter. 
#This requires the alpha version of mrc2smv

# Check that a directory argument was provided
if [ -z "$1" ]; then
  echo "Usage: $0 DIRECTORY"
  exit 1
fi

# Set the directory containing the EER/MRC files
directory="$1"

# Check that the directory exists
if [ ! -d "$directory" ]; then
  echo "Error: Directory $directory not found"
  exit 1
fi

# Loop over all files ending in .eer or .mrc
for f in "$directory"/*.{eer,mrc}; do
  # Check that the file exists
  if [ ! -f "$f" ]; then
    continue
  fi

  # Get the file prefix (without the .eer/.mrc extension)
  prefix=$(basename "$f" .eer)
  prefix=$(basename "$prefix" .mrc)

  # Run the mrc2smv command with the appropriate input flags
  mrc2smv -A999999 -f -o"$prefix".tif "$f"
done
