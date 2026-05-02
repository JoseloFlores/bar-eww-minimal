#!/bin/bash

# confirm_power.sh: A simple confirmation dialog using zenity

TITLE=$1
COMMAND=$2

if zenity --question --title="Confirmación" --text="$TITLE" --width=300; then
    eval "$COMMAND"
fi
