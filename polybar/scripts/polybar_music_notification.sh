source ~/.config/polybar/scripts/colors.sh


title="$(playerctl  metadata artist 2> /dev/null) - $(playerctl  metadata title 2> /dev/null)"
image="$(playerctl  metadata mpris:artUrl | cut -c 1-  2> /dev/null)"

status="$(playerctl status 2> /dev/null)"

if [[ "$status" == "Playing" ]]
then
	notify-send  "Music" "${title} is Playing"
else
	notify-send  "Music" "${title} is Paused"
fi
