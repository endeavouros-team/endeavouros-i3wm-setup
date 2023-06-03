# Volume and Brightness Indicator for i3wm

![](brightness.gif)
![](volume.gif)

This is a simple Bash script that uses Dunst to show an indicator on the screen when the volume and brightness are changed.

## Dependancies

* PulseAudio
* xbacklight (`dnf install xbacklight`)
* Font Awesome (`dnf install fontawesome-fonts fontawesome5-fonts`)
* dunst (`dnf install dunst`)

## Installation

1. Verify that all of the dependancies are installed
2. Copy `volume_brightness.sh` to a folder on your computer
3. Edit `~/.config/dunst/dunstrc`
4. Under the `[global]` section, add `Font Awesome 5 Free Regular`
5. Change `origin` to `bottom-center` or your desired location
6. Here are the notable parts of my dunstrc:
	```
	[global]
	    font = "Roboto Mono, Font Awesome 5 Free Regular"
        origin = bottom-center
        separator_color = "#b3cfa7"
        separator_width = 1
        frame_color = "#b3cfa7"
        frame_width = 1
    
    [urgency_low]
        background = "#202426"
        foreground = "#b3cfa7"

    [urgency_normal]
        background = "#202426"
        foreground = "#b3cfa7"

    [urgency_critical]
        background = "#202426"
        foreground = "#b3cfa7"
	```
5. Edit `~/.config/i3/config`
6. Add the following lines:
	```
	bindsym XF86AudioRaiseVolume exec --no-startup-id /path/to/volume_brightness.sh volume_up
	bindsym XF86AudioLowerVolume exec --no-startup-id /path/to/volume_brightness.sh volume_down
	bindsym XF86AudioMute exec --no-startup-id /path/to/volume_brightness.sh volume_mute
    bindsym XF86MonBrightnessUp exec --no-startup-id /path/to/volume_brightness.sh brightness_up
    bindsym XF86MonBrightnessDown exec --no-startup-id /path/to/volume_brightness.sh brightness_down
	```
7. Replace `/path/to/volume_brightness.sh` with the correct path to the script
8. Edit `volume_brightness.sh` and set your desired values for `bar_color`, `volume_step`, `brightness_step`, and `max_volume`
