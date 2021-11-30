#!/bin/bash

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install ripgrep

# Fonts
cp -v ./fonts/dejavu/* ~/Library/Fonts/
