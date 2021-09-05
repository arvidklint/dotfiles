# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Aliases
alias ll='ls -alF --color'
alias la='ls -A --color'
alias l='ls -CF --color'

alias ta='tmux attach-session -t'
alias ts='tmux ls'
alias tk='tmux kill-session -t'

alias vim='nvim'
alias vi='nvim'
alias v='nvim'

export EDITOR='nvim'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="~/.composer/vendor/bin:$PATH"
. "$HOME/.cargo/env"

eval "$(starship init bash)"
