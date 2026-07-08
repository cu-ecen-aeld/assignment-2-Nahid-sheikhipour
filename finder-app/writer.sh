#!/bin/sh
# Author: Nahid Sheikhipour

# Exits with return value 1 error and print statements if any of the parameters above were not specified
if [ $# -ne 2 ]; then
	echo "Error: Two arguments are required."
	echo "Usage: $0 <filesdir> <searchstr>"
	exit 1
fi

writefile=$1
writestr=$2

# Extract file directory form the writefile
writedir=$(dirname "$writefile")

# create directory path if it doesn't exist
if ! mkdir -p "$writedir"; then
	echo "Error: Couldnot create directory path $writedir"
	exit 1
fi

# Create/Overwrite file with the specified content
if ! echo "$writestr" > "$writefile"; then
	echo "Error: Could not create or write to file '$writefile'"
	exit 1
fi
