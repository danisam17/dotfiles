# vi:syntax=sh

alias ls="gls --color=auto -l"

# Git
alias am="git commit --amend"
alias b="git branch --verbose"
alias co="git checkout"
alias cob="git checkout -b"
alias d="git d"
alias dc="git diff --cached"
alias l="git log"
# `gem install git-up`
alias 🚀="git up && git push"
alias reset="git reset HEAD --hard"
alias s="git status"

# Ruby/Rails/Rake
alias bu='bundle check; bundle install -j8'
alias bake="be rake"
alias be="bundle exec"

alias die="exec $SHELL -l"
alias tls="tmux ls"
alias ve="vim ~/.vimrc"

## selecta

# fuzzy branch checkout
alias bs="git branch | cut -c 3- | selecta | xargs git checkout"
# find pid
alias findpid="ps axww -o pid,user,%cpu,%mem,start,time,command | selecta | sed 's/^ *//' | cut -f1 -d' '"

alias brews="cat ~/.brews | xargs brew install"
alias casks="cat ~/.casks | xargs brew cask install"
