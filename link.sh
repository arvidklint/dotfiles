#!/bin/bash

mkdir ~/.config

ln -sv ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf

# starship
ln -sv ~/dotfiles/starship/starship.toml ~/.config/starship.toml

# bashrc
# ln -sv ~/dotfiles/bash/.bashrc ~/.bashrc

# zsh
ln -sv ~/dotfiles/zsh/.zshrc ~/.zshrc

mkdir ~/.config/alacritty
ln -sv ~/dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

# Link all nvim files
(cd ~/dotfiles/nvim && . ./install.sh)
