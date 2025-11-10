#!/bin/bash

ln -sf ~/dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -sf ~/dotfiles/fastfetch/config.jsonc ~/.config/fastfetch/config.jsonc

OS="$(uname -s)"



# Only on MacOS
if [ "$OS" == "Darwin" ]; then
	ln -sf ~/dotfiles/.zshrc ~/.zshrc
fi

# Only on Linux
if [ "$OS" == "Linux" ]; then
	ln -sf ~/dotfiles/.bashrc ~/.bashrc
fi
