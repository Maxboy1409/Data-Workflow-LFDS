#!/bin/bash

# Check if jq is installed

if ! [ -x "$(command -v jq)" ]; then
        echo 'Error: jq is not installed. Please install jq and try again.'
>&2
        exit 1

fi

# Loop through all JSON files in the current directory
for file in *.json; do
        # Use jq to convert the JSON file to CSV format
        jq -r '["Tijd", "Gebruikte fietsen", "Vrije fietsen"],(.records[] | [.record_timestamp, .fields.bikes_in_use, .fields.bikes_available]) | @csv' "$file" >> "dataBikes.csv"
done 
