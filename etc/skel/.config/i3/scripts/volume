#!/usr/bin/env bash
# i3blocks volume block for PipeWire (PulseAudio compatible)

STEP=${1:-5%}

# Default sink
SINK=$(pactl info | awk '/Default Sink/ {print $3}')
[[ -z "$SINK" ]] && { echo "No audio"; exit 0; }

# Handle scroll/middle-click
case "$BLOCK_BUTTON" in
    3) pactl set-sink-mute "$SINK" toggle ;;   # right click = mute/unmute
    4) pactl set-sink-volume "$SINK" +$STEP ;; # scroll up
    5) pactl set-sink-volume "$SINK" -$STEP ;; # scroll down
esac

# Get current volume (front-left channel)
VOL=$(pactl list sinks | awk -v s="$SINK" '
    $0 ~ "Name: " s {found=1}
    found && /Volume:/ {gsub("%","",$5); print $5; exit}
')

# Get mute state
MUTED=$(pactl list sinks | awk -v s="$SINK" '
    $0 ~ "Name: " s {found=1}
    found && /Mute:/ {print $2; exit}
')

# Choose symbol
AUDIO_HIGH=''
AUDIO_MED=''
AUDIO_LOW=''
AUDIO_MUTED=''
MED_THRESH=50
LOW_THRESH=0

if [[ "$MUTED" == "no" ]]; then
    SYMB=$AUDIO_HIGH
    [[ $VOL -le $MED_THRESH ]] && SYMB=$AUDIO_MED
    [[ $VOL -le $LOW_THRESH ]] && SYMB=$AUDIO_LOW
else
    SYMB=$AUDIO_MUTED
fi

# Single-line output for i3blocks
echo "${SYMB} ${VOL}%"
