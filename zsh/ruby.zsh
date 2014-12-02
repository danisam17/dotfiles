# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - --no-rehash)"

# aliases
alias bu='bundle check; bundle install -j8'
alias back="bake db:rollback"
alias bake="be rake"
alias be="bundle exec"
alias rmi="bake db:migrate"
