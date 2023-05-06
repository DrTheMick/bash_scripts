#!/bin/bash
#Converts all the TIF/TIFFs in the folder into jpgs that span the 8 bit range of a jpg
#Makes them smaller and flips the contrast
#May update later to be more sophisticated...

# Find all .tif and .tiff files in the current directory
find . -maxdepth 1 -iname "*.tif" -o -iname "*.tiff" | while read file; do

    # Generate the output filename by replacing the extension with .jpg
    output=$(echo "$file" | sed 's/\(.*\)\.\(tif\|tiff\)/\1.jpg/')

    # Convert the image to a scaled 8-bit JPEG with the same base name
    convert "$file" -normalize -resize 25% -quality 90 -negate -depth 8 -auto-level "$output"

done
