#!/bin/bash

if command -v apt &> /dev/null; then
    # Use LC_ALL=C to ensure English output for parsing
    updates=$(LC_ALL=C apt-get -s upgrade 2>/dev/null | grep -P '^\d+ upgraded' | cut -d' ' -f1)
    echo "${updates:-0}"
elif command -v checkupdates &> /dev/null; then
    checkupdates | wc -l
else
    echo 0
fi
