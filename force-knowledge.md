# Firefox starting automatic on each login? 

## Dive into configure i3:

To disable autostarting firefox with this readme edit `~/.config/i3/config` and comment out this line:

`#exec --no-startup-id firefox https://github.com/endeavouros-team/endeavouros-i3wm-setup/blob/main/README.md`

`~/.config/i3/config` is the main configuration file for i3, get into this file and configure i3 as you like, all settings have comments to give you information about the following setting:

https://raw.githubusercontent.com/endeavouros-team/endeavouros-i3wm-setup/main/.config/i3/config

## No transparency? 

enable picom in `~/.config/i3/config` by uncommenting this line:

```
#transparency 
exec --no-startup-id picom -CGb
```

And in some cases you will need to use a different configuration ( Nvidia GPU/Driver p.e. but also others)
Do some research will help you or ask at the chat or forum.

## Not on a notebook? 
![alt text](https://raw.githubusercontent.com/endeavouros-team/screenshots/master/battery-red-i3.png "no-battery?")

Disable battery indicator in i3blocks.conf:

```
# Battery indicator
#[battery]
#command=~/.config/i3/scripts/battery2
# for alternative battery script  change to battery1
# change this to battery-pinebook-pro if you are running on pinebook-pro
#label=
#interval=30
```

## autostart implementation:
[dex](https://github.com/jceb/dex) is enabled in config per default:
disable dex in `~/.config/i3/config` by uncommenting this line:

```
#exec --no-startup-id dex --autostart --environment i3
```
