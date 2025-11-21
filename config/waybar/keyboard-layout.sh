#!/bin/bash

# Get current keyboard layout using hyprctl
layout_info=$(hyprctl devices | grep -A 15 "at-translated-set-2-keyboard")

active_keymap=$(echo "$layout_info" | grep "active keymap" | cut -d: -f2 | xargs)

case "$active_keymap" in
    "English (US)")
        echo '{"text": "EN", "class": "en"}'
        ;;
    "Russian")
        echo '{"text": "RU", "class": "ru"}'
        ;;
    *)
        echo '{"text": "'"${active_keymap:0:2}"'", "class": "other"}'
        ;;
esac