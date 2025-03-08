#!/bin/bash

. utils.sh
. coloring_default.sh

DATA=$(cat << END
${Name}HOSTNAME${Reset} = ${Val}$(hostname)${Reset}
${Name}TIMEZONE${Reset} = ${Val}$(cat /etc/timezone) UTC $(date +"%-z" | cut -f1 -d '0')${Reset}
${Name}USER${Reset} = ${Val}$(whoami)${Reset}
${Name}OS${Reset} = ${Val}$( hostnamectl | grep "System" | cut -f 3-5 -d ' ')${Reset}
${Name}DATE${Reset} = ${Val}$(date | awk '{ print $2, $3, $4, $5 }')${Reset}
${Name}UPTIME${Reset} = ${Val}$(uptime -p | awk '{ print $2, $3, $4, $5, $6, $7 }')${Reset}
${Name}UPTIME_SEC${Reset} = ${Val}$(awk '{ print $1}' /proc/uptime)${Reset}
${Name}IP${Reset} = ${Val}$(ifconfig lo | grep "inet " | awk '{ print $2 }')${Reset}
${Name}MASK${Reset} = ${Val}$(ifconfig lo | grep "inet " | awk '{ print $4 }')${Reset}
${Name}GATEWAY${Reset} = ${Val}$(route -n | grep "UG" |awk '{ print $2 }')${Reset}
${Name}RAM_TOTAL${Reset} = ${Val}$RAM_TOTAL_CALC GB${Reset}
${Name}RAM_USED${Reset} = ${Val}$RAM_USED_CALC GB${Reset}
${Name}RAM_FREE${Reset} = ${Val}$RAM_FREE_CALC GB${Reset}
${Name}SPACE_ROOT${Reset} = ${Val}$ROOT_TOTAL_CALC MB${Reset}
${Name}SPACE_ROOT_USED${Reset} = ${Val}$ROOT_USED_CALC MB${Reset}
${Name}SPACE_ROOT_FREE${Reset} = ${Val}$ROOT_FREE_CALC MB${Reset}

Column 1 background = $Name_Bg_Flag ($Name_Bg_Color)
Column 1 font color = $Name_Font_Flag ($Name_Font_Color)
Column 2 background = $Val_Bg_Flag ($Val_Bg_Color)
Column 2 font color = $Val_Font_Flag ($Val_Font_Color)
END
)

echo -e "$DATA"