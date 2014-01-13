export PATH=/usr/local/bin:$HOME/.bin:$HOME/.cask/bin:$PATH
. $HOME/.bash/aliases
. $HOME/.bash/functions
. $HOME/.bash/prompt
. $HOME/.lolcommitsrc
[ -f /opt/boxen/env.sh ] && . /opt/boxen/env.sh

# allow npm to do all kind of things
ulimit -n 1000

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

eval "$(hub alias -s)"
chruby ruby-2.0.0-p353
