#!/bin/bash
pamixer --get-volume
pamixer --get-mute | grep -q "true" && echo "muted" || echo "unmuted"
