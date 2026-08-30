#!/bin/bash

echo "///Installing configs..."


echo "///Installing packages..."

# Install packages
sudo pacman -S base-devel hyprland waybar alacritty wofi hyprpaper hyprshot grim slurp blueman bluez bluez-utils dolphin firefox chromium drawio-desktop vlc obs-studio yt-dlp feh pavucontrol htop vim neovim git ripgrep tmux wl-clipboard rsync docker python arm-none-eabi-gcc nmap ufw openssh imagemagick cowsay pipewire pipewire-audio pipewire-pulse wireplumber alsa-utils ttf-dejavu grim slurp fastfetch


echo "///Enabling setup..."

# Enable bluetooth
sudo systemctl enable --now bluetooth

# Start system audio 
systemctl --user enable --now pipewire pipewire-pulse wireplumber


echo "///Moving config files..."
mkdir -p $HOME/.config
cp config/* $HOME/.config

echo "///Moving dotfile profiles..."
cp profile/bash_profile $HOME/.bash_profile
cp profile/bashrc $HOME/.bashrc
cp gitconfig $HOME/.gitconifig
cp gitconfig-njmarencik $HOME/.gitconfig-njmarencik

echo "///Setting up workspace..."
mkdir ~/Screenshots
mkdir ~/Downloads


echo "///Done!"
