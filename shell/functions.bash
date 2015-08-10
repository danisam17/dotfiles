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

nmux() {
  if [ -z "$1" ]
  then
    tmux new -s "$(printf $(basename `pwd`))"
  else
    tmux new -s "$1"
  fi
}

v0() {
  lame "$1" --preset extreme
}
