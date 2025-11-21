#!/bin/bash

if ! command -v yay &> /dev/null; then
    echo "Installing yay..."
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay
    makepkg -si
    cd -
fi

echo "Removing packages..."
yay -Rns --noconfirm \
    hyprland hyprlock waybar rofi hyprpaper \
    bibata-cursor-theme-bin grim slurp wl-clipboard \
    kitty ranger

echo "Removing configs..."
rm -rf ~/.config/hypr
rm -rf ~/.config/kitty
rm -rf ~/.config/waybar
rm -rf ~/.config/rofi

echo "Removed!"
echo "Rebooting..."
echo "3"
sleep 1
echo "2"
sleep 1
echo "1"
sleep 1
reboot
