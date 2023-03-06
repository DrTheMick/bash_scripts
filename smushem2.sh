#!/bin/bash
#Sums all the mrc and eer files in one directory and puts them into another
#Takes two command line parameters input dir then output dir
#Makes two sum images, a tif for fancy stuff, and a jpg for presentations etc. 
#This requires the alpha version of mrc2smv
#If no inputs given, performs and outputs in currend directory

# Set default input directory to current directory if not specified
input_dir=${1:-.}

# Set default output directory to current directory if not specified
output_dir=${2:-.}

# Loop through all .eer and .mrc files in input directory and run mrc2smv on them
for file in ${input_dir}/*.eer ${input_dir}/*.mrc; do
    if [[ -f "$file" ]]; then
        base=$(basename -- "${file}")
        filename="${base%.*}"
        echo "Converting ${filename} to TIF"
        mrc2smv -A999999 -f -o"${output_dir}/${filename}.tif" "${file}"
        echo "Converting ${filename}.tif to JPG"
        convert "${output_dir}/${filename}.tif" "${output_dir}/${filename}.jpg"
    fi
done
