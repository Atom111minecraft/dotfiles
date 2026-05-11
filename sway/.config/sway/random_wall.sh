#!/bin/bash

set -euo pipefail

# Конфигурация
DIR="${1:-/home/kirill/Pictures/Wallpapers}"
CACHE_DIR="$HOME/.cache/awww"
LOG_FILE="$CACHE_DIR/wallpaper.log"

# Создаём кэш‑директорию
mkdir -p "$CACHE_DIR"

# Логирование
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

# Функция запуска демона
start_daemon() {
    if ! pgrep -x "awww-daemon" > /dev/null; then
        log "Запуск awww-daemon..."
        awww-daemon --format xrgb &
        sleep 3
    fi
}

# Функция поиска всех изображений
find_images() {
    IMAGES=()
    while IFS= read -r -d '' file; do
        IMAGES+=("$file")
    done < <(find "$DIR" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.gif" -o -name "*.bmp" -o -name "*.webp" \) -print0 2>/dev/null)
}

# Функция выбора случайного изображения
random_wallpaper() {
    find_images
    if [ ${#IMAGES[@]} -eq 0 ]; then
        echo "Картинки не найдены в $DIR"
        log "Ошибка: картинки не найдены в $DIR"
        exit 1
    fi
    WALLPAPER="${IMAGES[RANDOM % ${#IMAGES[@]}]}"
    apply_wallpaper "$WALLPAPER"
}

# Функция интерактивного выбора
interactive_choice() {
    find_images
    if [ ${#IMAGES[@]} -eq 0 ]; then
        echo "Картинки не найдены в $DIR"
        log "Ошибка: картинки не найдены в $DIR"
        exit 1
    fi

    echo "Доступные обои (всего: ${#IMAGES[@]}):"
    for i in "${#IMAGES[@]}"; do
        echo "$((i+1)). $(basename "${IMAGES[i]}")"
    done

    read -p "Выберите номер изображения (1-${#IMAGES[@]}): " choice
    if [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -ge 1 ] && [ "$choice" -le "${#IMAGES[@]}" ]; then
        WALLPAPER="${IMAGES[$((choice-1))]}"
        apply_wallpaper "$WALLPAPER"
    else
        echo "Неверный выбор"
        exit 1
    fi
}

# Функция циклического переключения
cycle_wallpapers() {
    find_images
    if [ ${#IMAGES[@]} -eq 0 ]; then
        echo "Картинки не найдены в $DIR"
        log "Ошибка: картинки не найдены в $DIR"
        exit 1
    fi

    LAST_INDEX_FILE="$CACHE_DIR/last_wallpaper_index"
    if [ -f "$LAST_INDEX_FILE" ]; then
        LAST_INDEX=$(cat "$LAST_INDEX_FILE")
    else
        LAST_INDEX=0
    fi

    NEXT_INDEX=$(( (LAST_INDEX + 1) % ${#IMAGES[@]} ))
    WALLPAPER="${IMAGES[$NEXT_INDEX]}"
    echo "$NEXT_INDEX" > "$LAST_INDEX_FILE"
    apply_wallpaper "$WALLPAPER"
}

# Функция случайного выбора без повторов
random_no_repeat() {
    find_images
    if [ ${#IMAGES[@]} -eq 0 ]; then
        echo "Картинки не найдены в $DIR"
        log "Ошибка: картинки не найдены в $DIR"
        exit 1
    fi

    HISTORY_FILE="$CACHE_DIR/wallpaper_history"
    mapfile -t HISTORY < "$HISTORY_FILE" 2>/dev/null || HISTORY=()

    AVAILABLE=()
    for img in "${IMAGES[@]}"; do
        if [[ ! " ${HISTORY[*]} " =~ " $img " ]]; then
            AVAILABLE+=("$img")
        fi
    done

    if [ ${#AVAILABLE[@]} -eq 0 ]; then
        AVAILABLE=("${IMAGES[@]}")
        > "$HISTORY_FILE"
        HISTORY=()
    fi

    # Исправлено: добавлены фигурные скобки вокруг вычисления индекса
    WALLPAPER="${AVAILABLE[$(( RANDOM % ${#AVAILABLE[@]} ))]}"
    echo "$WALLPAPER" >> "$HISTORY_FILE"
    apply_wallpaper "$WALLPAPER"
}

# Функции восстановления и очистки
restore_previous() {
    log "Восстановление предыдущих обоев"
    # Исправлено: команда вынесена в отдельную переменную для ясности
    if awww restore >> "$LOG_FILE" 2>&1; then
        echo "Восстановлены предыдущие обои"
        log "Успешно восстановлены"
    else
        echo "Ошибка при восстановлении обоев"
        log "Ошибка восстановления обоев"
        exit 1
    fi
}

clear_cache() {
    log "Очистка кэша awww"
    # Исправлено: аналогично restore
    if awww clear-cache >> "$LOG_FILE" 2>&1; then
        echo "Кэш awww очищен"
        log "Кэш успешно очищен"
    else
        echo "Ошибка при очистке кэша"
        log "Ошибка очистки кэша"
        exit 1
    fi
}

apply_wallpaper() {
    local wallpaper="$1"
    log "Установка обоев: $wallpaper"
    # Исправлено: аналогично предыдущим функциям
    if awww img "$wallpaper" >> "$LOG_FILE" 2>&1; then
        echo "Успешно установлены обои: $(basename "$wallpaper")"
        log "Успешно"
    else
        echo "Ошибка установки обоев: $wallpaper"
        log "Ошибка установки обоев"
        exit 1
    fi
}

# Главное меню
echo "=== Выбор обоев ==="
echo "1. Выбрать обои вручную"
echo "2. Случайные обои"
echo "3. Циклическое переключение"
echo "4. Случайные без повторов"
echo "5. Восстановить предыдущие обои"
echo "6. Очистить кэш awww"
# Исправлено: кавычки сбалансированы
read -p "Выберите вариант (1–6): " choice


start_daemon

case "$choice" in
    1)
        interactive_choice
        ;;
    2)
        random_wallpaper
        ;;
    3)
        cycle_wallpapers
        ;;
    4)
        random_no_repeat
        ;;
    5)
        restore_previous
        ;;
    6)
        clear_cache
        ;;
    *)
        echo "Неверный выбор"
        exit 1
        ;;
esac
