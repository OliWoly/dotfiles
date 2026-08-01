#!/bin/bash
# Oliwier Kulczycki
source $HOME/scripts/colours.sh
export CLICOLOR=1

# Optional Fastfetch
# fastfetch
alias ff='fastfetch'
alias nf='neofetch'


alias vi=nvim
alias vim=nvim
alias ls='ls -G'
alias ll='ls -lG'
alias lla='ls -laG'

# Custom Command Aliases as scripts
source $HOME/dotfiles/customcommandalias.sh
alias httpserver='python3 -m http.server 25570'

# Clear any colour just in case.
echo -e "${Color_Off}"
clear

source '/home/oli/.bash_completions/comfy.sh'


export PATH="/home/oli/.local/bin:$PATH"
