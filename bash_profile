for file in $HOME/.bash/*; do
  source $file
done

# omg this is a thing waaaaat
bind "set completion-ignore-case on"

eval "$(hub alias -s)"
eval "$(rbenv init -)"

export EDITOR=vim

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

source ~/.bin/z.sh

export PATH="$PWD/bin:$PATH"
