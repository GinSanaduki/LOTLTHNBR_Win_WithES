#! /usr/bin/gawk
# 03_Cadenza_SubSystem_03.awk
# gawk.exe -f AWKScripts/03_DETECTOR/03_SubSystem/03_Cadenza/03_Cadenza_SubSystem_03.awk -v Mode=START
# gawk.exe -f AWKScripts/03_DETECTOR/03_SubSystem/03_Cadenza/03_Cadenza_SubSystem_03.awk -v Mode=END

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
	if(Mode == "START"){
		print "照会開始時刻　：　"strftime("%Y年%m月%d日　%H時%M分%S秒",systime()) > "con";
	} else if(Mode == "END"){
		print "照会完了時刻　：　"strftime("%Y年%m月%d日　%H時%M分%S秒",systime()) > "con";
	} else {
		exit 99;
	}
	close("con");
}

