# Firefox starting automatic on each login? 

## Start understanding how to configure i3:


To disable autostarting firefox with this readme edit `~/.config/i3/config` and comment out this line:

`#exec --no-startup-id firefox https://github.com/endeavouros-team/endeavouros-i3wm-setup/blob/main/README.md`

`~/.config/i3/config` is the main configuration file for i3, get into this file and configure i3 as you like, all settings have comments to give you information about the following setting.
https://raw.githubusercontent.com/endeavouros-team/endeavouros-i3wm-setup/main/.config/i3/config

## No transparency? 

enable picom in `~/.config/i3/config` by uncommenting this line:

```
#transparency 
exec --no-startup-id picom -CGb
```

And in some cases you will need to use a different configuration ( Nvidia GPU/Driver p.e. but also others)
Do some research will help you or ask at the chat or forum.
