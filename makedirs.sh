#!/bin/bash

# Check if number of directories is specified
if [[ -z $1 ]]; then
  echo "Usage: $0 <num_directories>"
  exit 1
fi

# Create the directories
for i in $(seq 1 $1); do
  mkdir -p $i/img $i/xds $i/phaser $i/shelx $i/refinement $i/dials $i/mosflm
done
