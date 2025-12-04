#!/bin/bash

# Only if it were the same for both systems
#ln -sf ~/dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -sf ~/dotfiles/fastfetch/config.jsonc ~/.config/fastfetch/config.jsonc
ln -sf ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim

OS="$(uname -s)"

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
