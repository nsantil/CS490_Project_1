#!/bin/bash

# Check if filename provided as argument
if [ $# -lt 2 ]; then
    echo "Usage: $0 <narrowPeak_file> <output_file>"
    exit 1
fi

# Check if narrowPeak file exists
if [ ! -f "$1" ]; then
    echo "Error: File '$1' not found."
    exit 1
fi

# Sort the narrowPeak file by start position
sort -k2,2n "$1" > sorted_narrowPeak.txt

# Iterate over sorted entries to calculate and generate regions between gaps
prev_end=0
while IFS=$'\t' read -r chrom start end _; do
    # Calculate gap between regions
    gap=$((start - prev_end - 1))
    
    # Generate region between gaps
    if [ "$gap" -gt 0 ]; then
        middle_start=$((prev_end + 1))
        middle_end=$((start - 1))
        echo -e "$chrom\t$middle_start\t$middle_end"
    fi
    
    prev_end="$end"
done < sorted_narrowPeak.txt > "$2"

# Remove temporary file
rm sorted_narrowPeak.txt

echo "Middle regions between accessible regions have been generated and saved to $2"

