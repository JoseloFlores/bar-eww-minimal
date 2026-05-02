#!/bin/bash

# Path to the themes directory
THEMES_DIR="$HOME/.config/eww/themes"
EWW_SCSS="$HOME/.config/eww/eww.scss"

# 1. Try argument
# 2. Try environment variable
THEME_NAME="${1:-$EWW_THEME}"

if [ -z "$THEME_NAME" ]; then
    exit 0
fi

THEME_FILE="$THEMES_DIR/${THEME_NAME}.scss"

if [ -f "$THEME_FILE" ]; then
    # Update the @import line in eww.scss
    # Matches @import "themes/...scss"; and replaces it with the new theme
    sed -i "s|@import \"themes/.*.scss\";|@import \"themes/${THEME_NAME}.scss\";|" "$EWW_SCSS"
    echo "Theme changed to: $THEME_NAME"
else
    if [ ! -z "$1" ]; then
        echo "Error: Theme '$THEME_NAME' not found in $THEMES_DIR (looking for .scss)"
        exit 1
    fi
fi
