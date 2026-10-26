#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/wallpapers/used"
# CURRENT_WALL=$(hyprctl hyprpaper listloaded)
WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)

# MONITORS=$(hyprctl monitors -j | jq -r '.[] | select(.disabled | not) | .name')
# for M in $MONITORS; do
#     echo $M
# hyprctl hyprpaper wallpaper $M,"$WALLPAPER"
# done

awww img "$WALLPAPER" --transition-type grow --transition-pos 0.8,0.3 --transition-fps 240 --transition-duration 2

# wpg includes wal
wpg -s "$WALLPAPER"

# prep colors for hyprland usage
sed -i -e 's/^/$/' ~/.cache/wal/colors-oomox
cp ~/.cache/wal/colors-oomox ~/.config/hypr/colors.conf
