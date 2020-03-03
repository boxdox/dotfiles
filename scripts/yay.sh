#!/bin/bash
#@File: yay.sh
#@Author: boxdox

if type yay > /dev/null 2>&1; then
	echo "Yay is already installed. Exiting."
else
	# Install base dependencies for building packages
	echo "Installing base dependencies:"
	sudo pacman -S --needed base base-devel curl git

	# Create a temporary directory
	tempdir="$(mktemp -d)"
	cd $tempdir

	# Run the build commands
	echo "Cloning Yay repo into temporary directory"
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si
	cd ..
	
	# Check if build was successful.
	if type yay > /dev/null 2>&1; then
		echo "Yay successfully installed!".
		exit
	else
		echo "Some error occured during installation"
	fi
	
	# Remove the temporary directory
	rm -rf $tempdir
fi