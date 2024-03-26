#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <input file> <output file>"
    exit 1
fi

# Assign input file name to a variable
input_file="$1"

# Check if the input file exists
if [ ! -e "$input_file" ]; then
    echo "Error: Input file '$input_file' not found."
    exit 1
fi

# Generate output file name based on input file name
output_file="$2"

# Execute bedtools getfasta command
bedtools getfasta -fi /users/nsantil/hg38.fa -bed "$input_file" -fo "$output_file"

echo "Output written to: $output_file"

