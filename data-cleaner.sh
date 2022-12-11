#!/bin/bash

# Check if the file exists
if [ ! -f "data.csv" ]; then
	echo "Error: data.csv does not exist"
	exit 1
fi

# Remove the double column headers from the file
awk '!seen[$0]++' data.csv > data-cleaned-headers.csv

# Overwrite the original file with the cleaned version
mv data-cleaned-headers.csv data.csv
