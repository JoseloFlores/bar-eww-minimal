#!/bin/bash
# Obtener el valor actual y el máximo para calcular el porcentaje real
current=$(brightnessctl g)
max=$(brightnessctl m)
echo $(( current * 100 / max ))
