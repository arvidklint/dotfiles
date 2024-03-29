# Plugins
source ~/.zsh_plugins.sh

# Aliases
alias src='source ~/.zshrc'
alias plug='antibody bundle < ~/dotfiles/zsh/zsh_plugins.txt > ~/.zsh_plugins.sh'

alias ll='ls -alF --color'
alias la='ls -A --color'
alias l='ls -CF --color'
alias ls='ls -CF --color'

alias ta='tmux attach-session -t'
alias tls='tmux ls'
alias tk='tmux kill-session -t'
alias ts='tmuxp load'
alias tn='tmux new -s'

alias vim='nvim'
alias vi='nvim'
alias v='nvim'
alias n='nvim'

# git
alias gs='git status'
alias gc='git checkout'

# docker
alias dsa='docker stop $(docker ps -q)' # stop all running docker containers

export EDITOR='nvim'

export TMUXP_CONFIGDIR=~/dotfiles/tmux/sessions/

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

eval "$(starship init zsh)"
