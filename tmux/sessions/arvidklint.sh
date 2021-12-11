session=arvidklint
tmux new-session -d -s arvidklint

tmux rename-window -t 1 'editor'
tmux send-keys -t 'editor' 'cd ~/dev/arvidklint.com && nvim' C-m

tmux new-window -t arvidklint:2 -n 'server'
tmux send-keys -t 'server' 'cd ~/dev/arvidklint.com && nvm use && npm run dev' C-m

tmux attach-session -t arvidklint:1
