#!/bin/bash

mkdir -p ~/.config/nvim/plugin
mkdir -p ~/.config/nvim/after/plugin
mkdir -p ~/.config/nvim/lua/config

for f in $(find . -name '*.lua'); do
# for f in **/*.lua; do
  rm -f ~/.config/nvim/$f
  ln -sv ~/dotfiles/nvim/$f ~/.config/nvim/$f
done
