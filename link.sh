#!/bin/bash

mkdir ~/.config

ln -sv ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf

# bash/starship
mkdir ~/.config/bash
ln -sv ~/dotfiles/bash/.bashrc ~/.bashrc
ln -sv ~/dotfiles/bash/starship.toml ~/.config/starship.toml

mkdir ~/.config/alacritty
ln -sv ~/dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

# Link all nvim files
(cd ~/dotfiles/nvim && . ./install.sh)
