. $HOME/.bash/colors
. $HOME/.bash/path
. $HOME/.bash/aliases.bash
. $HOME/.bash/functions
. $HOME/.bash/prompt
. $HOME/.bash/git-prompt.sh

# omg this is a thing waaaaat
bind "set completion-ignore-case on"

eval "$(hub alias -s)"
eval "$(rbenv init -)"

export EDITOR=vim

# export PATH=./bin:$PATH
