#!/bin/bash
#
# Custom RPG-like wifi signal strength indicator for polybar.
#
# Author: machaerus
# https://gitlab.com/machaerus

source ~/.config/polybar/scripts/colors.sh

manabar_print() {
	ESSID=$(iwconfig wlan0 | grep ESSID | cut -d: -f2 | xargs)
	[ "$ESSID" = "off/any" ] && CONNECTED_WIFI=0 || CONNECTED_WIFI=1

	WIFI_Q=$(awk 'NR==3 {printf("%.0f\n",$3*10/7)}' /proc/net/wireless)
	if [ "$CONNECTED_WIFI" -eq 1 ]; then
	
		wifi="$bright_yellow 直$RESET"
	else
		wifi="$dark0_soft睊$RESET"
	fi
	echo "%{T3} $dark0_soft[$wifi"
}

manabar_print
