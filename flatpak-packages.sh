#!/bin/bash

# Define an array of Flatpak packages
flatpak_packages=(
    org.mozilla.firefox
    com.discordapp.Discord
    org.videolan.VLC
    com.spotify.Client
    com.valvesoftware.Steam
    com.github.tchx84.Flatseal
    com.visualstudio.code
    org.gimp.GIMP
    com.obsproject.Studio
    com.opera.Opera
    org.audacityteam.Audacity
    org.blender.Blender
    org.filezillaproject.Filezilla
    org.openrgb.OpenRGB
    com.unity.UnityHub
)

# Install all packages using flatpak
sudo flatpak install flathub "${flatpak_packages[@]}" -yy
