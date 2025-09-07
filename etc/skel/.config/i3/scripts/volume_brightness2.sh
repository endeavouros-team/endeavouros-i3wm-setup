#!/usr/bin/env bash

# original source: https://gitlab.com/Nmoleo/i3-volume-brightness-indicator
# alternative to volume_brightness.sh that uses brightnessctl for both keyboard & screen brightness

# See README.md for usage instructions
volume_step=1
keyboard_brightness_step=20
screen_brightness_step=1
max_volume=100
notification_timeout=1000

# Specify Icon Theme here:
volume_theme_icon="audio-volume-high"
screen_brightness_theme_icon="display-brightness"
keyboard_brightness_theme_icon="display-brightness"

# Keyboard Backlight device detection here:
device_cache="/tmp/kbd_backlight_device"

if [ -f "$device_cache" ]; then
    # If there is cache, load it into device
    device=$(cat "$device_cache")
else
    # If there is no cache, create one
    device=$(brightnessctl --list | grep -Po '\w+::kbd_backlight')
    echo "$device" > "$device_cache"
fi

# Uses regex to get volume from pactl
function get_volume {
    pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '[0-9]{1,3}(?=%)' | head -1
}

# Uses regex to get mute status from pactl
function get_mute {
    pactl get-sink-mute @DEFAULT_SINK@ | grep -Po '(?<=Mute: )(yes|no)'
}

# Get keyboard_brightness from brightnessctl
function get_keyboard_brightness {
    if [ -n "$device" ]; then
        keyboard_curr=$(brightnessctl -d "$device" get)
        keyboard_max=$(brightnessctl -d "$device" max)
        echo $(( keyboard_curr * 100 / keyboard_max))
    fi
}


# Grabs screen brightness and formats it out of 100
function get_screen_brightness {
    screen_curr=$(brightnessctl -q get)
    screen_max=$(brightnessctl -q max)
    echo $(( screen_curr * 100 / screen_max ))
}

# Returns a mute icon, a volume-low icon, or a volume-high icon, depending on the volume
function get_volume_icon {
    volume=$(get_volume)
    mute=$(get_mute)
    if [ "$volume" -eq 0 ] || [ "$mute" == "yes" ] ; then
        volume_icon=""
    elif [ "$volume" -lt 50 ] ; then
        volume_icon=""
    else
        volume_icon=""
    fi
}

# Always returns the same icon - I couldn't get the brightness-low icon to work with fontawesome
function get_keyboard_brightness_icon {
    kb_brightness=$(get_keyboard_brightness)
    if [ "$kb_brightness" -eq 0 ] ; then
        keyboard_brightness_icon=""  # unfilled circle
    elif [ "$kb_brightness" -lt 50 ] ; then
        keyboard_brightness_icon=""  # fa-adjust (low brightness)
    else
        keyboard_brightness_icon=""  # full circle (high brightness)
    fi
}

function get_screen_brightness_icon {
    sc_brightness=$(get_screen_brightness)
    if [ "$sc_brightness" -eq 0 ] ; then
        screen_brightness_icon=""  # unfilled circle
    elif [ "$sc_brightness" -lt 50 ] ; then
        screen_brightness_icon=""  # fa-adjust (low brightness)
    else
        screen_brightness_icon=""  # full circle (high brightness)
    fi
}

# Displays a volume notification using notify-send
function show_volume_notif {
    mute=$(get_mute)
    volume=$(get_volume)
    get_volume_icon
    notify-send -i $volume_theme_icon -t $notification_timeout "Volume" "$volume_icon $volume%" -h int:value:$volume -h string:x-canonical-private-synchronous:volume
}

# Displays a keyboard_brightness notification
function show_keyboard_brightness_notif {
    keyboard_brightness=$(get_keyboard_brightness)
    # Debug Purposes:
    # echo $keyboard_brightness
    get_keyboard_brightness_icon
    notify-send -i $keyboard_brightness_theme_icon -t $notification_timeout "Keyboard Brightness" -h string:x-dunst-stack-tag:keyboard_brightness_notif -h int:value:$keyboard_brightness "$keyboard_brightness_icon $keyboard_brightness%"
}

# Displays a screen_brightness notification
function show_screen_brightness_notif {
    screen_brightness=$(get_screen_brightness)
    # Debug Purposes:
    # echo $screen_brightness
    get_screen_brightness_icon
    notify-send -i $screen_brightness_theme_icon -t $notification_timeout "Screen Brightness" -h string:x-dunst-stack-tag:screen_brightness_notif -h int:value:$screen_brightness "$screen_brightness_icon $screen_brightness%"
}

# Main function - Takes user input, "volume_up", "volume_down", "keyboard_brightness_up", "keyboard_brightness_down", "brightness_up", or "brightness_down"
case $1 in
    volume_up)
    # Unmutes and increases volume, then displays the notification
    pactl set-sink-mute @DEFAULT_SINK@ 0
    volume=$(get_volume)
    if [ $(( "$volume" + "$volume_step" )) -gt $max_volume ]; then
        pactl set-sink-volume @DEFAULT_SINK@ $max_volume%
    else
        pactl set-sink-volume @DEFAULT_SINK@ +$volume_step%
    fi
    show_volume_notif
    ;;

    volume_down)
    # Raises volume and displays the notification
    pactl set-sink-volume @DEFAULT_SINK@ -$volume_step%
    show_volume_notif
    ;;

    volume_mute)
    # Toggles mute and displays the notification
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    show_volume_notif
    ;;

    keyboard_brightness_up)
    # Increases keyboard brightness and displays the notification
    brightnessctl -d "$device" set ${keyboard_brightness_step}+
    show_keyboard_brightness_notif
    ;;

    keyboard_brightness_down)
    # Decreases keyboard brightness and displays the notification
    brightnessctl -d "$device" set ${keyboard_brightness_step}-
    show_keyboard_brightness_notif
    ;;

    screen_brightness_up)
    # Increases screen brightness and displays the notification
    brightnessctl -q set ${screen_brightness_step}%+
    show_screen_brightness_notif
    ;;

    screen_brightness_down)
    # Decreases screen brightness and displays the notification
    brightnessctl -q set ${screen_brightness_step}%-
    show_screen_brightness_notif
    ;;
esac
