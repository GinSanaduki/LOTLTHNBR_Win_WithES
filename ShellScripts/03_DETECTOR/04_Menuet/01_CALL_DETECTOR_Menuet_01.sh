#! /bin/sh
# 01_CALL_DETECTOR_Menuet_01.sh
# busybox sh ShellScripts/03_DETECTOR/04_Menuet/01_CALL_DETECTOR_Menuet_01.sh

# ------------------------------------------------------------------------------------------------------------------------

# Copyright 2019 The LOTLTHNBR Project Authors, GinSanaduki.
# All rights reserved.
# Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
# LOTLTHNBR Scripts provides a function to obtain a list of non-returned license numbers of teacher licenses 
# from the Ministry of Education, Culture, Sports, Science and Technology from the website of the Ministry 
# of Education, Culture, Sports, Science and Technology, and to inquire by license number.
# This Scripts needs GAWK(the GNU implementation of the AWK programming language) version 4.0 or later 
# and BusyBox developed by Erik Andersen, Rob Landley, Denys Vlasenko and others.
# GAWK 5.0.1 Download ezwinports from SourceForge.net
# https://sourceforge.net/projects/ezwinports/files/gawk-5.0.1-w32-bin.zip/download
# BusyBox Official
# https://www.busybox.net/
# BusyBox -w32
# http://frippery.org/busybox/
# Download
# http://frippery.org/files/busybox/busybox.exe
# BusyBox Wildcard expansion
# https://frippery.org/busybox/globbing.html
# Download
# https://frippery.org/files/busybox/busybox_glob.exe

# ------------------------------------------------------------------------------------------------------------------------

FList="DETECTOR_WORKS_SIX/FileList.tsv"

rm -r DETECTOR_WORKS_SIX > nul 2>&1
mkdir -p DETECTOR_WORKS_SIX > nul 2>&1
: > $FList

ls -1 DefineCSV/*.csv | \
egrep Define_Gene_2[0-9]{3}[0-1][0-9][0-3][0-9]_XML_From_2[0-9]{3}[0-1][0-9]_To_2[0-9]{3}[0-1][0-9]_OriginXLSX_Acquisition_2[0-9]{3}[0-1][0-9][0-3][0-9]_UnderText_Origin_.+\\.csv | \
LinuxTools/gawk.exe -f AWKScripts/03_DETECTOR/03_SubSystem/02_Menuet/01_Menuet_SubSystem_01.awk | \
sort -t ',' -k 1nr,1 | \
sed -e 's/,/\t/g' | \
LinuxTools/gawk.exe -f AWKScripts/03_DETECTOR/03_SubSystem/02_Menuet/02_Menuet_SubSystem_02.awk | \
unix2dos > $FList

LinuxTools/gawk.exe -f AWKScripts/03_DETECTOR/03_SubSystem/02_Menuet/03_Menuet_SubSystem_03.awk $FList
FListExist=$?
if [ $FListExist = "1" ]; then
	exit 2
fi

# ファイルリストが最新分しか存在しないか否かの確認
fgrep -q 'CAUTION' $FList
Ret_ExistCaution=$?
if [ $Ret_ExistCaution = "1" ]; then
	exit 1
fi
exit 0

