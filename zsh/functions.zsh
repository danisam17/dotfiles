current() {
  printf $(basename `pwd`)
}

# brew install ffmpeg; brew install gifsicle
mov_to_gif() {
  in=$1
  out=$2
  ffmpeg -i $in -pix_fmt rgb24 -f gif - | gifsicle > $out
}

new_tmux() {
  TMUX=''
  tmux new-session -d -s `current`
}
