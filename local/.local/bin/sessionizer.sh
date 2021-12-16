#!/usr/bin/env bash

# https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/bin/tmux-sessionizer

# checks for the directory in which session should start
if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find ~/www ~/www/rust ~/www/cpp ~/go/src/github.com/Gabriel2233 -mindepth 1 -maxdepth 1 -type d | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)
if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
fi

if ! tmux has-session -t $selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected
fi

if [[ -z $TMUX ]]; then
    tmux attach-session -t $selected_name
else
    tmux switch-client -t $selected_name
fi