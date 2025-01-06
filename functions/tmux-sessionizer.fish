#!/usr/bin/env fish

# Function to open the selected directory in a tmux session
function tmux-sessionizer --argument dir
    # Get the selected directory from the argument
    set dir $argv[1]

    # Validate input
    if test -z "$dir"
        return 0
    end

    # Extract a session name from the directory
    set session_name (basename "$dir" | tr './' '__')

    # Check if the tmux session already exists
    if tmux has-session -t "$session_name" > /dev/null 2>&1
        # Attach to the existing session
        tmux attach-session -t "$session_name"
    else
        # Create a new tmux session in the directory
        tmux new-session -s "$session_name" -c "$dir"
    end
end
