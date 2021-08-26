![alt text](https://repository-images.githubusercontent.com/334535607/7618aa00-bb14-11eb-93c5-d593c9466730 "eos-i3")

# endeavouros-i3wm-setup
**maintainer: joekamprad --->  setup for i3-wm under [EndeavourOS](https://endeavouros.com) new config 01-2021 <---**
[![Maintenance](https://img.shields.io/maintenance/yes/2021.svg)]()

# Tutorial for i3-wm settings:
* background handled by [nitrogen](https://wiki.archlinux.org/index.php/nitrogen)
* gtk3 theme handled by [lxappearance-gtk3](https://wiki.lxde.org/de/LXAppearance)
* Filebrowser = [Thunar](https://docs.xfce.org/xfce/thunar/start)
* default Terminal-Emulator = [xfce4-terminal](https://docs.xfce.org/apps/terminal/start)
* Text-Editor = [xed](https://github.com/linuxmint/xed)
* [dex](https://github.com/jceb/dex) : autostarting apps from /etc/xdg/autostart/ (*)
* Notifications are done with [dunst](https://dunst-project.org): CONFIG FILE = ~/.config/dunst/dunstrc

**Warning:**
**if you install EndeavourOS-i3 aside with a full DE (XFCE4, GNOME, Plasma e.t.c.)** 

**you need to comment out dex starter from `~/.config/i3/config` file !!!**

`#exec --no-startup-id dex -a -s /etc/xdg/autostart/:~/.config/autostart/`

# Main shortcuts:
[mod] key is set to the winkey (or should i call it linkey?)

<img src="https://raw.githubusercontent.com/endeavouros-team/screenshots/master/linkey.png" alt="drawing" width="250"/>

![alt text](https://raw.githubusercontent.com/endeavouros-team/screenshots/master/eos-i3-main-shortcuts.png "main-shortcuts")

# default i3-wm keycodes: 
https://i3wm.org/docs/userguide.html#_default_keybindings

# Display setup with arandr
![alt text](https://raw.githubusercontent.com/endeavouros-team/screenshots/master/arandr-display-setup-i3.png "arandr-i3-display-setup")
* open arandr and setup display/s as you need.
* save the setup from arandr menu or button exactly with filename `monitor`.
---> on i3 EndeavourOS we have a starter line in the ~/.config/i3/config

```
# start a script to setup displays
# uncomment the next line, use arandr to setup displays and save the file as monitor:
exec --no-startup-id ~/.screenlayout/monitor.sh
```
this will handle to set display on each login.


# Tiling:
is set to default for i3wm and can be changed to: 
* stacking:
Only the focused window in the container is displayed. You get a list of windows at the top of the container.

* tabbed:
so each new window will open fullscreen as a tab, you can change between window-tabs with mouse or shortcut:
[mod]+**Left** focus left (left arrow key)
[mod]+**Right** focus right (right arrow key)

# i3blocks:
* pulseaudio (mousewheel volume level, rightclick open pulseaudio control)
* weather (openweather you need to get city code and apikey first [adding it to ~/.config/i3/scripts/openweather.sh])
get your api key here: https://openweathermap.org/appid and City code: https://openweathermap.org/find?q= (search your city     and take the city code from the url in your browser [7 numbers at the end of the url])
* tray-icons (showing network-manager and update-icon)
* logout button (poweroff, logout, suspending, hibernate e.t.c.)

# panel bar (i3-blocks):
![alt text](https://raw.githubusercontent.com/endeavouros-team/screenshots/master/blocks-bar-i3.png "bar legende")
* CONFIG FILE = ~/.config/i3/i3blocks.conf
# Logout Menu:
![alt text](https://raw.githubusercontent.com/endeavouros-team/screenshots/master/power-menu-i3.png "logout-menu")
* CONFIG FILE = ~/.config/i3/scripts/shutdown_menu
# application menu (rofi):
![alt text](https://raw.githubusercontent.com/endeavouros-team/screenshots/master/rofi-desktop-menu.png "application-menu")
* rofi color-scheme: ~/.config/rofi/config.rasi




# Tutorial to install EndeavourOS-i3 setup from scratch 
**for later installs, if you have installed another DE on initial install from the ISO**

1. get the dot files
2. copy files to the right directories (.config of your user):
3. copy scripts inside ~/.config/i3/scripts must be executable ! [chmod +x] them please ;)
4. install needed packages

`git clone https://github.com/endeavouros-team/endeavouros-i3wm-setup.git`

`cd endeavouros-i3wm-setup`

`cp -R .config/* ~/.config/`

`chmod -R +x ~/.config/i3/scripts` (make scripts executable)

`dbus-launch dconf load / < xed.dconf` (setup xed-editor)

If you have the old EndeavourOS default i3-setup installed you need to remove .Xresources file
(old color profile not used anymore for rofi menus):
`rm ~.Xresources`

**install needed apps and programms for i3wm:**

`sudo pacman -S --needed - < packages-repository.txt`

![i3-fresh-screenshot](https://raw.githubusercontent.com/endeavouros-team/screenshots/master/eos-i3-fresh.png)
![i3-fresh-screenshot-menu](https://raw.githubusercontent.com/endeavouros-team/screenshots/master/eos-rofi-menu.png)

