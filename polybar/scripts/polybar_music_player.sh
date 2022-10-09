#!/bin/bash

# Specifying the icon(s) in the script
# This allows us to change its appearance conditionally

source ~/.config/polybar/scripts/colors.sh


player_status=$(playerctl -i "$ignoredPlayers" status 2> /dev/null)
if [[ $? -eq 0 ]]; then
    metadata="$(playerctl -i "$ignoredPlayers" metadata artist 2> /dev/null) - $(playerctl -i "$ignoredPlayers" metadata title 2> /dev/null)"
else
	metadata="No music playing"
fi

# Foreground color formatting tags are optional
if [[ $player_status = "Playing" ]]; then
    echo "${bright_yellow}$metadata"       # when playing
elif [[ $player_status = "Paused" ]]; then
    echo "${dark0_soft}$metadata"        # when paused
else
    echo "$stoppedColor$icon $metadata"       # when stopped
fi


