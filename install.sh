#!/bin/bash
#####################################
# install.sh
# Configure and symlink the dotfiles
# @boxdox
#####################################

######## Variables

dir=~/.dotfiles
olddir=~/dotfiles_backup
dots_to_move="gitconfig xinitrc Xresources zshrc"
config_dirs="bat i3 nvim polybar rofi"

function title() {
	echo -e "\033[1;32m$1\033[0m"
}

######## Begin!
title "Hello, let's begin with installing needed packages..."
sh $dir/scripts/install_packages.sh --all

echo "Phew, that was a lot of packages to process."
echo "Let me create another directory to backup current dots!"

mkdir -p $olddir
mkdir -p ~/.config

######## Backing up dots and symlinking
title "Okay, moving the dots to backup directory..."
title "... and creating symbolic links simultaneously"
for x in $dots_to_move; do
	if [ -f "../.$x" ]; then
		echo "Backing up .$x"
		mv ~/.$x $olddir/
	fi
	ln -sf $dir/$x ~/.$x
done

######## Backing up config directories and symlinking
title "Let's do the same with config directory!"
for x in $config_dirs; do
	if [ -d "~/.config/$x" ]; then
		echo "Backing up $x directory"
		mv ~/.config/$x $olddir/.config/
	fi
	ln -sf $dir/$x ~/.config/
done

######## Copying the fonts and installing
title "Copying the fonts"
mkdir -p ~/.local/share/fonts/
cp -r $dir/fonts ~/.local/share/
echo "Installing fonts..."
fc-cache -f
echo "...done"

######## Setting up Neovim
title "Setting up Neovim!"
if type curl > /dev/null 2>&1; then
	bash $dir/scripts/vim.sh
fi
