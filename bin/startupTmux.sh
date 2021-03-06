#!/bin/sh
tmux start-server
tmux new-session -d -s Haystack -n git
tmux new-window -tHaystack:1 -n all
tmux select-window -tHaystack:1
tmux split-window
tmux select-pane -t Haystack:1.0
tmux split-window -h
tmux select-pane -t Haystack:1.2
tmux split-window -h

tmux send-keys -tHaystack:1.0 "ssh gen2" C-m
tmux send-keys -tHaystack:1.1 "ssh check" C-m
tmux send-keys -tHaystack:1.2 "ssh server" C-m
tmux send-keys -tHaystack:1.3 "ssh vacha" C-m

tmux attach-session -d -tHaystack
