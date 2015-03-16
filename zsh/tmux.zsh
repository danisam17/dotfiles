alias mux=tmuxinator
alias tmux="tmux -2"

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
    tmux new -s $(current)
  else
    tmux new -s "$1"
  fi
}

sup() {
  for directory in "$DIRECTORIES[@]"
  do
    name="$(basename $directory)"
    echo "Creating $name session"
    tmux new-session -c $directory -s "$name" -d
  done
}
