#!/bin/bash

# Define icon mapping as a JSON-like object for jq
ICONS='{
    "google-chrome": "",
    "chrome-cmkncekebbebpfilplodngbpllndjkfo-Default": "󰊯",
    "firefox": "",
    "firefox-esr": "",
    "brave-browser": "",
    "com.brave.Browser": "",
    "foot": "",
    "Alacritty": "",
    "kitty": "",
    "org.wezfurlong.wezterm": "",
    "code-url-handler": "󰨞",
    "code": "󰨞",
    "vscode": "󰨞",
    "Spotify": "",
    "spotify": "",
    "thunar": "󰉋",
    "nemo": "󰉋",
    "dolphin": "󰉋",
    "org.gnome.Nautilus": "󰉋",
    "nautilus": "󰉋",
    "discord": "󰙯",
    "vlc": "󰕼",
    "mpv": "󰕼",
    "stremio": "󰚺",
    "com.stremio.service": "󰚺",
    "obsidian": "󱓧",
    "Gimp-2.10": "",
    "Inkscape": "",
    "Steam": "󰓓",
    "steam": "󰓓",
    "zen-alpha": "󰈹",
    "pavucontrol": "󰓃",
    "org.pulseaudio.pavucontrol": "󰓃",
    "blueman-manager": "",
    "nm-connection-editor": "󰖩",
    "gnome-system-monitor": "󱕍"
}'

generate_json() {
    # Get active workspace ID
    active_ws=$(hyprctl monitors -j | jq '.[] | select(.focused == true).activeWorkspace.id')
    
    # Get workspaces and clients
    workspaces=$(hyprctl workspaces -j)
    clients=$(hyprctl clients -j)

    # Ensure the active workspace is present in the list even if it has no windows
    if ! echo "$workspaces" | jq -e ".[] | select(.id == $active_ws)" > /dev/null; then
        workspaces=$(echo "$workspaces" | jq ". += [{\"id\": $active_ws, \"windows\": 0}]")
    fi

    # Process everything with jq
    echo "$workspaces" | jq -c --argjson active "$active_ws" --argjson clients "$clients" --argjson icons_map "$ICONS" '
        map(.id as $ws_id | {
            id: $ws_id,
            active: ($ws_id == $active),
            icons: (
                $clients 
                | map(select(.workspace.id == $ws_id)) 
                | map(.class) 
                | unique 
                | map($icons_map[.] // "")
            )
        }) | sort_by(.id)
    '
}

# Initial execution
generate_json

# Listen for Hyprland events to update the bar in real-time
socat -u UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while read -r line; do
    generate_json
done
