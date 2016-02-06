# vi:syntax=sh

alias vim=nvim
alias vi=vim

alias a="attach"
alias am="git commit --amend"
alias b="git branch"
alias bake="be rake"
alias be="bundle exec"
alias brews="cat ~/.brews | xargs brew install"
alias bu='bundle check; bundle install -j8'
alias casks="cat ~/.casks | xargs brew cask install"
alias co="git checkout"
alias cob="git checkout -b"
alias d="git d"
alias dc="git diff --cached"
alias delete_branches='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias die="exec $SHELL -l"
alias l="git log"
alias ls="gls --color=auto -l"
alias s="git status"
alias ve="vim ~/.vimrc"

alias mcal="gcalcli"
alias scal="gcalcli --configFolder ~/.simplegcal --calendar kristian@simple.com"
