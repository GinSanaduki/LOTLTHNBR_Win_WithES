#! /bin/sh
# 03_CALL_INTEGRITY_MONITORING_Allegro_01.sh

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

LinuxTools/gawk.exe -f AWKScripts/02_INTEGRITY_MONITORING/02_CommonParts/03_Allegro_Hashconf.awk & 
LinuxTools/gawk.exe -f AWKScripts/02_INTEGRITY_MONITORING/02_CommonParts/04_Allegro_AcquiredHTML_UTF8.awk & 
LinuxTools/gawk.exe -f AWKScripts/02_INTEGRITY_MONITORING/02_CommonParts/05_Allegro_AcquiredHTML_SJIS.awk & 
LinuxTools/gawk.exe -f AWKScripts/02_INTEGRITY_MONITORING/02_CommonParts/06_Allegro_AcquiredHTML_EDIT.awk & 
LinuxTools/gawk.exe -f AWKScripts/02_INTEGRITY_MONITORING/02_CommonParts/07_Allegro_AcquiredXLSX.awk & 
LinuxTools/gawk.exe -f AWKScripts/02_INTEGRITY_MONITORING/02_CommonParts/08_Allegro_DefineCSV.awk & 
wait

exit 0

