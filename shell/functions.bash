# vi:syntax=bash

current() {
  printf $(basename `pwd`)
}

attach() {
  if [ -z "$1" ]
  then
    tmux at -t $(current)
  else
    tmux at -t "$1*"
  fi
}

v0() {
  lame "$1" --preset extreme
}

code4slide() {
  highlight -O rtf "$1" --line-numbers --font-size 24 --font Inconsolata --style zenburn -W -J 78 -j 3 --src-lang ruby | pbcopy
}

fuzz() {
  vim "$(ag -i '$1' -L | head -n1)"
}
