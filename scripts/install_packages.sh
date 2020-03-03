#!/bin/bash
#@File: install_packages.sh
#@Author: boxdox

# Package list
essential="i3-gaps rxvt-unicode nano neovim git zsh ttf-hack feh python-pywal rofi"
extra="htop bat neofetch ranger fzf firefox"
all=$essential+$extra

# Install Yay
function install_yay() {
	if !type yay > /dev/null 2>&1; then
		sh yay.sh
	fi
}

case $1 in
	--essential)
		echo "Installing: $essential"
		sudo pacman -Syu $essentials
		install_yay()	
		yay -Sy polybar
		;;
	--extra)
		echo "Installing: $extra"
		sudo pacman -Syu $extra
		;;
	--all)
		echo "Installing: $all"
		sudo pacman -Syu $all
		install_yay()
		yay -Sy polybar
		;;
	*)
		echo "Unknown Option"
		exit
		;;
esac