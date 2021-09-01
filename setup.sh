#!/bin/bash
git clone https://github.com/endeavouros-team/endeavouros-i3wm-setup.git
cd endeavouros-i3wm-setup
cp -R .config ~/                                            
chmod -R +x ~/.config/i3/scripts
cp .gtkrc-2.0 ~/
cp .nanorc ~/
dbus-launch dconf load / < ~/xed.dconf
sed -i 's|\(exec --no-startup-id ~/set_once.sh\)|# \1|' ~/.config/i3/config
sudo pacman -S --needed - < packages-repository.txt
cd ..
rm -rf endeavouros-i3wm-setup
