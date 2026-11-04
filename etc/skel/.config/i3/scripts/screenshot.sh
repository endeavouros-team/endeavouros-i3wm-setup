#!/usr/bin/env bash

# Save screenshot to disk and display popup message

TARGET_DIR="$(xdg-user-dir PICTURES)"
mkdir -p "$TARGET_DIR"
PREFIX="$TARGET_DIR/%Y%m%dT%H%M%S"

case "$1" in
    --select|-s)
        # Mouse selection
        scrot --select --line mode=edge \
              "${PREFIX}--selection.png" \
              --exec 'notify-send --icon="$f" "Selection Screenshot" "Saved to $n"'
        ;;
    --window|-w)
        # Current focused window
        scrot --focused \
              "${PREFIX}--window.png" \
              --exec 'notify-send --icon="$f" "Window Screenshot" "Saved to $n"'
        ;;
    --full|-f|*)
        # Complete full screenshot (Default)
        scrot "${PREFIX}--full.png" \
              --exec 'notify-send --icon="$f" "Full Screenshot" "Saved to $n"'
        ;;
esac
