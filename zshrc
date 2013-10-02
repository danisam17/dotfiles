ZSH_THEME="kennethreitz"

plugins=(rails3 ruby brew)
autoload -U compinit && compinit

export EDITOR=vim
export PATH=/usr/local/bin:${PATH}
export PATH="$HOME/bin:$PATH"

export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
export GREP_OPTIONS="--color"
export HISTSIZE=100000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE
export WORDCHARS='*?[]~&;!$%^<>'
export ACK_COLOR_MATCH='red'

DISABLE_AUTO_TITLE=true # shut the eff up ugh

fpath=(~/.zsh $fpath)
source $HOME/.zsh/functions
source $HOME/.zsh/aliases
eval "$(hub alias -s)"
ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
source $HOME/.secrets
source virtualenvwrapper.sh

# Customize to your needs...
export PATH=$PATH:/usr/local/bin:/usr/local/share/npm/bin:/Users/kristian/.bin:/usr/bin:/usr/local/share/npm/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/MacGPG2/bin
export NODE_PATH="/usr/local/lib/node"

source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
chruby ruby-2.0.0

export MUTT_EMAIL_ADDRESS="kristian@kristianfreeman.com"
export MUTT_REALNAME="Kristian Freeman"
export MUTT_SMTP_URL="smtp://kristian@kristianfreeman.com@smtp.gmail.com:587/"
