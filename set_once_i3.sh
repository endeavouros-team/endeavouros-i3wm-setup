#!/bin/bash
dbus-launch dconf load / < ~/xed.dconf
chmod -R +x ~/.config/i3/scripts
sed -i 's|\(exec --no-startup-id ~/set_once_i3.sh\)|# \1|' ~/.config/i3/config
cp /etc/xdg/autostart/firewall-applet.desktop ~/.config/autostart/
echo Hidden=true >> ~/.config/autostart/firewall-applet.desktop
rm ~/xed.dconf ~/set_once_i3.sh 
