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

###alias

alias gac="git add . && git commit"
alias am="g amend"
alias c=cd
alias die="exec $SHELL -l"
alias g=git
alias gc="g clone"
alias gd="g di"
alias gpp="git pull --rebase; git push"
alias gs="g st"
alias l=ls
alias less="vim -u ~/.vimrc.more"
alias ls="ls -Ga"
alias v=vim
alias ve="vim ~/.vimrc"
alias vi=vim
alias ze="vim ~/.zshrc"

f() {
  ack $1 -k *
}

t() {
  if [ -e script/test ]; then
    script/test $*
  else
    rspec --color spec
  fi
}

mux() {
  name=$(tmux ls -F "#{session_name}")
  if [ -z "$name" ]; then
    tmux new
  else
    echo "found $name. join?"
    read "answer?join this session [y/n]? "
    if [[ $answer = y ]] ; then
      tmux at -t $name
    else
      tmux new
    fi
  fi
}

eval "$(hub alias -s)"

ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/local/bin:/usr/local/share/npm/bin:/Users/kristian/bin:/usr/bin:/usr/local/share/npm/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/MacGPG2/bin
export NODE_PATH="/usr/local/lib/node"

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
chruby ruby-2.0.0
