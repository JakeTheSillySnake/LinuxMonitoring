#!/bin/bash

. coloring.sh

# Default values
if [ -z "$Name_Bg" ]; then
    Name_Bg_Flag="default"
    if [ "$Name_Font" != "$Black" ]; then
        Name_Bg=$On_Black
        Name_Bg_Color="black"
    else
        Name_Bg=$On_White
        Name_Bg_Color="white"
    fi
fi
if [ -z "$Name_Font" ]; then
    Name_Font_Flag="default"
    if [ "$Name_Bg" != "$On_Purple" ]; then
        Name_Font=$Purple
        Name_Font_Color="purple"
    else
        Name_Font=$White
        Name_Font_Color="white"
    fi
fi
if [ -z "$Val_Bg" ]; then
    Val_Bg_Flag="default"
    if [ "$Val_Font" != "$Black" ]; then
        Val_Bg=$On_Black
        Val_Bg_Color="black"
    else
        Val_Bg=$On_White
        Val_Bg_Color="white"
    fi
fi
if [ -z "$Val_Font" ]; then
    Val_Font_Flag="default"
    if [ "$Val_Bg" != "$On_Green" ]; then
        Val_Font=$Green
        Val_Font_Color="green"
    else
        Val_Font=$On_White
        Val_Font_Color="white"
    fi
fi

Name="${Name_Font}${Name_Bg}"
Val="${Val_Font}${Val_Bg}"
Reset="\e[0m"