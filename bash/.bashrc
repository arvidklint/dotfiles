# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

source /usr/share/doc/fzf/examples/key-bindings.bash
source /usr/share/doc/fzf/examples/completion.bash

# Aliases
alias ll='ls -alF --color'
alias la='ls -A --color'
alias l='ls -CF --color'
alias ls='ls -CF --color'

alias ta='tmux attach-session -t'
alias ts='tmux ls'
alias tk='tmux kill-session -t'
alias tn='tmux new-session -s'

alias vim='nvim'
alias vi='nvim'
alias v='nvim'
alias n='nvim'

alias gs='git status'
alias gl='git log'
alias gwip='git add . && git commit -m "wip"' # add all changes to a 'wip' commit
alias greset='git reset --soft HEAD~1 && git reset' # reset last commit and unstage all files

export EDITOR='nvim'

export TMUXP_CONFIGDIR=~/dotfiles/tmux/sessions/

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="~/.composer/vendor/bin:$PATH"
. "$HOME/.cargo/env"

eval "$(starship init bash)"
