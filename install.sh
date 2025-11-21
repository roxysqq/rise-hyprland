#!/bin/bash

if ! command -v yay &> /dev/null; then
    echo "Install yay..."
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay
    makepkg -si
    cd -
fi

echo "Installing packages..."
yay -S --noconfirm --needed \
    hyprland hyprlock waybar rofi hyprpaper \
    bibata-cursor-theme-bin grim slurp wl-clipboard \
    kitty ranger

echo "Config..."
mkdir -p ~/.config/{hypr,kitty,waybar,rofi}
cp -r config/hypr/* ~/.config/hypr/
cp -r config/kitty/* ~/.config/kitty/
cp -r config/waybar/* ~/.config/waybar/
cp -r config/rofi/* ~/.config/rofi/

echo "Installed!"
echo "Reboot..."
echo "3"
sleep 1
echo "2"
sleep 1
echo "1"
sleep 1
reboot
