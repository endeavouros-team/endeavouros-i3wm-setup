#!/bin/sh
dbus-launch dconf load / < ~/xed.dconf
sed -i 's|\(exec --no-startup-id ~/set_once.sh\)|# \1|' ~/.config/i3/config
rm ~/xed.dconf ~/set_once.sh
