#!/bin/bash
# Oliwier Kulczycki

# Get OS
OS="$(uname -s)"

# KITTY (Terminal)
mkdir -pv ~/.config/kitty
#ln -sf ~/dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf

# Fastfetch
mkdir -pv ~/.config/fastfetch
ln -sf ~/dotfiles/fastfetch/config.jsonc ~/.config/fastfetch/config.jsonc

# NVIM
mkdir -pv ~/.config/nvim
ln -sf ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim

# GIT
mkdir -pv ~/.config/git/ignore
cp -f ~/dotfiles/git/ignore/.gitignore ~/.config/git/ignore/.gitignore
git config --global core.excludesfile "~/.config/git/ignore/.gitignore"


# ----- OS SPECIFIC TWEAKS ----- #
# Only on MacOS
if [ "$OS" == "Darwin" ]; then
	ln -sf ~/dotfiles/.bashrc ~/.zshrc
	ln -sf ~/dotfiles/kitty/kitty-macbook.conf ~/.config/kitty/kitty.conf
fi

# Only on Linux
if [ "$OS" == "Linux" ]; then
	ln -sf ~/dotfiles/.bashrc ~/.bashrc
	ln -sf ~/dotfiles/kitty/kitty-linux.conf ~/.config/kitty/kitty.conf
fi
