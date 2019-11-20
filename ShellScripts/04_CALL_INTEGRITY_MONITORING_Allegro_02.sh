#! /bin/sh
# 04_CALL_INTEGRITY_MONITORING_Allegro_02.sh

LinuxTools/gawk.exe -f AWKScripts/02_INTEGRITY_MONITORING/02_CommonParts/09_Allegro_Hashconf_02.awk & 
LinuxTools/gawk.exe -f AWKScripts/02_INTEGRITY_MONITORING/02_CommonParts/10_Allegro_AcquiredHTML_UTF8_02.awk & 
LinuxTools/gawk.exe -f AWKScripts/02_INTEGRITY_MONITORING/02_CommonParts/11_Allegro_AcquiredHTML_SJIS_02.awk & 
LinuxTools/gawk.exe -f AWKScripts/02_INTEGRITY_MONITORING/02_CommonParts/12_Allegro_AcquiredHTML_EDIT_02.awk & 
LinuxTools/gawk.exe -f AWKScripts/02_INTEGRITY_MONITORING/02_CommonParts/13_Allegro_AcquiredXLSX_02.awk & 
LinuxTools/gawk.exe -f AWKScripts/02_INTEGRITY_MONITORING/02_CommonParts/14_Allegro_DefineCSV_02.awk & 
wait

exit 0

