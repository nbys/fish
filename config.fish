if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting

pyenv init - | source

# Enable AWS CLI autocompletion: github.com/aws/aws-cli/issues/1079
complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'

alias k kubectl

# nvm
if test -z "$XDG_CONFIG_HOME"
    set -x NVM_DIR "$HOME/.nvm"
else
    set -x NVM_DIR "$XDG_CONFIG_HOME/nvm"
end

# Load nvm if it exists
if test -s "$NVM_DIR/nvm.sh"
    source "$NVM_DIR/nvm.sh"
end

bind \cf 'find ~/Projects/ -maxdepth 3 -type d | fzf | read selected_dir; tmux-sessionizer $selected_dir'
