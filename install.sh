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

# NVIM (whole folder is linked, so plugin lockfile + any extra files stay in dotfiles)
if [ -d ~/.config/nvim ] && [ ! -L ~/.config/nvim ]; then
	mv -v ~/.config/nvim ~/.config/nvim.bak.$(date +%s)
fi
ln -sfn ~/dotfiles/nvim ~/.config/nvim
if ! command -v tree-sitter >/dev/null 2>&1; then
	echo "NOTE: install tree-sitter-cli for nvim syntax highlighting (see README)"
fi

# GIT
mkdir -pv ~/.config/git/ignore
cp -f ~/dotfiles/git/ignore/.gitignore ~/.config/git/ignore/.gitignore
git config --global core.excludesfile "~/.config/git/ignore/.gitignore"

# AUDIOMIX (works on both Linux and MacOS - path is identical)
ln -sf ~/Documents/code/audiomix/audiomix.sh ~/scripts/audiomix.sh


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
