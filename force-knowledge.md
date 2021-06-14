# Firefox starting automatic on each login? 

# Does that annoy you a lot ???


!! To disable autostarting firefox with this readme edit `~/.config/i3/config` and comment out this line:

`#exec --no-startup-id firefox https://github.com/endeavouros-team/endeavouros-i3wm-setup/blob/main/README.md`

`~/.config/i3/config` is the main configuration file for i3, get into this file and configure i3 as you ike, all settings have comments to give you information about the following setting.

https://github.com/endeavouros-team/endeavouros-i3wm-setup/blob/883cd60c572ee219ec0e3792c0f6d0c43ec70ed7/.config/i3/config#L368

**Warning:**
**if you install EndeavourOS-i3 aside with a full DE (XFCE4, GNOME, Plasma e.t.c.)** 

**you need to comment out dex starter from `~/.config/i3/config` file !!!**

`#exec --no-startup-id dex -a -s /etc/xdg/autostart/:~/.config/autostart/`
