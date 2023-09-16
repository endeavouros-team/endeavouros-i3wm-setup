#!/bin/sh
dbus-launch dconf load / < ~/xed.dconf
rm ~/xed.dconf ~/.config/autostart/set_once.desktop ~/set_once.sh 
