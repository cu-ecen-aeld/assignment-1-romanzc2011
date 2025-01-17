#!/bin/sh

###################################################################### 
# VARIABLES
FILESDIR=$1
SEARCHSTR=$2
TOTAL_FILES=0
TOTAL_GREPPED=0

# Find all the files required and redirect errors away from ui
FILES=$(find "$FILESDIR" -type f 2> /dev/null)

if [ $# -ne 2 ]
then
    printf "Usage: %s <directory> <search string>\n" "$FILESDIR"
    exit 1
elif [ -z "$FILESDIR" ] || [ -z "$SEARCHSTR" ]
then
    printf "Usage: %s <directory> <search string>\n" "$FILESDIR"
    exit 1
elif [ ! -d "$FILESDIR" ]
then
    printf "%s is not a valid directory\n" "$FILESDIR"
fi

#######################################################################
# Loop through files, count total files and grepped files
TOTAL_FILES=$(find "${FILESDIR}" -type f | wc -l)
TOTAL_GREPPED=$(find "${FILESDIR}" -type f -exec grep -r "${SEARCHSTR}" {} \; | wc -l)

printf "The number of files are %d and the number of matching lines are %d\n" "$TOTAL_FILES" "$TOTAL_GREPPED"

