export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="nanotech"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

source $ZSH/oh-my-zsh.sh

for file in $HOME/.zsh/*.zsh; do
  source $file
done

