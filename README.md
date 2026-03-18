# 󰣇 Atom111's Dotfiles | Arch Linux & Sway

> Мои личные конфигурационные файлы для максимально комфортной работы в Wayland. 
> Управляется через GNU Stow для быстрой синхронизации и порядка в системе.

---

## 🖥️ Система (The Stack)

| Компонент | Выбор |
| :--- | :--- |
| **OS** | Arch Linux 󰣇 |
| **WM** | [Sway](https://swaywm.org/) (Wayland) |
| **Shell** | `zsh` + Starship prompt |
| **Terminal** | `foot` (минималистичный и быстрый) |
| **Launcher** | `rofi-wayland` |
| **Bar** | `Waybar` |
| **Browser** | `Floorp` |

---

## ✨ Основные фишки

* 🖼️ **Dynamic Wallpapers:** Скрипт `random_wall.sh` для автоматической смены атмосферы.
* 🛠️ **Easy Management:** Все конфиги разбиты на пакеты для удобного использования через `stow`.
* ⚡ **Performance:** Оптимизировано под низкие задержки и быстрый отклик.
* 📦 **Dotsync:** Простая интеграция для бэкапа и синхронизации настроек.

---

## 🚀 Быстрый старт

### 1. Подготовка
Убедитесь, что в системе установлен `stow`:
```bash
sudo pacman -S stow git

### 2. Клонирование репозитория
git clone [https://github.com/Atom111minecraft/dotfiles.git](https://github.com/Atom111minecraft/dotfiles.git)
cd dotfiles

### 3. Развертывание конфигов
stow sway waybar foot zsh rofi
