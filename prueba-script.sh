#!/usr/bin/env bash

# Servidor grafico
sudo apt install -y xorg xserver-xorg xbacklight xbindkeys xvkbd xinput

# PACKAGE INCLUDES build-essential.
sudo apt install -y build-essential meson

# Crea carpetas de usuario
xdg-user-dirs-update
#I3 window manager
sudo apt install -y i3 i3blocks i3gaps i3lock suckless-tools

# XFCE4 Minimal
#sudo apt install -y xfwm4

# Network File Tools/System Events
sudo apt install -y dialog mtools dosfstools avahi-daemon acpi acpid gvfs-backends xfce4-power-manager

sudo systemctl enable avahi-daemon
sudo systemctl enable acpid

# Manejo de Archivos
sudo apt install -y  xarchiver zip unzip rar unrar mtp-tools traceroute acl gnupg2 mlocate apt-transport-https curl ntfs-3g

# Networking etc
sudo apt install -y policykit-1-gnome network-manager network-manager-gnome

# Thunar
sudo apt install -y thunar thunar-archive-plugin thunar-volman

# Terminal (descomentar para instalar)
sudo apt install -y xfce4-terminal
#sudo apt install -y kitty
#sudo apt install -y tilix
#sudo apt install -y sakura
#sudo apt install -y terminator

# Sonido
sudo apt install -y pulseaudio alsa-utils pavucontrol volumeicon-alsa pamixer pnmixer

# Monitores
sudo apt install -y neofetch btop

# Installation for Appearance management
sudo apt install -y lxappearance

# Browser Installation (eg. chromium)
sudo apt install -y firefox-esr

# Desktop background browser/handler
sudo apt install -y nitrogen

# Fonts and icons for now
sudo apt install -y fonts-recommended fonts-ubuntu fonts-font-awesome fonts-terminus papirus-icon-theme

# bluetooth
sudo apt install -y bluez blueman
sudo systemctl enable bluetooth

# Packages needed for window manager installation
sudo apt install -y picom rofi dunst libnotify-bin unzip wmctrl xdotool libnotify-dev polybar

# Editores de texto
sudo apt install -y mousepad micro

# Multimedia
sudo apt install -y vlc flameshot ristretto

# Luz del teclado
sudo apt install -y brightnessctl

# PDF
sudo apt install -y  atril

# Dependencies for Ly Console Manager
sudo apt install -y libpam0g-dev libxcb-xkb-dev

# Install the Ly Console Display Manager
bash ~/MyDebianScripts/ly.sh

########################################################
# End of script for default config
# Nerd fonts
sudo apt install unzip -y

mkdir -p ~/.local/share/fonts

cd /tmp
fonts=( 
"CascadiaCode"
"FiraCode"  
"Hack"  
"Inconsolata"
"JetBrainsMono" 
"Meslo"
"Mononoki" 
"RobotoMono" 
"SourceCodePro" 
"UbuntuMono"
)

for font in ${fonts[@]}
do
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/$font.zip
	unzip $font.zip -d $HOME/.local/share/fonts/$font/
    rm $font.zip
done
fc-cache

sudo apt autoremove

printf "\e[1;32mYou can now reboot! Thanks you.\e[0m\n"
