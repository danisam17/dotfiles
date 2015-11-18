bindkey -e

# Globals
source $HOME/.shellrc

for file in $HOME/.zsh/*.zsh; do
  source $file
done

