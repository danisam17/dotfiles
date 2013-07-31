setopt PROMPT_SUBST
autoload -U promptinit
promptinit
prompt grb

autoload -U compinit
compinit

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
alias die="exec $SHELL -l"
alias g=git
alias gd="g di"
alias gpp="git pull --rebase; git push"
alias gs="g st"
alias l=ls
alias less="vim -u ~/.vimrc.more"
alias ls="ls -Ga"
alias v=vim
alias ve="vim ~/.vimrc"
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
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
