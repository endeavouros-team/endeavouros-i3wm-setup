#!/bin/bash
while [ "$select" != "LOCK" -a "$select" != "LOGOUT" -a "$select" != "POWEROFF" -a "$select" != "REBOOT" ];
do
	select=$(echo -e 'LOCK\nLOGOUT\nPOWEROFF\nREBOOT' | dmenu -nb '#bbbbbb' -nf '#0c08dd' -sb '#cc26b8' -sf '#bbbbbb' -fn '-*-*-medium-r-normal-*-*-*-*-*-*-100-*-*' -i -p\
		"Do you really want to exit i3?")
	[ -z "$select" ] && exit 0
done
[ "$select" = "LOCK" ] && ~/.config/i3/scripts/blur-lock.sh
[ "$select" = "LOGOUT" ] && i3-msg exit
[ "$select" = "POWEROFF" ] && systemctl poweroff
[ "$select" = "REBOOT" ] && systemctl reboot
