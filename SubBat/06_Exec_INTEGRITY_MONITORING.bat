@echo off
rem 06_Exec_INTEGRITY_MONITORING.bat
pushd "%~dp0"
pushd ..\

LinuxTools\busybox.exe sh ShellScripts/02_INTEGRITY_MONITORING/01_CALL_INTEGRITY_MONITORING.sh

pause

exit /b

