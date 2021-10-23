# Firefox starting automatic on each login? 

## Start understanding how to configure i3:


To disable autostarting firefox with this readme edit `~/.config/i3/config` and comment out this line:

`#exec --no-startup-id firefox https://github.com/endeavouros-team/endeavouros-i3wm-setup/blob/main/README.md`

`~/.config/i3/config` is the main configuration file for i3, get into this file and configure i3 as you like, all settings have comments to give you information about the following setting.

https://github.com/endeavouros-team/endeavouros-i3wm-setup/blob/883cd60c572ee219ec0e3792c0f6d0c43ec70ed7/.config/i3/config#L368

**Warning:**
**if you install EndeavourOS-i3 aside with a full DE (XFCE4, GNOME, Plasma e.t.c.)** 

**you need to uninstall dex https://archlinux.org/packages/community/any/dex/ as it will run apps only needed in i3 on other desktops:**
`sudo pacman -R dex


## No transparency? 

enable picom in `~/.config/i3/config` by uncommenting this line:

```
#transparency 
exec --no-startup-id picom -CGb
```

And in some cases you will need to use a different configuration ( Nvidia GPU/Driver p.e. but also others)
Do some research will help you or ask at the chat or forum.
