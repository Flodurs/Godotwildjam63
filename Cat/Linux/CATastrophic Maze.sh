#!/bin/sh
echo -ne '\033c\033]0;Godotwildjam 63\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/CATastrophic Maze.x86_64" "$@"
