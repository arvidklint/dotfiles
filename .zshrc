# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/arvid/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Aliases
alias c='clear'

alias src='source ~/.zshrc'
alias config='git --git-dir="$HOME/.cfg/" --work-tree="$HOME"'

alias gs='git status'

alias lzg='lazygit'
alias g='lazygit'
alias lzd='lazydocker'
alias d='lazydocker'

alias n='nvim'
alias nf='nvim $(fzf --preview="bat {}")'

alias tn='tmux new-session -t'
alias ta='tmux a -t'
alias tk='tmux kill-session -t'

# delete stupid Zone.Identifier window meta files
alias deletezoneidentifier='find . -name "*.Identifier" -type f -delete'

export EDITOR='nvim'
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
typeset -U path PATH

export NVM_DIR="$HOME/.nvm"
  [ -s "${HOMEBREW_PREFIX}/opt/nvm/nvm.sh" ] && \. "${HOMEBREW_PREFIX}/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "${HOMEBREW_PREFIX}/opt/nvm/etc/bash_completion.d/nvm" ] && \. "${HOMEBREW_PREFIX}/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/arvid/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# asdf
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# zig
export PATH=$PATH:~/dev/zig

# export PATH=$HOME//home/linuxbrew/.linuxbrew/Cellar/erlang/28.0/lib/erlang/erts-16.0/bin:$PATH
# export PATH=$HOME//home/linuxbrew/.linuxbrew/bin:$PATH

eval "$(starship init zsh)"

export PATH="/home/arvid/.local/share/bob/nvim-bin/:$PATH"
export PATH="/home/arvid/.local/share/nvim/site/:$PATH"

. "$HOME/.local/bin/env"

# Ensure the nvm-managed node wins over Homebrew's node.
# brew shellenv (above) prepends Homebrew's bin, and `nvm use` only swaps
# the version in place, so re-prepend the active nvm bin last.
if [ -n "$NVM_BIN" ]; then
  export PATH="$NVM_BIN:${PATH//$NVM_BIN:/}"
fi
