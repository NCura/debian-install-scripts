#!/bin/bash

nala_packages=(
    neovim
    exa
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
    # dunst sxiv
)

sudo nala install "${nala_packages[@]}" -yy

xdg-user-dirs-update
git config --global user.name "Nicolas Cura"
git config --global user.email "nicolas.cura@icloud.com"
