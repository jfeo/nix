selected=$(fd --type f --no-ignore --exclude .git . "$HOME" | rofi -matching fuzzy -dmenu -i -p "Open file:")
if [ -n "$selected" ]; then
  xdg-open "$selected"
fi
