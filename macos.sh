#!/bin/bash

# Install brew
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

if [[ `uname -m` == 'arm64' ]]; then
  echo "Installing for M1 chip\n"
  arch -arm64 brew install ripgrep
  arch -arm64 brew install neovim
else
  brew install ripgrep
  brew install neovim
fi

# Fonts
cp -v ./fonts/dejavu/* ~/Library/Fonts/
