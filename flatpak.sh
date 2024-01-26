#!/bin/bash

sudo nala install flatpak -yy
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

RED='\033[0;31m'
NC='\033[0m'
echo -e "${RED}Please reboot your system to apply changes.${NC}"
