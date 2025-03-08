#!/bin/bash

files_calc () {
    if [ $1 -gt 10 ]; then
        MAX_FILE=10
    else
        MAX_FILE=$1
    fi
    for i in $(seq 1 $MAX_FILE);
    do
        F=$(echo "$2" | awk "FNR == $i" | awk '{ print $2 }')
        F_Size=$(echo "$2" | awk "FNR == $i" | awk '{ print $1 }')
        if [ "$3" -eq 1 ]; then
            F_extra=$(echo "$F"| awk -F. '{print $NF}')
        else
            F_extra=$(md5sum "$F" | awk '{ print $1 }')
        fi
        echo "$i - $F, $F_Size, $F_extra"
    done
}

echo -e "${Purple}TOP 10 files with largest size in descending order (path, size, type):${Reset}"

if [ $FILE_TOTAL -gt 0 ]; then
    FILES=$(sudo find $1* -type f -print0 2>/dev/null | du -h --files0-from=- 2>/dev/null | sort -hr -k1)
    files_calc $FILE_TOTAL "$FILES" 1
else
    echo -e "${Red}No files found${Reset}"
fi

echo -e "${Purple}TOP 10 executable files with largest size in descending order (path, size, MD5 hash):${Reset}"

if [ $FILE_EX_TOTAL -gt 0 ]; then
    FILES_EX=$(sudo find $1* -type f -executable -print0 2>/dev/null | du -h --files0-from=- 2>/dev/null | sort -hr -k1)
    files_calc $FILE_EX_TOTAL "$FILES_EX" 0
else
    echo -e "${Red}No files found${Reset}"
fi