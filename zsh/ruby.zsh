# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - --no-rehash)"

# aliases
alias bu='bundle check; bundle install'
alias bake="be rake"
alias be="bundle exec"
alias migrate=Migrate

function Migrate {
  bundle exec rails g migration "$@" | tail -n 1 | awk {'print $2'} | xargs cat
}
