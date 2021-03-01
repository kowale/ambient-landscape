Configured by setting percentage values in FV hashmap. Look for sounds e.g. [here](https://freesound.org/) and change the `sounds/` directory accordingly. The script assumes you have `mplayer` (or just `mpv`) installed.

The `play` function iterates over keys from the explicitly defined hashmap, spawns players and saves their PIDs to `PLAYER_PIDS` array. The `clean` function simply kills all PIDs in this array. The script runs `play` and traps SIGINT signal, on which it runs `clean` and exits.

