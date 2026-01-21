#!/usr/bin/env bash
set -euo pipefail

save=false
area=false

while [[ $# -gt 0 ]]; do
  case "$1" in
    --save) save=true ;;
    --area) area=true ;;
  esac
  shift
done

dest="/tmp/screenshot.png"
if $save; then
  dest="$HOME/Pictures/screenshot-$(date +%Y%m%d-%H%M%S).png"
fi

if $area; then
  grim -g "$(slurp)" "$dest"
else
  grim -o "$(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name')" "$dest"
fi

if $save; then
  notify-send -i "$dest" "Screenshot saved" "$dest"
else
  wl-copy < "$dest"
  notify-send "Screenshot copied to clipboard"
  rm "$dest"
fi
