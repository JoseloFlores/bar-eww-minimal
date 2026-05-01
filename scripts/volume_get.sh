#!/bin/bash
# Obtener volumen
vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}' | python3 -c "import sys; print(int(float(sys.stdin.read()) * 100))")

# Obtener nombre del nodo activo para decidir icono
node=$(wpctl inspect @DEFAULT_AUDIO_SINK@ | grep "node.name" | cut -d'"' -f2)

if [[ "$node" == *"Headphones"* ]]; then
    icon="󰋋"
else
    icon="󰓃"
fi

echo "$icon $vol%"
