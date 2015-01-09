export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="nanotech"
DISABLE_LS_COLORS="false"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

source $ZSH/oh-my-zsh.sh

for file in $HOME/.zsh/*.zsh; do
  source $file
done

for file in $HOME/.machines/*; do
  source $file
done
