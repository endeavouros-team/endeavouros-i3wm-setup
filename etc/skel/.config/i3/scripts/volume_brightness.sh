#!/usr/bin/env bash

# original source: https://gitlab.com/Nmoleo/i3-volume-brightness-indicator
# changed to use brightnessctl [xbacklight is non functional on modern hardware]
# by joekamprad [Aug 2025]

bar_color="#7f7fff"
volume_step=1
brightness_step=5
max_volume=100
notification_timeout=1000  # in ms

# Uses regex to get volume from pactl
function get_volume {
    pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '[0-9]{1,3}(?=%)' | head -1
}

# Uses regex to get mute status from pactl
function get_mute {
    pactl get-sink-mute @DEFAULT_SINK@ | grep -Po '(?<=Mute: )(yes|no)'
}

# Uses brightnessctl instead of xbacklight
function get_brightness {
    brightnessctl g | awk '{print int($1)}'
    # You could also use: brightnessctl info | grep -Po '(?<=Current brightness: )[0-9]+'
}

# Calculates brightness percentage
function get_brightness_percent {
    current=$(brightnessctl g)
    max=$(brightnessctl m)
    percent=$(( 100 * current / max ))
    echo $percent
}

function get_volume_icon {
    volume=$(get_volume)
    mute=$(get_mute)
    if [ "$volume" -eq 0 ] || [ "$mute" == "yes" ] ; then
        volume_icon=""
    elif [ "$volume" -lt 50 ]; then
        volume_icon=""
    else
        volume_icon=""
    fi
}

function get_brightness_icon {
    brightness_icon=""
}

function show_volume_notif {
    volume=$(get_volume)
    get_volume_icon
    notify-send   -i volume_icon -t 1000 "Volume" "$volume_icon $volume%" -h int:value:$volume -h string:x-canonical-private-synchronous:volume
}


function show_brightness_notif {
    get_brightness_icon
    brightness=$(get_brightness_percent)
    notify-send  -i brightness_icon -t $notification_timeout -h string:x-dunst-stack-tag:brightness_notif -h int:value:$brightness "$brightness_icon $brightness%"
}



case $1 in
    volume_up)
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
        pactl set-sink-volume @DEFAULT_SINK@ -$volume_step%
        show_volume_notif
        ;;
    volume_mute)
        pactl set-sink-mute @DEFAULT_SINK@ toggle
        show_volume_notif
        ;;
    brightness_up)
        brightnessctl s +$brightness_step% > /dev/null
        show_brightness_notif
        ;;
    brightness_down)
        brightnessctl s $brightness_step%- > /dev/null
        show_brightness_notif
        ;;
esac
