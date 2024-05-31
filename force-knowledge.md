# Dive into configuring i3

i3 is a dynamic tiling window manager inspired by wmii that is primarily targeted at developers and advanced users. The configuration file for endeavouros-i3 can be found at `"${HOME}"/.config/i3/config`. Edit this file to make changes and use <kbd>mod</kbd>+<kbd>Shift</kbd>+<kbd>r</kbd> to restart i3 in place.

## Firefox is autostarting at each login?

 Open `"${HOME}"/.config/i3/config`.
 Add/remove `#` at the start of the line to disable/enable auto start at login:
 
 Before (default setting, firefox will auto start at login)

  ```
  exec --no-startup-id sleep 7 && firefox https://github.com/endeavouros-team/endeavouros-i3wm-setup/blob/main/force-knowledge.md
  ```

 After (changed setting, firefox will not auto start at login)

  ```
  #exec --no-startup-id sleep 7 && firefox https://github.com/endeavouros-team/endeavouros-i3wm-setup/blob/main/force-knowledge.md
  ```

## No transparency effects?

**[picom](https://wiki.archlinux.org/title/Picom) can be installed and configured to enable transparency effects inside i3wm:**

  ```
  $ sudo pacman -Syu picom
  ```

  The default configuration is available in `/etc/xdg/picom.conf`.
  To modify picom settings for per user, copy global picom config in to user home directory.

  ```
  $ mkdir -pv "${HOME}"/.config/picom
  $ cp /etc/xdg/picom.conf "${HOME}"/.config/picom/picom.conf
  ```
  
In some cases you might need to use a different configuration to make picom work. Eg. While using NVIDIA's proprietary drivers.
After installing and uncommeting the settings, logout and log back in for changes to take effect.
Open `"${HOME}"/.config/picom/picom.conf`
 Add/remove `#` at the start of the line to disable/enable picom auto start at login.
  
 Before (default setting, picom will not auto start at login)
  
  ```
  #exec_always --no-startup-id picom -b
  ```

  After (changed setting, picom will auto start at login)

  ```
  exec_always --no-startup-id picom -b
  ```

## Disable the battery indicator

**![alt text](https://raw.githubusercontent.com/endeavouros-team/screenshots/master/battery-red-i3.png "no-battery?")**

 Open `"${HOME}"/.config/i3/i3blocks.conf`
  Add/remove `#` at the start of the lines to disable/enable battery indicator.
  Before (default setting, battery indicator enabled)

  ```
  # Battery indicator
  # for alternative battery script change to battery1
  # change this to battery-pinebook-pro if you are running on pinebook-pro
  [battery]
  command=~/.config/i3/scripts/battery2
  label=
  interval=30
  ```

After (changed setting, battery indicator disabled)

  ```
  # Battery indicator
  # for alternative battery script change to battery1
  # change this to battery-pinebook-pro if you are running on pinebook-pro
  #[battery]
  #command=~/.config/i3/scripts/battery2
  #label=
  #interval=30
  ```

## Autostart Implementation

 **[dex](https://man.archlinux.org/man/community/dex/dex.1.en) is used to auto start applications on startup in i3wm.**
 
  Open `"${HOME}"/.config/i3/config`.
  
  Add/remove `#` at the start of the line to disable/enable xdg auto start.
  
  Before (default setting, xdg auto start enabled)

  ```
  exec --no-startup-id dex --autostart --environment i3
  ```

 After (changed setting, xdg auto start disabled)

  ```
  #exec --no-startup-id dex --autostart --environment i3
  ```

## Reset Configuration

The default configuration file for i3 can be found at `/etc/i3/config`.

 The default configuration file for endeavouros-i3 can be found [here](https://raw.githubusercontent.com/endeavouros-team/endeavouros-i3wm-setup/main/etc/skel/.config/i3/config).

To replace your current configuration with the default of endeavouros-i3 run the following command. This will also make a backup of your current configuration at `"${HOME}"/.config/i3/config.1`

  ```
  $ wget --backups=1 https://raw.githubusercontent.com/endeavouros-team/endeavouros-i3wm-setup/main/etc/skel/.config/i3/config -P "${HOME}"/.config/i3/
  ```

## Help

Still having some issues? Surf through the [EndeavourOS Wiki](https://discovery.endeavouros.com/window-tiling-managers/i3-wm/2021/03/) or ask for help on [EndeavourOS Forum](https://forum.endeavouros.com/).
