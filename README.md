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
| **Visualizer**| Cava |

---

## 🚀 Быстрый старт

1. **Установите зависимости:**
   `sudo pacman -S $(cat packages.txt)`

2. **Примените конфигурацию:**
   `stow sway waybar foot zsh rofi scripts starship cava`

---

## 🛠️ Особенности

### 📊 System Info (Статус Игрока)
Вызывается командой `sys` или `system-info`. Показывает нагрузку на CPU, ману (RAM) и текущий уровень (Uptime).

### 🖼️ Wallpapers
Скрипт `random_wall.sh` меняет обои. Добавьте в конфиг Sway (`~/.config/sway/config`):
`exec_always ~/.local/bin/random_wall.sh`

### 📖 Manga Mode
Оптимизированные бинды и скрипты для чтения манхвы (настройка Wacom).

---
*Сделано с ❤️ на Arch Linux. Поставь ⭐, если используешь!*
