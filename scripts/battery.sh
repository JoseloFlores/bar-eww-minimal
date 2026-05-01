#!/bin/bash
capacity=$(cat /sys/class/power_supply/BAT*/capacity)
status=$(cat /sys/class/power_supply/BAT*/status)

if [ "$status" == "Charging" ]; then
    echo " ${capacity}%"
else
    if [ "$capacity" -gt 90 ]; then echo " ${capacity}%";
    elif [ "$capacity" -gt 70 ]; then echo " ${capacity}%";
    elif [ "$capacity" -gt 50 ]; then echo " ${capacity}%";
    elif [ "$capacity" -gt 30 ]; then echo " ${capacity}%";
    else echo " ${capacity}%";
    fi
fi
