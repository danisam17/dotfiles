for file in $HOME/.zsh/*.zsh; do
  source $file
done

for file in $HOME/.machines/*; do
  source $file
done

source ~/.bin/z.sh
