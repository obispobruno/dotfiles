#!/bin/bash

choice=$(printf '󰤄 Suspend\n Reboot\n Shutdown\n Lock\n Log out' | rofi -dmenu)

case $choice in
  '󰤄 Suspend')
    systemctl suspend
    ;;
  ' Reboot')
    systemctl reboot
    ;;
  ' Shutdown')
    systemctl poweroff
    ;;
  ' Lock')
    swaylock
    ;;
  ' Log out')
    sway exit
    ;;
esac
