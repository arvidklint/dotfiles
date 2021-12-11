session=veraklint
tmux new-session -d -s veraklint

tmux rename-window -t 1 'editor'
tmux send-keys -t 'editor' 'cd ~/dev/veraklint.com && nvim' C-m

tmux new-window -t veraklint:2 -n 'servers'
tmux send-keys -t 'servers' 'cd ~/dev/veraklint.com/server && npm run serve' C-m
tmux split-window -h
tmux send-keys -t 'servers' 'cd ~/dev/veraklint.com/client && npm run serve' C-m

tmux attach-session -t veraklint:1
