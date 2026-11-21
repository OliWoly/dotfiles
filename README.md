# DOTFILES
*(should work cross platform, with MACOS using .zshrc, Linux using .bashrc)*
Cross-platform applications' config files should be added to the install.sh script.

> MUST BE INSTALLED IN THE HOME DIRECTORY, OTHERWISE THE INSTALL SCRIPT WILL NOT WORK.

## Neovim
Needs **Neovim 0.12+** (for the built-in `vim.pack` plugin manager), plus `git`, `curl`, `tar`,
a C compiler and **tree-sitter-cli 0.26.1+** (to build syntax highlighting parsers).

| OS | Install |
|---|---|
| macOS | `brew install neovim tree-sitter-cli` |
| Arch | `sudo pacman -S neovim tree-sitter-cli base-devel` |
| Fedora | `sudo dnf install neovim tree-sitter-cli gcc` |
| Debian/Ubuntu | apt versions are too old: get nvim from [GitHub releases](https://github.com/neovim/neovim/releases) and `tree-sitter` from [its releases](https://github.com/tree-sitter/tree-sitter/releases) (or `cargo install --locked tree-sitter-cli`), plus `sudo apt install build-essential` |

Plugins install themselves the first time `nvim` is opened. Versions are pinned in `nvim/nvim-pack-lock.json`.
