# 󰣇 Atom111's Dotfiles | PLAYER: KIRILL

> "System, update my configuration." – Конфиги для Arch Linux + Sway, заточенные под продуктивность и эстетику манхвы.

---

## 🖥️ The Stack (S-Rank)

| Component | Choice |
| :--- | :--- |
| **OS** | Arch Linux 󰣇 |
| **WM** | [Sway](https://swaywm.org/) |
| **Shell** | Zsh + Starship |
| **Terminal** | Foot |
| **Launcher** | Rofi-Wayland |

---

## 🚀 Быстрый старт

1. **Установите пакеты:**
   `sudo pacman -S $(cat packages.txt)`

2. **Примените конфигурацию:**
   `stow sway waybar foot zsh rofi scripts starship`

---

## 🛠️ Особенности Системы

### 📊 System Info (Статус Игрока)
Вызывается командой `sys` или `system-info`. Показывает нагрузку на CPU, ману (RAM) и текущий уровень (Uptime) в стиле игрового интерфейса.

### 📖 Manga Mode
Скрипты и настройки для комфортного чтения. (Используйте Wacom или горячие клавиши для перелистывания).

### 🖼️ Wallpapers
Скрипт `random_wall.sh` в папке `scripts` автоматически меняет обои. Можно добавить в автозагрузку Sway:
`exec_always ~/.local/bin/random_wall.sh`

---

## 📂 Структура
* `zsh/` – Конфиг оболочки.
* `scripts/` – Полезные инструменты (идут в `~/.local/bin`).
* `starship/` – Кастомный вид командной строки.

*Сделано с ❤️ на Arch Linux. Не забудьте поставить ⭐, если используете!*
