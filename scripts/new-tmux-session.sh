#!/bin/bash

printf "Create a new tmux session launcher\n"

read -p "Name: " SESSION

SCRIPT="session=$SESSION"$'\n'
SCRIPT+="tmux new-session -d -s $SESSION"$'\n\n'

WINDOW_COUNT=0

read -p "Name of window $WINDOW_COUNT: " WINDOW_NAME
SCRIPT+="tmux rename-window -t 0 '$WINDOW_NAME'"$'\n'

read -p "Startup command: " STARTUP_COMMAND

SCRIPT+="tmux send-keys -t '$WINDOW_NAME' '$STARTUP_COMMAND' C-m"$'\n'

while :
do
  ((WINDOW_COUNT+=1))

  read -p "Name of window $WINDOW_COUNT (q to break): " WINDOW_NAME

  if [ "$WINDOW_NAME" = "q" ]; then
		break
	fi
  SCRIPT+=$'\n'"tmux new-window -t $SESSION:$WINDOW_COUNT -n '$WINDOW_NAME'"$'\n'

  read -p "Startup command ($STARTUP_COMMAND): " NEW_STARTUP_COMMAND
  if [ "$NEW_STARTUP_COMMAND" != "" ]; then
    STARTUP_COMMAND=$NEW_STARTUP_COMMAND
	fi
  SCRIPT+="tmux send-keys -t '$WINDOW_NAME' '$STARTUP_COMMAND' C-m"$'\n'
done

SCRIPT+=$'\n'"tmux attach-session -t $SESSION:0"

mkdir -p ~/dotfiles/tmux/sessions

FILE=~/dotfiles/tmux/sessions/$SESSION.sh
touch $FILE

echo "$SCRIPT" > $FILE

printf "\nTmux launch-script for %s has been created\n" $SESSION
printf "Start the session with 'ts %s'" $SESSION

# Possible tmux scripting to include in the future...
# tmux split-window -h(v)
# tmux select-pane -L(R/U/D)
