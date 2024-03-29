@echo off
rem 02_Deploy_AWKScripts_INTEGRITY_MONITORING.bat
pushd "%~dp0"
pushd ..\AWKScripts\02_INTEGRITY_MONITORING\UTF8

..\..\..\LinuxTools\busybox_glob.exe rm ../01_Controller/*.*
..\..\..\LinuxTools\busybox_glob.exe rm ../02_CommonParts/*.*
..\..\..\LinuxTools\busybox_glob.exe rm ../03_SubSystem/*.*

..\..\..\LinuxTools\busybox_glob.exe cp ./01_Controller/*.awk ../01_Controller
..\..\..\LinuxTools\busybox_glob.exe cp ./02_CommonParts/*.awk ../02_CommonParts
..\..\..\LinuxTools\busybox_glob.exe cp ./03_SubSystem/*.awk ../03_SubSystem

..\..\..\LinuxTools\nkf32.exe -s -Lw --overwrite ../01_Controller/*.awk
..\..\..\LinuxTools\nkf32.exe -s -Lw --overwrite ../02_CommonParts/*.awk
..\..\..\LinuxTools\nkf32.exe -s -Lw --overwrite ../03_SubSystem/*.awk

exit /b

