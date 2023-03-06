#!/bin/bash
#Bash script to sum all eer or mrc files in a given directory. The output is a tif file with the same basename.
#This takes two inputs. The input directory and the output directories as command line parameters.
#This requires the alpha version of mrc2smv

# Check that two arguments were provided
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 INPUT_DIR OUTPUT_DIR"
  exit 1
fi

# Set the input and output directories
input_dir="$1"
output_dir="$2"

# Check that the input directory exists
if [ ! -d "$input_dir" ]; then
  echo "Error: Input directory $input_dir not found"
  exit 1
fi

# Check that the output directory exists (or create it if it doesn't)
if [ ! -d "$output_dir" ]; then
  mkdir -p "$output_dir"
fi

# Loop over all files ending in .eer or .mrc
for f in "$input_dir"/*.{eer,mrc}; do
  # Check that the file exists
  if [ ! -f "$f" ]; then
    continue
  fi

  # Get the file prefix (without the .eer/.mrc extension)
  prefix=$(basename "$f" .eer)
  prefix=$(basename "$prefix" .mrc)

  # Run the mrc2smv command with the appropriate input flags
  mrc2smv -A999999 -f -o"$output_dir/$prefix".tif "$f"
done

