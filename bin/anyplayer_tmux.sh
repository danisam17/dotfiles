#!/bin/bash

if hash anyplayer 2>/dev/null; then
  if [[ $(anyplayer playing) -eq 0 ]]; then
    track=$(anyplayer track | cut -c 1-40)
    artist=$(anyplayer artist | cut -c 1-40)
    echo "$track - $artist"
  else
    echo ""
  fi
fi
