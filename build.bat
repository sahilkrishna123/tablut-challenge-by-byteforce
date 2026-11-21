@echo off
REM Rebuild TablutAI.jar on Windows (needs a JDK on PATH)
cd /d %~dp0
if exist out rmdir /s /q out
mkdir out
javac --release 8 -d out src\tablut\*.java || exit /b 1
echo Main-Class: tablut.Player> manifest.txt
jar cfm TablutAI.jar manifest.txt -C out . || exit /b 1
echo Built TablutAI.jar
