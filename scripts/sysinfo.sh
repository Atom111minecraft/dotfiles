#!/bin/bash

# Цвета для стиля "Системы"
BLUE='\033[0;34m'
CYAN='\033[0;36m'
GOLD='\033[1;33m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# Собираем данные
UPTIME=$(uptime -p | sed 's/up //')
RAM=$(free -h | awk '/Mem:/ { print $3 " / " $2 }')
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}')"%"
DISK=$(df -h / | awk 'NR==2 {print $3 " / " $4}')
PACKAGES=$(pacman -Q | wc -l)

# Отрисовка интерфейса
echo -e "${GOLD}┌───────────────────────────────────────────┐${NC}"
echo -e "${GOLD}│${NC}  ${WHITE}󰣇 STATUS WINDOW: PLAYER KIRILL${NC}          ${GOLD}│${NC}"
echo -e "${GOLD}├───────────────────────────────────────────┤${NC}"
echo -e "${GOLD}│${NC}  ${CYAN}󱑎 LEVEL (Uptime):${NC}  $UPTIME"
echo -e "${GOLD}│${NC}  ${CYAN}󰍛 MEMORY (Mana):${NC}   $RAM"
echo -e "${GOLD}│${NC}  ${CYAN}󰻠 CPU LOAD:${NC}        $CPU"
echo -e "${GOLD}│${NC}  ${CYAN}󰋊 STORAGE:${NC}         $DISK"
echo -e "${GOLD}│${NC}  ${CYAN}󰏖 PACKAGES:${NC}        $PACKAGES"
echo -e "${GOLD}├───────────────────────────────────────────┤${NC}"
echo -e "${GOLD}│${NC}  ${WHITE}CLASS:${NC} ${BLUE}Arch Linux / Sway WM${NC}             ${GOLD}│${NC}"
echo -e "${GOLD}└───────────────────────────────────────────┘${NC}"
