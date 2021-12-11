#!/bin/bash

# Install brew
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install tmux

if [[ `uname -m` == 'arm64' ]]; then
  echo "Installing for M1 chip\n"
  arch -arm64 brew install ripgrep
  arch -arm64 brew install neovim
  arch -arm64 brew install antibody
else
  brew install ripgrep
  brew install neovim
  brew install antibody
fi

antibody bundle < ~/dotfiles/zsh/zsh_plugins.txt > ~/.zsh_plugins.sh

# install tmux package manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Fonts
cp -v ./fonts/dejavu/* ~/Library/Fonts/
