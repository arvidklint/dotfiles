# Dotfiles

This repository is a bare Git repository at `~/.cfg`. It tracks selected files directly in `$HOME`; there are no symlinks or configuration managers.

## Set up a new computer

1. Install Git and configure GitHub SSH access.
2. Clone the repository and check out the files:

```sh
git clone --bare git@github.com:arvidklint/dotfiles.git "$HOME/.cfg"
cfg() { git --git-dir="$HOME/.cfg" --work-tree="$HOME" "$@"; }
cfg config --local status.showUntrackedFiles no
cfg checkout
```

If checkout reports existing files that would be overwritten, move those named files somewhere safe (for example `~/.cfg-backup/`) and run `cfg checkout` again.

3. Start a new zsh session, or run:

```sh
source ~/.zshrc
```

The checked-out `.zshrc` provides the `config` command:

```sh
config status
```

## Daily use

```sh
config status
config add .zshrc .config/nvim
config commit -m "describe the change"
config push
```

Untracked files are hidden deliberately. Add only the exact files you want to share; do not use `config add -A`.
