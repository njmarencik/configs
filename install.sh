#!/bin/bash

echo "///Installing configs..."


echo "///Installing packages..."

# Install packages
sudo pacman -S base-devel hyprland waybar alacritty wofi hyprpaper hyprshot grim slurp blueman bluez bluez-utils dolphin firefox chromium drawio-desktop vlc obs-studio yt-dlp feh pavucontrol htop vim neovim git ripgrep tmux wl-clipboard rsync docker python arm-none-eabi-gcc nmap ufw openssh imagemagick cowsay pipewire pipewire-audio pipewire-pulse wireplumber alsa-utils ttf-dejavu grim slurp fastfetch jq less noto-fonts-emoji


echo "///Enabling setup..."

# Enable bluetooth
sudo systemctl enable --now bluetooth

# Start system audio 
systemctl --user enable --now pipewire pipewire-pulse wireplumber


if [[ "$1" == "newbuild" ]]; then
    echo "///Copying over machine config file for new setup..."
    cp default_machine_config.json $HOME/.machine_config.json
fi


echo "///Moving config files..."
mkdir -p $HOME/.config
cp -r config/* $HOME/.config

echo "///Moving dotfile profiles..."
cp -r profile/bash_profile $HOME/.bash_profile
cp -r profile/bashrc $HOME/.bashrc
cp -r gitconfig $HOME/.gitconfig
cp -r gitconfig-njmarencik $HOME/.gitconfig-njmarencik

echo "///Modifying config files with machine settings..."
FONT_SIZE=$(jq -r '.alacritty.font_size' "$HOME/.machine_config.json")
sed -i "s/^size = .*/size = $FONT_SIZE/" "$HOME/.config/alacritty/alacritty.toml"

FONT_SIZE=$(jq -r '.waybar.font_size' "$HOME/.machine_config.json")
WORKSPACE_WIDTH=$(jq -r '.waybar.workspace_width' "$HOME/.machine_config.json")

sed -i \
    -e "s/font-size: .*/font-size: ${FONT_SIZE}px;/" \
    -e "s/padding: 2px .*/padding: 2px ${WORKSPACE_WIDTH}px;/" \
    "$HOME/.config/waybar/style.css"

echo "///Setting up workspace..."
mkdir ~/Screenshots
mkdir ~/Downloads


echo "///Done!"
