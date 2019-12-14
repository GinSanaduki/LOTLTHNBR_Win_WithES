@echo off
rem 03_Deploy_AWKScripts_DETECTOR.bat
pushd "%~dp0"
pushd ..\AWKScripts\03_DETECTOR\UTF8

..\..\..\LinuxTools\busybox_glob.exe rm ../01_Controller/*.*
..\..\..\LinuxTools\busybox_glob.exe rm ../02_CommonParts/*.*
..\..\..\LinuxTools\busybox_glob.exe rm ../03_SubSystem/01_Adagio/*.*
..\..\..\LinuxTools\busybox_glob.exe rm ../03_SubSystem/02_Menuet/*.*
..\..\..\LinuxTools\busybox_glob.exe rm ../03_SubSystem/03_Cadenza/*.*
..\..\..\LinuxTools\busybox_glob.exe rm ../03_SubSystem/04_Vivace/*.*
..\..\..\LinuxTools\busybox_glob.exe rm ../04_SetArrays/*.*
..\..\..\LinuxTools\busybox_glob.exe rm ../05_Gene_Koushu_Kubun/01_You/*.*
..\..\..\LinuxTools\busybox_glob.exe rm ../05_Gene_Koushu_Kubun/02_Shou/*.*
..\..\..\LinuxTools\busybox_glob.exe rm ../05_Gene_Koushu_Kubun/03_Chuu/*.*
..\..\..\LinuxTools\busybox_glob.exe rm ../05_Gene_Koushu_Kubun/04_Kou/*.*
..\..\..\LinuxTools\busybox_glob.exe rm ../05_Gene_Koushu_Kubun/05_TokuShi/*.*
..\..\..\LinuxTools\busybox_glob.exe rm ../05_Gene_Koushu_Kubun/06_YouKyou/*.*
..\..\..\LinuxTools\busybox_glob.exe rm ../05_Gene_Koushu_Kubun/07_Ei/*.*
..\..\..\LinuxTools\busybox_glob.exe rm ../05_Gene_Koushu_Kubun/08_Mou/*.*
..\..\..\LinuxTools\busybox_glob.exe rm ../05_Gene_Koushu_Kubun/09_Rou/*.*
..\..\..\LinuxTools\busybox_glob.exe rm ../05_Gene_Koushu_Kubun/10_YouGaku/*.*

..\..\..\LinuxTools\busybox_glob.exe cp ./01_Controller/*.awk ../01_Controller
..\..\..\LinuxTools\busybox_glob.exe cp ./02_CommonParts/*.awk ../02_CommonParts
..\..\..\LinuxTools\busybox_glob.exe cp ./03_SubSystem/01_Adagio/*.awk ../03_SubSystem/01_Adagio
..\..\..\LinuxTools\busybox_glob.exe cp ./03_SubSystem/02_Menuet/*.awk ../03_SubSystem/02_Menuet
..\..\..\LinuxTools\busybox_glob.exe cp ./03_SubSystem/03_Cadenza/*.awk ../03_SubSystem/03_Cadenza
..\..\..\LinuxTools\busybox_glob.exe cp ./03_SubSystem/04_Vivace/*.awk ../03_SubSystem/04_Vivace
..\..\..\LinuxTools\busybox_glob.exe cp ./04_SetArrays/*.awk ../04_SetArrays
..\..\..\LinuxTools\busybox_glob.exe cp ./05_Gene_Koushu_Kubun/01_You/*.awk ../05_Gene_Koushu_Kubun/01_You
..\..\..\LinuxTools\busybox_glob.exe cp ./05_Gene_Koushu_Kubun/02_Shou/*.awk ../05_Gene_Koushu_Kubun/02_Shou
..\..\..\LinuxTools\busybox_glob.exe cp ./05_Gene_Koushu_Kubun/03_Chuu/*.awk ../05_Gene_Koushu_Kubun/03_Chuu
..\..\..\LinuxTools\busybox_glob.exe cp ./05_Gene_Koushu_Kubun/04_Kou/*.awk ../05_Gene_Koushu_Kubun/04_Kou
..\..\..\LinuxTools\busybox_glob.exe cp ./05_Gene_Koushu_Kubun/05_TokuShi/*.awk ../05_Gene_Koushu_Kubun/05_TokuShi
..\..\..\LinuxTools\busybox_glob.exe cp ./05_Gene_Koushu_Kubun/06_YouKyou/*.awk ../05_Gene_Koushu_Kubun/06_YouKyou
..\..\..\LinuxTools\busybox_glob.exe cp ./05_Gene_Koushu_Kubun/07_Ei/*.awk ../05_Gene_Koushu_Kubun/07_Ei
..\..\..\LinuxTools\busybox_glob.exe cp ./05_Gene_Koushu_Kubun/08_Mou/*.awk ../05_Gene_Koushu_Kubun/08_Mou
..\..\..\LinuxTools\busybox_glob.exe cp ./05_Gene_Koushu_Kubun/09_Rou/*.awk ../05_Gene_Koushu_Kubun/09_Rou
..\..\..\LinuxTools\busybox_glob.exe cp ./05_Gene_Koushu_Kubun/10_YouGaku/*.awk ../05_Gene_Koushu_Kubun/10_YouGaku

..\..\..\LinuxTools\nkf32.exe -s -Lw --overwrite ../01_Controller/*.awk
..\..\..\LinuxTools\nkf32.exe -s -Lw --overwrite ../02_CommonParts/*.awk
..\..\..\LinuxTools\nkf32.exe -s -Lw --overwrite ../03_SubSystem/01_Adagio/*.awk
..\..\..\LinuxTools\nkf32.exe -s -Lw --overwrite ../03_SubSystem/02_Menuet/*.awk
..\..\..\LinuxTools\nkf32.exe -s -Lw --overwrite ../03_SubSystem/03_Cadenza/*.awk
..\..\..\LinuxTools\nkf32.exe -s -Lw --overwrite ../03_SubSystem/04_Vivace/*.awk
..\..\..\LinuxTools\nkf32.exe -s -Lw --overwrite ../04_SetArrays/*.awk
..\..\..\LinuxTools\nkf32.exe -s -Lw --overwrite ../05_Gene_Koushu_Kubun/01_You/*.awk
..\..\..\LinuxTools\nkf32.exe -s -Lw --overwrite ../05_Gene_Koushu_Kubun/02_Shou/*.awk
..\..\..\LinuxTools\nkf32.exe -s -Lw --overwrite ../05_Gene_Koushu_Kubun/03_Chuu/*.awk
..\..\..\LinuxTools\nkf32.exe -s -Lw --overwrite ../05_Gene_Koushu_Kubun/04_Kou/*.awk
..\..\..\LinuxTools\nkf32.exe -s -Lw --overwrite ../05_Gene_Koushu_Kubun/05_TokuShi/*.awk
..\..\..\LinuxTools\nkf32.exe -s -Lw --overwrite ../05_Gene_Koushu_Kubun/06_YouKyou/*.awk
..\..\..\LinuxTools\nkf32.exe -s -Lw --overwrite ../05_Gene_Koushu_Kubun/07_Ei/*.awk
..\..\..\LinuxTools\nkf32.exe -s -Lw --overwrite ../05_Gene_Koushu_Kubun/08_Mou/*.awk
..\..\..\LinuxTools\nkf32.exe -s -Lw --overwrite ../05_Gene_Koushu_Kubun/09_Rou/*.awk
..\..\..\LinuxTools\nkf32.exe -s -Lw --overwrite ../05_Gene_Koushu_Kubun/10_YouGaku/*.awk

exit /b

