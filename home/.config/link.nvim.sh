#!/usr/bin/env bash

# if args include --reset, remove local file
if [[ $* == *--reset* ]]; then
    rm -rf ~/.local/share/nvim
fi

# rm NvChad old custom config file
rm -rf ~/.config/nvim/custom
ln -s ~/dotfiles/home/.config/nvim/custom ~/.config/nvim/lua/custom
