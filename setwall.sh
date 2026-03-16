#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/wallpapers/used"
CURRENT_WALL=$(hyprctl hyprpaper listloaded)
WALLPAPER="$HOME/wallpapers/moon.png"

MONITORS=$(hyprctl monitors -j | jq -r '.[] | select(.disabled | not) | .name')
for M in $MONITORS; do
    echo $M
    hyprctl hyprpaper reload $M,"$WALLPAPER"
done

#wpg includes wal
wpg -s "$WALLPAPER"

# prep colors for hyprland usage
sed -i -e 's/^/$/' ~/.cache/wal/colors-oomox
cp ~/.cache/wal/colors-oomox ~/.config/hypr/colors.conf

# waybar
killall -SIGUSR2 waybar 

# pywallfox
pywalfox update
