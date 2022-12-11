#!/bin/bash

csv_file="dataBikes.csv"

md_file="${csv_file%.*}.md"

while IFS= read -r line;do
	row=`echo $line | sed 's/,/ | /g'`
	row="| $row |"
	echo $row >> $md_file
done < $csv_file
echo "" >> $md_file
