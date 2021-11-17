#!/bin/bash
git clone https://github.com/endeavouros-team/endeavouros-i3wm-setup.git
cd endeavouros-i3wm-setup
cp -R .config ~/                                            
chmod -R +x ~/.config/i3/scripts
cp .gtkrc-2.0 ~/
cp .nanorc ~/
dbus-launch dconf load / < ~/xed.dconf
sed -i 's|\(exec --no-startup-id ~/set_once.sh\)|# \1|' ~/.config/i3/config
wget https://raw.githubusercontent.com/endeavouros-team/EndeavourOS-packages-lists/master/i3
sudo pacman -S --needed - < i3
cd ..
rm -rf endeavouros-i3wm-setup
