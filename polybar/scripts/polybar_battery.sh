#!/bin/bash
battery_level=`acpi -b`
notify-send "Battery" "${battery_level}%"
