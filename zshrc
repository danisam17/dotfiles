ZSH_THEME="kennethreitz"

export PATH=/usr/local/bin:${PATH}
export PATH="$HOME/bin:$PATH"

export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"
export HISTSIZE=100000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE
export WORDCHARS='*?[]~&;!$%^<>'
export ACK_COLOR_MATCH='red'

source $HOME/.zsh/aliases
source $HOME/.zsh/functions

eval "$(hub alias -s)"

ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
source $HOME/.secrets

# Customize to your needs...
export PATH=$PATH:/usr/local/bin:/usr/local/share/npm/bin:/Users/kristian/bin:/usr/bin:/usr/local/share/npm/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/MacGPG2/bin
export NODE_PATH="/usr/local/lib/node"

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
chruby ruby-2.0.0
