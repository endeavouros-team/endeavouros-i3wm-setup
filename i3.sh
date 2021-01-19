#bin/sh
git clone https://github.com/killajoe/i3-freshup-killajoe.git
cd i3-freshup-killajoe
cp -R .config/* ~/.config/
chmod -R +x ~/.config/i3/scripts 
dbus-launch dconf load / < xed.dconf
sudo pacman -S --needed - < packages-repository.txt
cd ..
rm -R i3-freshup-killajoe

