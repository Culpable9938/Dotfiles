source ~/.config/polybar/scripts/colors.sh

if [ $(bluetoothctl show | grep "Powered: no" | wc -c) -eq 0 ]
then
  echo "${dark0_soft} %{T3}${dark0_soft}]"
else
  if [ $(echo info | bluetoothctl | grep 'Device' | wc -c) -eq 0 ]
  then 
    echo "${bright_yellow} %{T3}${dark0_soft}]"
  fi
  echo "${bright_aqua} %{T3}${dark0_soft}]"
fi

