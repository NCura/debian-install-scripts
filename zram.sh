#!/bin/bash

sudo nala install zram-tools -yy

# Uncomment ALGO=lz4 (regardless of whether there's a space after #)
sudo sed -i 's/# *ALGO=lz4/ALGO=lz4/' /etc/default/zramswap

# Uncomment PERCENT=x and change to PERCENT=10 (regardless of the space and original value)
sudo sed -i 's/# *PERCENT=.*/PERCENT=10/' /etc/default/zramswap

RED='\033[0;31m'
NC='\033[0m'
echo -e "${RED}Please reboot your system to apply changes.${NC}"
