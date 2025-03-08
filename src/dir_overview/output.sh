#!/bin/bash

. calc_dirs.sh

DATA=$(cat << END
${Cyan}Total number of files${Reset} = $FILE_TOTAL
${Cyan}Number of:${Reset}
${Cyan}Configuration (.conf) files${Reset} = $(echo "$FILES_ALL" | grep '\.conf' | wc -l)
${Cyan}Text (.txt) files${Reset} = $(echo "$FILES_ALL" | grep '\.txt' | wc -l)
${Cyan}Executable files${Reset} = $FILE_EX_TOTAL
${Cyan}Log (.log) files${Reset} = $(echo "$FILES_ALL" | grep '\.log' | wc -l)
${Cyan}Archive files${Reset} = $(sudo find $1* -type f -exec file {} ";"  2>/dev/null | awk '/archive/' | wc -l)
${Cyan}Symbolic links${Reset} = $(sudo find $1* -type l  2>/dev/null | wc -l)
END
)

echo -e "$DATA"

. calc_files.sh