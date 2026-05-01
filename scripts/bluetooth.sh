#!/bin/bash
# Obtener estado de bluetooth
powered=$(bluetoothctl show | grep "Powered: yes")
if [ -n "$powered" ]; then
    # Bucle para encontrar el dispositivo conectado
    connected_device=""
    while read -r dev; do
        info=$(bluetoothctl info "$dev")
        if echo "$info" | grep -q "Connected: yes"; then
            connected_device=$(echo "$info" | grep "Name:" | cut -d' ' -f2-)
            break
        fi
    done < <(bluetoothctl devices | awk '{print $2}')
    
    if [ -n "$connected_device" ]; then
        echo "$connected_device"
    else
        echo "On"
    fi
else
    echo "Off"
fi
