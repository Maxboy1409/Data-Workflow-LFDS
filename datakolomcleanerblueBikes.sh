#!/bin/bash

# Check if the file exists
if [ ! -f "dataBikes.csv" ]; then
        echo "Error: dataBikes.csv does not exist"
        exit 1
fi

# Remove the double column headers from the file
awk '!seen[$0]++' dataBikes.csv > data-cleaned-headers.csv

# Overwrite the original file with the cleaned version
mv data-cleaned-headers.csv dataBikes.csv
