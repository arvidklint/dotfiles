session=config
tmux new-session -d -s config

tmux rename-window -t 1 'dotfiles'
tmux send-keys -t 'dotfiles' 'cd ~/dotfiles && nvim' C-m

tmux attach-session -t config:1
