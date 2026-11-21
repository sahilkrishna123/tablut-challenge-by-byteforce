@echo off
REM Usage: run_white.bat [server_ip]   (default localhost)
set IP=%1
if "%IP%"=="" set IP=localhost
java -Xmx2g -jar "%~dp0TablutAI.jar" WHITE 60 %IP%
