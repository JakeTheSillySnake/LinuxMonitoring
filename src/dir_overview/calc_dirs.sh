#!/bin/bash

DIR_TOTAL=$(sudo find $1* -type d  2>/dev/null | wc -l)
FILES_ALL=$(sudo find $1* -type f  2>/dev/null)
FILE_TOTAL=$(echo "$FILES_ALL" | wc -l)
FILE_EX_TOTAL=$(sudo find $1* -type f -executable  2>/dev/null | wc -l)

echo -e "${Purple}Total number of folders (including subfolders)${Reset} = $DIR_TOTAL"
echo -e "${Purple}TOP 5 folders with largest size in descending order (path and size):${Reset}"

if [ $DIR_TOTAL -gt 0 ]; then
    FOLDERS=$(sudo du -h $1*/ 2>/dev/null | sort -hr -k1)
    if [ $DIR_TOTAL -gt 5 ]; then
        MAX_DIR=5
    else
        MAX_DIR=$DIR_TOTAL
    fi
    for i in $(seq 1 $MAX_DIR);
    do
        DIR=$(echo "$FOLDERS" | awk "FNR == $i" | awk '{ print $2 }')
        DIR_SIZE=$(echo "$FOLDERS" | awk "FNR == $i" | awk '{ print $1 }')
        echo "$i - $DIR, $DIR_SIZE"
    done
else
    echo -e "${Red}No folders found${Reset}"
fi
