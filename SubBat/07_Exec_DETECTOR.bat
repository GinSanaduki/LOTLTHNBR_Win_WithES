@echo off
rem 07_Exec_DETECTOR.bat
pushd "%~dp0"
pushd ..\

LinuxTools\busybox.exe sh ShellScripts/03_DETECTOR/01_Main/01_CALL_DETECTOR.sh

pause

exit /b

