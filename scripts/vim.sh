#!/bin/bash
#@File: vim.sh
#@Author: boxdox

## Check if curl exists on system
if type curl > /dev/null 2>&1; then
	## Download Vim-Plug from Github
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	nvim +PlugInstall +qall
else
	echo "Please install curl, then run this script again"
fi
