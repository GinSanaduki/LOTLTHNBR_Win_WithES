#! /bin/sh
# 03_CALL_INTEGRITY_MONITORING_Allegro_01.sh

LinuxTools/gawk.exe -f AWKScripts/02_INTEGRITY_MONITORING/02_CommonParts/03_Allegro_Hashconf.awk & 
LinuxTools/gawk.exe -f AWKScripts/02_INTEGRITY_MONITORING/02_CommonParts/04_Allegro_AcquiredHTML_UTF8.awk & 
LinuxTools/gawk.exe -f AWKScripts/02_INTEGRITY_MONITORING/02_CommonParts/05_Allegro_AcquiredHTML_SJIS.awk & 
LinuxTools/gawk.exe -f AWKScripts/02_INTEGRITY_MONITORING/02_CommonParts/06_Allegro_AcquiredHTML_EDIT.awk & 
LinuxTools/gawk.exe -f AWKScripts/02_INTEGRITY_MONITORING/02_CommonParts/07_Allegro_AcquiredXLSX.awk & 
LinuxTools/gawk.exe -f AWKScripts/02_INTEGRITY_MONITORING/02_CommonParts/08_Allegro_DefineCSV.awk & 
wait

exit 0

