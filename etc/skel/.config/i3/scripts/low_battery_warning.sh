#!/usr/bin/env bash

POWER_SUPPLY_PATH="${POWER_SUPPLY_PATH:-/sys/class/power_supply}"
# Set one or more percentages, such as (5 10).
LOW_BATTERY_THRESHOLDS=(10)
CHECK_INTERVAL_SECONDS=30
ALARM_SOUND="/usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga"

read_power_state() {
    local supply supply_type status capacity scope lowest=101 lowest_discharging=101
    local has_battery=false

    for supply in "$POWER_SUPPLY_PATH"/*; do
        [[ -d "$supply" ]] || continue
        IFS= read -r supply_type < "$supply/type" 2>/dev/null || continue

        case "$supply_type" in
            Battery)
                if IFS= read -r scope 2>/dev/null < "$supply/scope" && [[ "$scope" == "Device" ]]; then
                    continue
                fi
                IFS= read -r status < "$supply/status" 2>/dev/null || continue
                IFS= read -r capacity < "$supply/capacity" 2>/dev/null || continue
                [[ "$capacity" =~ ^[0-9]{1,3}$ ]] || continue
                capacity=$((10#$capacity))
                (( capacity <= 100 )) || continue

                has_battery=true
                (( capacity < lowest )) && lowest=$capacity
                if [[ "$status" == "Discharging" ]] && (( capacity < lowest_discharging )); then
                    lowest_discharging=$capacity
                fi
                ;;
        esac
    done

    [[ "$has_battery" == true ]] || return 1

    if (( lowest_discharging <= 100 )); then
        battery_percent=$lowest_discharging
        discharging=true
    else
        battery_percent=$lowest
        discharging=false
    fi
}

send_warning() {
    local threshold=$1
    command -v notify-send >/dev/null 2>&1 || return 1
    notify-send \
        --app-name=Battery \
        --icon=battery-caution \
        --urgency=critical \
        "Low battery: ${threshold}%" \
        "Battery is at ${battery_percent}%. Connect your computer to power." \
        >/dev/null 2>&1
}

play_beep() {
    if command -v canberra-gtk-play >/dev/null 2>&1; then
        canberra-gtk-play -i alarm >/dev/null 2>&1 9>&- &
    elif command -v paplay >/dev/null 2>&1 && [[ -r "$ALARM_SOUND" ]]; then
        paplay "$ALARM_SOUND" >/dev/null 2>&1 9>&- &
    fi
}

update_threshold_alerts() {
    local threshold threshold_value
    thresholds_to_alert=()

    if [[ "$discharging" != true ]]; then
        alerted_thresholds=()
        return
    fi

    for threshold in "${LOW_BATTERY_THRESHOLDS[@]}"; do
        [[ "$threshold" =~ ^[0-9]{1,3}$ ]] || continue
        threshold_value=$((10#$threshold))
        (( threshold_value <= 100 )) || continue

        if (( battery_percent <= threshold_value )); then
            if [[ "${alerted_thresholds[$threshold_value]:-false}" == false ]]; then
                thresholds_to_alert+=("$threshold_value")
            fi
        else
            alerted_thresholds[$threshold_value]=false
        fi
    done
}

main() {
    local threshold
    local -A alerted_thresholds=()
    local -a thresholds_to_alert=()
    local lock_file="${XDG_RUNTIME_DIR:-${TMPDIR:-/tmp}}/i3-low-battery-warning-${UID}.lock"

    exec 9>"$lock_file" || exit 1
    flock -n 9 || exit 0

    while true; do
        if read_power_state; then
            update_threshold_alerts
            for threshold in "${thresholds_to_alert[@]}"; do
                if send_warning "$threshold"; then
                    alerted_thresholds[$threshold]=true
                    play_beep
                fi
            done
        fi
        sleep "$CHECK_INTERVAL_SECONDS"
    done
}

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
    main
fi