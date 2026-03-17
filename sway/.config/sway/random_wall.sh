#!/bin/bash
# Проверяем, запущен ли демон, если нет — запускаем
pgrep -x swww-daemon > /dev/null || swww-daemon --format xrgb &
sleep 0.5

DIR="/home/kirill/Pictures/Wallpapers"
WALLPAPER=$(find "$DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.jpeg" \) | shuf -n 1)

if [ -n "$WALLPAPER" ]; then
    swww img "$WALLPAPER" --transition-type center --transition-step 60
else
    echo "Картинки не найдены в $DIR"
fi
