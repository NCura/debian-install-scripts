#!/bin/bash

# Change to the directory containing the scripts
cd ~/.local/share/ncura/debian-install-scripts

# Make each script executable
chmod +x common-packages.sh
chmod +x qtile.sh
chmod +x zram.sh
chmod +x flatpak.sh
chmod +x nvidia.sh

# Execute each script in turn
./common-packages.sh
./qtile.sh
./zram.sh
./flatpak.sh
./nvidia.sh

echo "Installation complete. Rebooting now..."
reboot
