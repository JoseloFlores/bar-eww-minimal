#!/bin/bash
# System fetch script for Debian 13

case "$1" in
    os) echo "Debian 13" ;;
    kernel) uname -r | cut -d '-' -f1 ;;
    pkgs) dpkg -l | wc -l ;;
    uptime) uptime -p | sed 's/up //' ;;
    wm) echo "Hyprland" ;;
    *) echo "Debian" ;;
esac
