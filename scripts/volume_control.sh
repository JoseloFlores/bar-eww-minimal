#!/bin/bash
# Obtener volumen actual
vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}')

if [ "$1" == "up" ]; then
    if [ "$vol" -lt 100 ]; then
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+
    fi
else
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-
fi
