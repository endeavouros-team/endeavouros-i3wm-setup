# i3-killajoe
## joekamprad: setup for i3-killajoe under [EndeavourOS](https://endeavouros.com)


----

# Tutorial to install EndeavourOS-i3 setup from scratch 
**for later installs, if you have installed another DE on initial install from the ISO**

1. get the dot files
2. copy files to the right directories (.config of your user):
3. copy scripts inside ~/.config/i3/scripts must be executable ! [chmod +x] them please ;)
4. install needed packages

`git clone https://github.com/killajoe/i3-freshup-killajoe.git`

`cd i3-freshup-killajoe`

`cp -R .config/* ~/.config/`

`chmod -R +x ~/.config/i3/scripts` (make scripts executable)
`dbus-launch dconf load / < xed.dconf` (setup xed-editor)

If you have the old EndeavourOS default i3-setup installed you nee dto remove .Xresources file
(old color profile ot used anymore for rofi menus):
`rm ~.Xresources`

# install needed apps and programms for i3wm:

`sudo pacman -S --needed - < packages-repository.txt`

