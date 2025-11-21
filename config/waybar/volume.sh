#!/bin/bash

# Get volume and mute status
volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2 * 100}')
is_muted=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -o MUTED)

if [ -n "$is_muted" ]; then
    echo "{\"text\": \"🔇 MUTE\", \"class\": \"muted\"}"
else
    volume_int=${volume%.*}
    
    
    echo "{\"text\": \"$volume_int% $icon\", \"class\": \"\"}"
fi