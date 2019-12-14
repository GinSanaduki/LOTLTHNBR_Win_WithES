#! /bin/sh
# 02_CALL_DETECTOR_Menuet_02.sh
# busybox sh ShellScripts/03_DETECTOR/04_Menuet/02_CALL_DETECTOR_Menuet_02.sh

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
GREPDEFINE_PH1="DETECTOR_WORKS_SEPT/GrepDefine_Phase1.tsv"

NewFile=`fgrep 'WARNING' $FList | \
LinuxTools/gawk.exe -f AWKScripts/03_DETECTOR/03_SubSystem/02_Menuet/04_Menuet_SubSystem_04.awk`

rm -r DETECTOR_WORKS_SEPT > nul 2>&1
mkdir -p DETECTOR_WORKS_SEPT > nul 2>&1
: > $GREPDEFINE_PH1

LinuxTools/gawk.exe -f AWKScripts/03_DETECTOR/03_SubSystem/02_Menuet/05_Menuet_SubSystem_05.awk $NewFile | \
unix2dos > $GREPDEFINE_PH1

exit 0

