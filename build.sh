#!/bin/bash
# Rebuild TablutAI.jar from sources (needs a JDK: javac + jar)
set -e
cd "$(dirname "$0")"
rm -rf out && mkdir out
javac --release 8 -d out src/tablut/*.java
printf 'Main-Class: tablut.Player\n' > manifest.txt
jar cfm TablutAI.jar manifest.txt -C out .
echo "Built TablutAI.jar"
