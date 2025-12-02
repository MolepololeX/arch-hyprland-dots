#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/wallpapers/"
CURRENT_WALL=$(hyprctl hyprpaper listloaded)

# Get a random wallpaper that is not the current one
WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)

# Apply the selected wallpaper
hyprctl hyprpaper reload ,"$WALLPAPER"

# pywal wal
wal -n -e -q -i "$WALLPAPER"

# prep colors for hyprland usage
sed -i -e 's/^/$/' ~/.cache/wal/colors-oomox
cp ~/.cache/wal/colors-oomox ~/.config/hypr/colors.conf

# waybar
killall -SIGUSR2 waybar 
