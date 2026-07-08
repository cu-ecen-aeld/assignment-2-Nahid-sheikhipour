#!/bin/sh
# Author: Nahid Sheikhipour

# Exits with return value 1 error and print statements if any of the parameters above were not specified
if [ $# -ne 2 ]; then
	echo "Error: Two arguments are required."
	echo "Usage: $0 <filesdir> <searchstr>"
	exit 1
fi

filesdir="$1"
searchstr="$2"

# Exits with return value 1 error and print statements if filesdir does not represent a directory on the filesystem
if [ ! -d "$filesdir" ]; then
	echo "Error: $filesdir is not a directory"
	exit 1
fi

# Count all files in filesdir and its subdirectories
X=$(find "$filesdir" -type f | wc -l)

# Count matching lines containing searchstr
Y=$(grep -r "$searchstr" "$filesdir" 2>/dev/null | wc -l)


echo "The number of files are $X and the number of matching lines are $Y"
