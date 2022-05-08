#!/bin/bash
dbus-launch dconf load / < ~/xed.dconf
chmod -R +x ~/.config/i3/scripts
sed -i 's|\(exec --no-startup-id ~/set_once_i3.sh\)|# \1|' ~/.config/i3/config
rm ~/xed.dconf ~/set_once_i3.sh 
