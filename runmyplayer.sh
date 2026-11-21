#!/bin/bash
# Usage: /home/tablut/tablut/runmyplayer.sh <WHITE|BLACK> <timeout_seconds> <server_ip>
DIR="$(cd "$(dirname "$0")" && pwd)"
exec java -Xmx2g -XX:+UseSerialGC -jar "$DIR/TablutAI.jar" "$1" "$2" "$3"
