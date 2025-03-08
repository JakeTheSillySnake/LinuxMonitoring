#!/bin/bash

if [ "$#" -ne 0 ]; then
    echo "Error: too many arguments"
    exit 1
fi

. output.sh