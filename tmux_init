#! /usr/bin/env fish

set -l sessions "dotfiles" "$HOME/dotfiles" "scripts" "$HOME/dev/scripts"

set -l window_count_per_session 3

for i in (seq 1 2 (count $sessions))
    set -l session_name $sessions[$i]
    set -l opening_dir $sessions[(math $i + 1)]
    tmux new-session -d -s $session_name -c $opening_dir
    for window_index in (seq 1 (math $window_count_per_session - 1))
        tmux new-window -t $session_name: -c $opening_dir
    end
end

tmux attach
