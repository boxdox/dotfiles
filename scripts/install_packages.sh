#!/bin/bash
#@File: install_packages.sh
#@Author: boxdox

# Package list
essential="i3-gaps rxvt-unicode nano neovim git curl zsh ttf-hack feh python-pywal rofi"
extra="htop bat neofetch ranger fzf firefox"
all="$essential $extra"

# Install Yay
function install_yay() {
	if !type yay > /dev/null 2>&1; then
		sh yay.sh
	fi
}

# Install Oh-My-ZSH
function install_omz() {
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

case $1 in
	--essential)
		echo "Installing: $essential"
		sudo pacman --noconfirm -Syu $essentials
		install_omz
		install_yay
		yay -Sy polybar
		;;
	--extra)
		echo "Installing: $extra"
		sudo pacman --noconfirm -Syu $extra
		;;
	--all)
		echo "Installing: $all"
		sudo pacman --noconfirm -Syu $all
		install_omz
		install_yay
		yay -Sy polybar
		;;
	*)
		echo "Unknown Option"
		exit
		;;
esac