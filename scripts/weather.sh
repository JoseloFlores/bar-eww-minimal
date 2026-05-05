#!/bin/bash
CITY=""
if [ "$1" == "temp" ]; then
    curl -s "wttr.in/${CITY}?format=%t" | sed 's/+//'
elif [ "$1" == "icon" ]; then
    condition=$(curl -s "wttr.in/${CITY}?format=%C" | tr '[:upper:]' '[:lower:]')
    case "$condition" in
        *sun*|*clear*) echo "󰖙" ;;
        *cloud*) echo "󰖐" ;;
        *rain*) echo "󰖗" ;;
        *snow*) echo "󰼶" ;;
        *thunder*) echo "󰙒" ;;
        *) echo "󰖐" ;;
    esac
else
    curl -s "wttr.in/${CITY}?format=%C+ %t"
fi
