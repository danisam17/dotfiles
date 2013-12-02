ZSH_THEME="kennethreitz"

plugins=(rails3 ruby brew)
#autoload -U compinit && compinit

export EDITOR=vim
export GOPATH="$HOME/src/go"
export PATH="$HOME/bin:$GOPATH/bin:$HOME/.bin:$PATH"
export PATH="$HOME/.cask/bin:$PATH"

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
ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
source $HOME/.secrets

# Customize to your needs...
export MUTT_EMAIL_ADDRESS="kristian@kristianfreeman.com"
export MUTT_REALNAME="Kristian Freeman"
export MUTT_SMTP_URL="smtp://kristian@kristianfreeman.com@smtp.gmail.com:587/"

[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh
source virtualenvwrapper.sh

# Re-source, dunno why, but it just doesn't stick
if [ "$TMUX" ]; then
  tmux source-file ~/.tmux.conf
fi

command -v lolcommits > /dev/null && source ~/.lolcommitsrc || echo "lolcommits not found"

export LOLCOMMITS_DELAY=2
export LOLCOMMITS_FORKS=yes
export LOLCOMMITS_STEALTH=yes
