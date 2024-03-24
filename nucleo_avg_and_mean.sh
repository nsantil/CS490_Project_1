#!/bin/bash

# Function to calculate the mean of an array
mean() {
    awk '{ total += $1 } END { print total / NR }'
}

# Function to calculate the median of an array
median() {
    awk '{
        a[NR] = $1
    }
    END {
        n = length(a)
        if (n % 2 == 1) {
            print a[int(n/2) + 1]
        } else {
            print (a[int(n/2)] + a[int(n/2) + 1]) / 2
        }
    }'
}

# Check if filename provided as argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# Check if file exists
if [ ! -f "$1" ]; then
    echo "Error: File '$1' not found."
    exit 1
fi

# Calculate sequence lengths
lengths=$(awk '{print length}' "$1")

# Sort lengths numerically
sorted_lengths=$(echo "$lengths" | sort -n)

# Calculate mean and median lengths
mean_length=$(echo "$sorted_lengths" | mean)
median_length=$(echo "$sorted_lengths" | median)

# Display mean and median lengths
echo "Mean Length: $mean_length"
echo "Median Length: $median_length"



# Function to calculate the mean of an array
mean() {
    awk '{ total += $1 } END { print total / NR }'
}

# Function to calculate the median of an array
median() {
        awk '{
        a[NR] = $1
    }
    END {
        n = length(a)
        if (n % 2 == 1) {
            print a[int(n/2) + 1]
        } else {
            print (a[int(n/2)] + a[int(n/2) + 1]) / 2
        }
    }'
}

# Check if filename provided as argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# Check if file exists
if [ ! -f "$1" ]; then
    echo "Error: File '$1' not found."
    exit 1
fi

# Calculate sequence lengths
lengths=$(awk '{print length}' "$1")

# Sort lengths numerically
sorted_lengths=$(echo "$lengths" | sort -n)

# Calculate mean and median lengths
mean_length=$(echo "$sorted_lengths" | mean)
median_length=$(echo "$sorted_lengths" | median)

# Display mean and median lengths
echo "Mean Length: $mean_length"
echo "Median Length: $median_length"
