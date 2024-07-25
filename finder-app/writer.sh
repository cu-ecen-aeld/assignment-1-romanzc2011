#!/bin/bash

if [ $# -ne 2 ]
then
    printf "Usage: <filename> <string>\n"
    exit 1
elif [ -z "$1" ] || [ -z "$2" ]
then
    printf "Usage: $0 <filename> <string>\n"
    exit 1 
fi 

WRITEFILE=$1
WRITESTR=$2

# Create file path if it doesnt exist and overwrite existing file if already created
if mkdir -p $(dirname "$WRITEFILE")
then
    echo "$WRITESTR" > "$WRITEFILE"
else
    printf "Error creating file or directory" >&2
fi
