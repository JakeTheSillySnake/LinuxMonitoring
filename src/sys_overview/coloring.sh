#!/bin/bash

. colors.conf

# Foreground
White='\e[37m'        # White
Red='\e[31m'          # Red
Green='\e[32m'        # Green
Blue='\e[34m'         # Blue
Purple='\e[35m'       # Purple
Black='\e[30m'        # Black

# Background
On_White='\e[47m'       # White
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Black='\e[40m'       # Black

# Config parser
for i in "${!column@}";
do
    if ! [[ "${!i}" =~ ^[1-6]$ ]]; then
        echo "Input error: please set numbers from 1 to 6"
        exit 1
    elif [ "${!i}" -eq 1 ]; then
        Color_Name="white"
        Color=$White
        Bg_Color=$On_White
    elif [ "${!i}" -eq 2 ]; then
        Color_Name="red"
        Color=$Red
        Bg_Color=$On_Red
    elif [ "${!i}" -eq 3 ]; then
        Color_Name="green"
        Color=$Green
        Bg_Color=$On_Green
    elif [ "${!i}" -eq 4 ]; then
        Color_Name="blue"
        Color=$Blue
        Bg_Color=$On_Blue
    elif [ "${!i}" -eq 5 ]; then
        Color_Name="purple"
        Color=$Purple
        Bg_Color=$On_Purple
    elif [ "${!i}" -eq 6 ]; then
        Color_Name="black"
        Color=$Black
        Bg_Color=$On_Black  
    fi

    if [ "$i" = "column1_background" ]; then
        Name_Bg=$Bg_Color
        Name_Bg_Color=$Color_Name
        Name_Bg_Flag="${!i}"
    elif [ "$i" = "column1_font_color" ]; then
        Name_Font=$Color
        Name_Font_Color=$Color_Name
        Name_Font_Flag="${!i}"
    elif [ "$i" = "column2_background" ]; then
        Val_Bg=$Bg_Color
        Val_Bg_Color=$Color_Name
        Val_Bg_Flag="${!i}"
    elif [ "$i" = "column2_font_color" ]; then
        Val_Font=$Color
        Val_Font_Color=$Color_Name
        Val_Font_Flag="${!i}"
    fi
done

if [ "$column1_background" = "$column1_font_color" ] && [ -n "$column1_background" ]; then
    echo "Error: background and font colors must not match, please try again"
    exit 1
elif [ "$column2_background" = "$column2_font_color" ] && [ -n "$column2_background" ]; then
    echo "Error: background and font colors must not match, please try again"
    exit 1
fi