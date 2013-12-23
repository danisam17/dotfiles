export PATH=$HOME/.bin:$PATH
. $HOME/.bash/aliases
. $HOME/.bash/functions
. $HOME/.bash/prompt
. $HOME/.lolcommitsrc
[ -f /opt/boxen/env.sh ] && . /opt/boxen/env.sh
export PATH=$HOME/.bin:$PATH

# allow npm to do all kind of things
ulimit -n 1000
