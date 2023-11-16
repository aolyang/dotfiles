#!/usr/bin/env bash

USER=$(whoami)

sudo apt install -y zsh
sudo apt install -y zplug

rm ~/.zshrc
rm ~/.p10k.zsh
ln -s /$USER/.config/dotfiles/shell/.zshrc ~/.zshrc
ln -s /$USER/.config/dotfiles/shell/.p10k.zsh ~/.p10k.zsh

