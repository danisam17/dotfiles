# vi:syntax=sh

# Git
alias am="git commit --amend"
alias b="git branch --verbose"
alias br="git branch | cut -c 3- | selecta | xargs git checkout"
alias co="git checkout"
alias couple="git --no-pager log --format=oneline -10"
alias clean="git checkout -- ."
alias cob="git checkout -b"
alias d="git d"
alias dc="git diff --cached"
alias l="git log"
alias la="git diff HEAD^..HEAD"
alias last="git checkout @{-1}"
# `gem install git-up`
alias 🚀="git up && git push"
alias reset="git reset HEAD --hard"
alias s="git status"
alias stash="git stash"
alias pop="git stash pop"

# Ruby/Rails/Rake
alias bu='bundle check; bundle install -j8'
alias back="bake db:rollback"
alias bake="be rake"
alias be="bundle exec"
alias rmi="bake db:migrate"
alias route="bake routes | grep $1"

# Terminal misc.
alias alive="ps aux | grep"
alias die="exec $SHELL -l"
alias mkdir="mkdir -p"
alias sudo='sudo '
alias tls="tmux ls"
alias tmux="tmux -2"
alias ve="vim ~/.vimrc"
alias vup="vim-update-bundles -n"

# Color LS
alias ls="ls -la"

# emacs
alias emd='/Applications/Emacs.app/Contents/MacOS/Emacs --daemon'
alias em='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -c --no-wait'
