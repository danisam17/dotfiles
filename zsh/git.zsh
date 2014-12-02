# brew install hub
eval "$(hub alias -s)"

# Aliases

alias am="git commit --amend"
alias b="git branch --verbose"
# brew install selecta
alias br="git branch | cut -c 3- | selecta | xargs git checkout"
alias co="git checkout"
alias clean="git checkout -- ."
alias cob="git checkout -b"
alias d="git d"
alias dc="git diff --cached"
alias l="git log"
# `gem install git-up`
alias 🚀="git up && git push"
alias reset="git reset HEAD --hard"
alias s="git status"
alias stash="git stash"
alias pop="git stash pop"

