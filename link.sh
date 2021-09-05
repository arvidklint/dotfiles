mkdir -p ~/.config

ln -sv ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf

# bash/starship
ln -sv ~/dotfiles/bash/.bashrc ~/.bashrc
ln -sv ~/dotfiles/bash/starship.toml ~/.config/starship.toml

# Link all nvim files
(cd ~/dotfiles/nvim && . ./install.sh)
