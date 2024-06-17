# endeavouros-i3wm-setup

![Stars](https://img.shields.io/github/stars/endeavouros-team/endeavouros-i3wm-setup.svg?style=flat) ![Forks](https://img.shields.io/github/forks/endeavouros-team/endeavouros-i3wm-setup.svg?style=flat) ![Contributors](https://img.shields.io/github/contributors/endeavouros-team/endeavouros-i3wm-setup.svg?style=flat) ![Maintenance](https://img.shields.io/maintenance/yes/2024.svg)

![alt text](https://raw.githubusercontent.com/endeavouros-team/screenshots/master/eos-i3-banner.png "eos-i3")

## Summary

* Dotfiles for i3 window manager under [EndeavourOS](https://endeavouros.com)
* Maintained by [killajoe](https://github.com/killajoe) (Joe Kamprad)
* You can find some details about enhancements and changes on my blog
  [kamprad.net](https://kamprad.net/index.php/endeavouros-i3wm-setup)

## Settings Tutorial

Default applications

* **Background Wallpaper - [feh](https://feh.finalrewind.org)**
  
* **File Browser - [thunar](https://docs.xfce.org/xfce/thunar/start)**
  
* **GTK Theming - ![nwg-look](https://github.com/nwg-piotr/nwg-look)**
  * Config - `"${HOME}"/.config/gtk-3.0/ "${HOME}"/.config/gtk-4.0/ "${HOME}"/.gtkrc-2.0  "${HOME}"/.local/share/nwg-look/gsettings`
    
* **Terminal Emulator - [xfce4-terminal](https://docs.xfce.org/apps/terminal/start)**
  * This is also set inside `"${HOME}"/.profile` as `export TERMINAL=xfce4-terminal`
  * If you want to change the default terminal, you need to change it in `"${HOME}"/.profile` as well.
 
* **Text Editor - [xed](https://github.com/linuxmint/xed)**
  * Config - `xed.dconf`
  * To reset default settings `dconf reset -f /org/x/editor/preferences/editor`
    
* **XDG Autostart - [dex](https://github.com/jceb/dex)**
  * Autostarting apps from `/etc/xdg/autostart/`
  * Dex is enabled by default in i3 config to autostart applications like on a DE.
  * To disable, comment out the line `exec --no-startup-id dex --autostart --environment i3` in `"${HOME}"/i3/config`
    
* **Notifications - [dunst](https://dunst-project.org)**
  * Config - `"${HOME}"/.config/dunst/dunstrc`
    
* **App Launcher - [rofi](https://davatorium.github.io/rofi)**
  * Config - `"${HOME}"/.config/rofi`

## Main Shortcuts

<kbd>mod</kbd> key is set to the Windows/Super key.

<img src="https://raw.githubusercontent.com/endeavouros-team/screenshots/master/linkey.png" alt="drawing" width="250"/>

## Default Key Bindings

Keybindings are different from the i3 defaults to fit into the setup. There are 2 methods that lets you view the default key bindings.

* Method 1 - The keyboard icon on panel opens a little GUI helper.
* Method 2 - By pressing <kbd>F1</kbd> key.

<img src="https://raw.githubusercontent.com/endeavouros-team/screenshots/master/i3-keybind-helper.png" alt="keybind-helper" width="250"/>

## Display Setup

<img src="https://raw.githubusercontent.com/endeavouros-team/screenshots/master/arandr-display-setup-i3.png" alt="arandr-i3-display-setup" width="250"/>

* Open `arandr` and setup the display(s) as per your needs.
* Save the setup from `arandr` menu or button exactly with filename `monitor`.
* In i3 EndeavourOS we have a starter line in the `"${HOME}"/.config/i3/config`

  ```
  # start a script to setup displays
  # put `monitor.sh` into the location specified by this line
  exec --no-startup-id "${HOME}"/.screenlayout/monitor.sh
  ```

* This will handle to set display on each login.
* Alternatively, you could manually make a script with `xrandr`.

## Tiling

Tiling set to default for i3wm and can be changed to

* Stacking Mode - Only the focused window in the container is displayed. You get a list of windows at the top of the container.
* Tabbed Mode - Each new window will open in fullscreen as a tab, you can change between window tabs with mouse or shortcut
  * <kbd>mod</kbd>+<kbd>Left</kbd> focus left (left arrow key)
  * <kbd>mod</kbd>+<kbd>Right</kbd> focus right (right arrow key)

## Panel Bar (i3blocks)

* Uses `i3blocks`. Lets you view workspaces, active i3 blocks, tray icons and launch applications.
* Config - `"${HOME}"/.config/i3/i3blocks.conf`
* Pulse Audio

  * Use mouse wheel over volume level
  * Right click open pulseaudio control
* Weather
  * Get your API key - <https://openweathermap.org/appid>
  * Get your city code - <https://openweathermap.org/find?q=>
    * Search your city and take the city code from the URL bar in your browser (7 numbers at the end of the URL)
  * Add the API key and city code to `"$HOME"/.config/i3/scripts/openweather.sh`
* Tray Icons (network manager, update icon, etc.)
* Logout Button (Cancel, Lock, Logout, Reboot, Shutdown, Suspend etc.)

![alt text](https://raw.githubusercontent.com/endeavouros-team/screenshots/master/panel.png "bar legende")

## Logout Menu

* Uses `rofi`. Lets you perform power actions on your machine.
* Config - `"${HOME}"/.config/i3/scripts/powermenu`
  
![alt text](https://raw.githubusercontent.com/endeavouros-team/screenshots/master/i3-power-nov21.png "logout-menu")

## Application Menu

* Uses `rofi`. Lets you launch apps, run commands, switch windows.
* Config - `"${HOME}"/.config/rofi`
  
![alt text](https://raw.githubusercontent.com/endeavouros-team/screenshots/master/eos-i3-shot-nov21.png "appmenu")

## Power Profiles Handler Menu

* Uses `powerprofilesctl`. Lets you easily switch power modes from the panel bar.
  
![alt text](https://raw.githubusercontent.com/endeavouros-team/screenshots/master/ppd-i3.png "power-profiles")

## Theming / Color Schemes

* Rofi Application Menu and Logout Menu

 `"${HOME}"/.config/rofi/rofidmenu.rasi`
 
 `"${HOME}"/.config/rofi/powermenu.rasi`

* Rofi Color Schemes

 `"${HOME}"/.config/rofi/arc_dark_transparent_colors.rasi`
 
 `"${HOME}"/.config/rofi/arc_dark_colors-ori.rasi`
 
Colors are in RGBA, calling transparency in the last column `rgba ( 26, 28, 35, 100 % )`

* GTK3 Theming and Icons

`"${HOME}"/.config/gtk-3.0`, `"${HOME}"/.Xresources`

There is ![nwg-look](https://github.com/nwg-piotr/nwg-look) installed where you can browse and set GTK theme, icons and xcursor theme.

 Xcursor needs `"${HOME}"/.Xresources`  on cases to have the right size in all cases.

 As some applications now went to GTK4 you can add a `"${HOME}"/.config/gtk-4.0/settings.ini` with only the theme lines:

```
[Settings]
gtk-theme-name=Arc-Dark
```

 With this gtk4 apps will also follow the theme (will be needed to change manually on theme changes)
    


## Tutorial to install EndeavourOS-i3wm-setup from scratch

For installing it later on, in case if you have installed another DE on initial install from the ISO

1. Clone endeavouros-i3wm-setup dotfiles repo

    ```
    $ git clone https://github.com/endeavouros-team/endeavouros-i3wm-setup.git
    $ cd endeavouros-i3wm-setup/etc/skel/
    ```

2. Copy the files to user home directories.

    ```
    $ cp .Xresources "${HOME}"/.Xresources
    $ cp -R .config/* "${HOME}"/.config/
    ```

3. Make all scripts executable inside i3 config

    ```
    $ chmod -R +x "${HOME}"/.config/i3/scripts
    ```

4. Apply settings and theming for `xed` text editor

    ```
    $ dbus-launch dconf load / < xed.dconf
    ```

5. Install using different methods

    * **Method 1** - Using EndeavourOS-packages-lists repo

        ```
        $ wget https://raw.githubusercontent.com/endeavouros-team EndeavourOS-packages-lists/master/i3
        $ sudo pacman -S --needed - < i3
        ```

    * **Method 2** - Using eos-packagelist package from EOS repo

        ```
        $ eos-packagelist --install 'i3-Window-Manager
        ```

    * **Method 3** - Using the i3_install script from the git for automated config and package installation in user home directory.
    **WARNING - Method 3 will overwrite existing files. Make sure you backup users configs before running it on your own.**

        ```
        $ wget https://raw.githubusercontent.com/endeavouros-team/endeavouros-i3wm-setup/main/i3_install
        $ ./i3_install
        ```

## Screenshot

![i3-fresh-screenshot](https://raw.githubusercontent.com/endeavouros-team/screenshots/master/i3-eos-view-shot-nov21.png)
