ZSH_THEME="kennethreitz"

plugins=(rails ruby brew)

export EDITOR=vim
export PATH="$HOME/bin:$GOPATH/bin:$HOME/.bin:$PATH"

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
