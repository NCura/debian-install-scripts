#!/bin/bash
# declare colors
red='\033[0;31m'
nc='\033[0m'
yellow='\033[0;33m'

#directories
qtilevenv="$HOME/.local/src/qtile_venv"
bindir="$HOME/.local/bin"
qtileconfigdir="$HOME/.config/qtile"

sudo nala update -yy

sudo nala install xorg xserver-xorg python3 python3-pip python3-venv python3-v-sim python-dbus-dev \
    libpangocairo-1.0-0 python3-xcffib python3-cairocffi libxkbcommon-dev libxkbcommon-x11-dev -yy

[ -e "$qtilevenv" ] || python3 -m venv $qtilevenv 

[ -e "$bindir" ] || mkdir -p $bindir

git clone https://github.com/qtile/qtile.git $qtilevenv/qtile

$qtilevenv/bin/pip install $qtilevenv/qtile/.

if [ -e "$qtileconfigdir"/config.py ]; then 
	echo ""
	printf ${red}" NOTE:    ${yellow}using your existing config.py ${nc}\n"
	echo ""
else 
	mkdir $qtileconfigdir
	cp $qtilevenv/qtile/libqtile/resources/default_config.py $qtileconfigdir/config.py
	echo ""
	printf ${red}" NOTE:    ${yellow}copied default qtile config to $qtileconfigdir${nc}\n"
	echo ""
fi 

ln -sf $qtilevenv/bin/qtile $bindir && \
printf ${red}"Please REBOOT\n${nc} \n"
