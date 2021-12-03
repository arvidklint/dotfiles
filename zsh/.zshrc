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

export EDITOR='nvim'

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

eval "$(starship init zsh)"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
