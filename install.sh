#!/bin/bash

# install starship prompt
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# link all files
. ./link.sh
