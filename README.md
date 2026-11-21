# Byte Force – Tablut AI Challenge 2026/27
Java 8+ agent, no external dependencies. Technique: iterative-deepening negamax with alpha-beta pruning,
Zobrist transposition table, killer/history move ordering, repetition (draw) awareness, king-threat
search extensions, hand-written evaluation (material, king escape lines, king mobility, king safety, black guard ring).

## Run (Linux VM, as required by the competition)
    /home/tablut/tablut/runmyplayer.sh WHITE 60 192.168.20.101      # role, timeout(s), server IP
Role is case-insensitive. Optional 4th argument = player name (default TablutAI_AlphaBeta).
No other optional parameters are needed. Byte_Force

## Build
    ./build.sh        (Linux)      or      build.bat   (Windows)      -> TablutAI.jar     (needs a JDK 8+)

## Test locally on Windows (server + players, from the original repo's Tablut folder)
1. Install a JDK (e.g. Temurin 17/21) and make sure `java -version` and `javac -version` work.
2. Compile the original repo: in `TablutCompetition-master\Tablut` run
   `javac -encoding ISO-8859-1 -cp "lib/*" -d build src\it\unibo\ai\didattica\competition\tablut\*\*.java`
   (or use Eclipse / `ant compile` as in the repo README).
3. Terminal 1 (server, add -g for the GUI):  
   `java -cp "build;lib/*" it.unibo.ai.didattica.competition.tablut.server.Server -g`
4. Terminal 2: `run_white.bat`  Terminal 3: `run_black.bat`  (or the random player:  
   `java -cp "build;lib/*" it.unibo.ai.didattica.competition.tablut.client.TablutRandomClient BLACK 60 localhost`)

## Verification done
* `test/RulesDiffTest.java`: our board engine is compared with the official `GameAshtonTablut` on ~40k positions
  (random playouts, random boards, throne-area king-capture boards): legality of every (from,to) pair and the
  resulting board/turn (captures, king capture, escape). 0 mismatches.
* End-to-end over sockets with the official Server: wins as White and as Black vs the random player;
  engine-vs-engine at timeout 6 s finished with no illegal moves, every move within budget.

## Rules quirks of the official server that the agent follows (differ from the slides)
corners count as escape; throne never crossable; camp-to-camp moves longer than 5 squares are illegal;
any camp cell is a capture anvil against white pawns; a first repeated state = draw (initial position not stored).
