@echo off
REM Usage: run_black.bat [server_ip]   (default localhost)
set IP=%1
if "%IP%"=="" set IP=localhost
java -Xmx2g -jar "%~dp0TablutAI.jar" BLACK 60 %IP%
