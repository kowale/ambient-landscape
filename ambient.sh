#!/bin/bash

PLAYER_PIDS=()

declare -A FV

FV["sounds/stream.ogg"]="20"
FV["sounds/fireplace.ogg"]="0"
FV["sounds/heavy-rain.ogg"]="60"
FV["sounds/forest-rain.ogg"]="30"
FV["sounds/thunderstorm.ogg"]="20"

play() {
  for file in "${!FV[@]}"; do
    echo "Playing $file with volume ${FV[$file]}%"
    mpv --loop=inf --gapless-audio=yes --volume="${FV[$file]}" $file >/dev/null 2>&1 &
    PLAYER_PIDS+=("$!")
  done
  [[ -n "${PLAYER_PIDS[0]}" ]] && wait "${PLAYER_PIDS[0]}"
}

clean() {
  for i in "${PLAYER_PIDS[@]}"; do
    kill -s TERM "$i"
  done
}

trap "clean; exit" INT
play

