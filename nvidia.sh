#!/bin/bash

sudo nala install nvidia-driver nvidia-detect

RED='\033[0;31m'
NC='\033[0m'
echo -e "${RED}Please reboot your system to apply changes.${NC}"
