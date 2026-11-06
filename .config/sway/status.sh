#!/usr/bin/env bash

BAT="/sys/class/power_supply/BAT0"

# Colors (Catppuccin Mocha theme)
GREEN="#a6e3a1"
YELLOW="#f9e2af"
RED="#f38ba8"
BLUE="#89b4fa"
TEXT="#cdd6f4"

# i3bar protocol header
printf '{"version":1}\n[\n[]\n'

while :; do
    # --- Wi-Fi ---
    ssid=$(iwgetid -r 2>/dev/null)
    ssid=${ssid//\"/} # Sanitize quotes to keep JSON valid
    if [[ -n $ssid ]]; then
        wifi="Wi-Fi: $ssid"
        wc="$GREEN"
    else
        wifi="Wi-Fi: off"
        wc="$RED"
    fi

    # --- Battery ---
    cap=100
    st="Unknown"
    [[ -r "$BAT/capacity" ]] && read -r cap < "$BAT/capacity"
    [[ -r "$BAT/status" ]]   && read -r st < "$BAT/status"

    if [[ $st == "Charging" ]]; then
        bc="$BLUE"
        sym="+"
    elif (( cap <= 20 )); then
        bc="$RED"
        sym=""
    elif (( cap <= 50 )); then
        bc="$YELLOW"
        sym=""
    else
        bc="$GREEN"
        sym=""
    fi
    batt="BAT: ${cap}%${sym:+ $sym}"

    printf -v dt '%(%a %d %b %I:%M %p)T' -1

    printf ',[{"full_text":"%s","color":"%s"},{"full_text":"%s","color":"%s"},{"full_text":"%s","color":"%s"}]\n' \
        " $wifi " "$wc" " $batt " "$bc" " $dt " "$TEXT"

    sleep 5
done
