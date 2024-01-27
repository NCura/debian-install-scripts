#!/bin/bash

# Change to the directory containing the scripts
cd ~/.local/share/ncura/debian-install-scripts

# Execute each script in turn
./common-packages.sh
./qtile.sh
./zram.sh
./flatpak.sh
./nvidia.sh

echo "Installation complete. Rebooting now..."
sudo reboot
