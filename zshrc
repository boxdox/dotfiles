# Path to your oh-my-zsh installation.
export ZSH="/home/boxdox/.oh-my-zsh"

# ZSH Theme
ZSH_THEME="robbyrussell"

# Use case sensitive auto-completion
CASE_SENSITIVE="true"

# Set this if pasting URL becomes weird
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Command execution time format
HIST_STAMPS="yyyy-mm-dd"

# Load the plugins
plugins=(
	git
	sudo
)

# Source oh-my-zsh!
source $ZSH/oh-my-zsh.sh

# Custom sourcing
[[ -f ~/.dotfiles/exports ]] && source ~/.dotfiles/exports
[[ -f ~/.dotfiles/alias ]] && source ~/.dotfiles/alias

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
