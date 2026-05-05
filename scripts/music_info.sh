#!/bin/bash

# Check if playerctl is installed
if ! command -v playerctl &> /dev/null; then
    echo '{"status": "Offline", "title": "playerctl not found", "artist": "", "icon": "󰎆", "class": "music-off", "player": ""}'
    exit
fi

# 1. Get focused window class (Hyprland specific)
FOCUSED_CLASS=$(hyprctl activewindow -j 2>/dev/null | jq -r '.class' | tr '[:upper:]' '[:lower:]')

# 2. Get list of players and their statuses
# Format: player:status
PLAYERS_DATA=$(playerctl -a metadata --format "{{ playerName }}:{{ status }}" 2>/dev/null)

SELECTED_PLAYER=""

# Strategy A: Priority to focused window
if [ -n "$FOCUSED_CLASS" ] && [ "$FOCUSED_CLASS" != "null" ]; then
    while IFS= read -r line; do
        P_NAME="${line%%:*}"
        # Check if focused class matches player name (e.g. spotify matches spotify, google-chrome matches chromium)
        if [[ "$FOCUSED_CLASS" == *"$P_NAME"* ]] || [[ "$P_NAME" == *"$FOCUSED_CLASS"* ]] || \
           ([[ "$FOCUSED_CLASS" == *"chrome"* ]] && [[ "$P_NAME" == *"chromium"* ]]); then
            SELECTED_PLAYER="$P_NAME"
            break
        fi
    done <<< "$PLAYERS_DATA"
fi

# Strategy B: If no focused player, priority to "Playing" status
if [ -z "$SELECTED_PLAYER" ]; then
    while IFS= read -r line; do
        if [[ "$line" == *":Playing" ]]; then
            SELECTED_PLAYER="${line%%:*}"
            break
        fi
    done <<< "$PLAYERS_DATA"
fi

# Strategy C: Fallback to the first player found
if [ -z "$SELECTED_PLAYER" ]; then
    SELECTED_PLAYER=$(echo "$PLAYERS_DATA" | head -n 1 | cut -d: -f1)
fi

# Final check
if [ -z "$SELECTED_PLAYER" ]; then
    echo '{"status": "Stopped", "title": "No media", "artist": "", "icon": "󰎆", "class": "music-off", "player": ""}'
    exit
fi

# Get metadata for the SELECTED player
STATUS=$(playerctl -p "$SELECTED_PLAYER" status 2>/dev/null)

if [ "$STATUS" = "Playing" ]; then
    ICON="󰏤"
    CLASS="music-playing"
elif [ "$STATUS" = "Paused" ]; then
    ICON="󰐊"
    CLASS="music-paused"
else
    echo '{"status": "Stopped", "title": "No media", "artist": "", "icon": "󰎆", "class": "music-off", "player": ""}'
    exit
fi

TITLE=$(playerctl -p "$SELECTED_PLAYER" metadata xesam:title 2>/dev/null | sed 's/"/\\"/g')
ARTIST=$(playerctl -p "$SELECTED_PLAYER" metadata xesam:artist 2>/dev/null | sed 's/"/\\"/g')
ART_URL=$(playerctl -p "$SELECTED_PLAYER" metadata mpris:artUrl 2>/dev/null)

# Fallback for Title/Artist
[ -z "$TITLE" ] && TITLE="Unknown Title"
[ -z "$ARTIST" ] && ARTIST="Unknown Artist"

# Basic JSON output
cat <<EOF
{
    "status": "$STATUS",
    "title": "$TITLE",
    "artist": "$ARTIST",
    "icon": "$ICON",
    "class": "$CLASS",
    "art": "$ART_URL",
    "player": "$SELECTED_PLAYER"
}
EOF
