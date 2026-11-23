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
alias sourcepyvenv='source .venv/bin/activate'

alias wakeup="ssh oli@hole \"python3 -c \\\"import socket;s=socket.socket(2,2);s.setsockopt(1,6,1);s.sendto(b'\\\\xff'*6+bytes.fromhex('b42e993ab346')*16,('192.168.1.255',9))\\\"\""

# Clear any colour just in case.
echo -e "${Color_Off}"
clear

# Only loads if the file exists (Linux machine), so MacOS doesn't error
[ -f "$HOME/.bash_completions/comfy.sh" ] && source "$HOME/.bash_completions/comfy.sh"

export PATH="$HOME/.local/bin:$PATH"
