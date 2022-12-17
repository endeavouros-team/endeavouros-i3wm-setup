# Firefox is autostarting at each login?

## Dive into configuring i3

i3 is a dynamic tiling window manager inspired by wmii that is primarily targeted at developers and advanced users. The configuration file for endeavouros-i3 can be found at `~/.config/i3/config`. Edit this file to make changes and use <kbd>$mod+Shift+r</kbd> to restart i3 in place.
 
To disable firefox from autostarting comment out this line:

```
exec --no-startup-id sleep 7 && firefox https://github.com/endeavouros-team/endeavouros-i3wm-setup/blob/main/force-knowledge.md
```

## No transparency

[picom](https://wiki.archlinux.org/title/Picom) can be used to enable transparency. 
install picom `sudo pacman -Syu picom`

The default configuration is available in /etc/xdg/picom.conf. 

For modifications, it can be copied to ~/.config/picom/picom.conf or ~/.config/picom.conf. 

In some cases you might need to use a different configuration to make picom work for example while using NVIDIA's proprietary drivers.
After install and uncommeting it you need to logout and back in to see if it works.


## Disable the battery indicator

![alt text](https://raw.githubusercontent.com/endeavouros-team/screenshots/master/battery-red-i3.png "no-battery?")

To disable battery indicator edit the file `~/.config/i3/i3blocks.conf` and comment out these lines:

```
# Battery indicator
#[battery]
#command=~/.config/i3/scripts/battery2
# for alternative battery script  change to battery1
# change this to battery-pinebook-pro if you are running on pinebook-pro
#label=
#interval=30
```

## Autostart implementation

[dex](https://man.archlinux.org/man/community/dex/dex.1.en) is used to autostart applications on startup. To disable it comment out this line:

```
exec --no-startup-id dex --autostart --environment i3
```

## Reset configuration

The default configuration file for i3 can be found at `/etc/i3/config`. The default configuration file for endeavouros-i3 can be found [here](https://raw.githubusercontent.com/endeavouros-team/endeavouros-i3wm-setup/main/.config/i3/config). To replace your current configuration with the default of endeavouros-i3 run the following command. This will also make a backup of your current configuration at `~/.config/i3/config.1`:

```
wget --backups=1 https://raw.githubusercontent.com/endeavouros-team/endeavouros-i3wm-setup/main/.config/i3/config -P ~/.config/i3/
```

Still having some issues? Surf through the [EndeavourOS Wiki](https://discovery.endeavouros.com/window-tiling-managers/i3-wm/2021/03/) or ask for help on [EndeavourOS Forum](https://forum.endeavouros.com/).
