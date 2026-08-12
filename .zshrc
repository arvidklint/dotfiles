HISTFILE="$HOME/.histfile"
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
bindkey -v

autoload -Uz compinit && compinit

alias c='clear'
alias src='source ~/.zshrc'
alias config='git --git-dir="$HOME/.cfg/" --work-tree="$HOME"'
alias gs='git status'
alias g='lazygit'
alias d='lazydocker'
alias n='nvim'
alias nf='nvim $(fzf --preview="bat {}")'
alias tn='tmux new-session -t'
alias ta='tmux a -t'
alias tk='tmux kill-session -t'

export EDITOR=nvim

if (( $+commands[brew] )); then
  eval "$(brew shellenv)"
fi

typeset -U path PATH
for dir in \
  "$HOME/.local/share/bob/nvim-bin" \
  "${ASDF_DATA_DIR:-$HOME/.asdf}/shims" \
  "$HOME/.local/share/pnpm" \
  "$HOME/.local/bin"; do
  [[ -d $dir ]] && path=($dir $path)
done

export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && . "$NVM_DIR/nvm.sh"
[[ -n $NVM_BIN ]] && path=($NVM_BIN $path)

if (( $+commands[starship] )); then
  eval "$(starship init zsh)"
fi
