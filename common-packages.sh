#!/bin/bash

nala_packages=(
    neovim
    exa
    kitty
    xwallpaper
    xdg-user-dirs
    pulsemixer
    pulseaudio
    alsa-utils
    libavcodec-extra
    rofi
    ranger
    sxhkd
    curl
    ueberzug
    picom
    zip
    unzip
    micro
    bluetooth
    pulseaudio-module-bluetooth
    # keynav
    # dunst sxiv
)

sudo nala install "${nala_packages[@]}" -yy

xdg-user-dirs-update
git config --global user.name "Nicolas Cura"
git config --global user.email "nicolas.cura@icloud.com"
