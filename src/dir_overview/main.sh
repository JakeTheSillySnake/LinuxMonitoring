#!/bin/bash

start=`date +%s.%1N`

Red='\e[31m'          # Red
Green='\e[32m'        # Green
Purple='\e[35m'       # Purple
Cyan='\e[36m'         # Cyan
Reset="\e[0m"         # No color

if [ "$#" -ne 1 ]; then
    echo "Error: 1 argument needed, $# provided"
    exit 1
elif [ ! -d "$1" ]; then
    echo -e "Error: directory ${Red}$1${Reset} does not exist"
    exit 1
elif [ "${1: -1}" != "/" ]; then
    echo "Error: path must end with '/'"
    exit 1
fi

echo -e "${Green}Scanning $1...${Reset}"

. output.sh

end=`date +%s.%1N`
echo -e "${Cyan}Script execution time (in seconds) = $(bc <<< "$end - $start")${Reset}"