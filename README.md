# Ambient landscape background noise generation

## Setup

This script is configured by setting percentage values in FV hashmap (look for sounds e.g. [here](https://freesound.org/)). The example configuration uses five .ogg files in a sounds/ folder.

The script assumes you have mplayer (or just mpv) installed.

## How does it work?

The `play` function iterates over keys from the explicitly defined hashmap, spawns
players and saves their PIDs to `PLAYER_PIDS` array. The `clean` function
simply kills all PIDs in this array.

The script runs `play` and traps SIGINT signal, on which it runs `clean` and exits.

