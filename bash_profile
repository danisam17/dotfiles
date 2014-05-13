export PATH=/usr/local/bin:$HOME/.bin:$HOME/.cask/bin:$PATH
. $HOME/.bash/aliases
. $HOME/.bash/functions

# init z! (https://github.com/rupa/z)
. ~/.zsh

. $HOME/.prompt/liquidprompt

# allow npm to do all kind of things
ulimit -n 1000

eval "$(hub alias -s)"

# completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# pg
if [ -f /Applications/Postgres93.app/Contents/MacOS/bin/psql ]; then
  export PATH="/Applications/Postgres93.app/Contents/MacOS/bin:$PATH"
fi

export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="./bin:$PATH"
export ANDROID_HOME=/usr/local/opt/android-sdk

eval "$(rbenv init -)"
