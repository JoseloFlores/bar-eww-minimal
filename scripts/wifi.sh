#!/bin/bash
# Obtener SSID del dispositivo WiFi especifico
ssid=$(nmcli -t -f DEVICE,CONNECTION dev | grep '^wlp0s20f3' | cut -d: -f2)
if [ -z "$ssid" ]; then
    echo "Desconectado"
else
    echo "$ssid"
fi
