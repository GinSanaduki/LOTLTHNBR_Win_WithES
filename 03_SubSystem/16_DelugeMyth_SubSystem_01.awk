#! /usr/bin/gawk -f
# 16_DelugeMyth_SubSystem_01.awk
# gawk.exe -f AWKScripts/01_UPDATE/03_SubSystem/16_DelugeMyth_SubSystem_01.awk -v DelugeMyth_NOAHsARKCOL01=DelugeMyth_NOAHsARKCOL01 -v DelugeMyth_NOAHsARKCOL02=DelugeMyth_NOAHsARKCOL02 -v DelugeMyth_NOAHsARKCOL03=DelugeMyth_NOAHsARKCOL03 -v DelugeMyth_NOAHsARKROW01=DelugeMyth_NOAHsARKROW01 -v DelugeMyth_NOAHsARKROW02=DelugeMyth_NOAHsARKROW02 -v DelugeMyth_NOAHsARKROW03=DelugeMyth_NOAHsARKROW03 OuterJoined.csv > DelugeMythed.csv

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

BEGIN{
	FS = ",";
}

($2 == DelugeMyth_NOAHsARKCOL01){
	if($3 > DelugeMyth_NOAHsARKROW01){
		print;
		next;
	}
}

($2 == DelugeMyth_NOAHsARKCOL02){
	if($3 > DelugeMyth_NOAHsARKROW02){
		print;
		next;
	}
}

($2 == DelugeMyth_NOAHsARKCOL03){
	if($3 > DelugeMyth_NOAHsARKROW03){
		print;
		next;
	}
}

