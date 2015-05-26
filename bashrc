# Nothing to see here — Everything's in .bash_profile
[ -n "$PS1" ] && source ~/.bash_profile

# added by travis gem
[ -f /Users/kristian/.travis/travis.sh ] && source /Users/kristian/.travis/travis.sh

export NVM_DIR="/Users/kristian/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
