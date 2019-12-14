#! /usr/bin/gawk
# 04_Cadenza_SubSystem_04.awk
# gawk.exe -f AWKScripts/03_DETECTOR/03_SubSystem/03_Cadenza/04_Cadenza_SubSystem_04.awk -v Number=Number -v LineCnt=LineCnt

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
	Number = Number + 0;
	Number = int(Number);
	if(Number < 1){
		exit 99;
	}
	LineCnt = LineCnt + 0;
	LineCnt = int(LineCnt);
	if(LineCnt < 1){
		exit 99;
	}
	Remainder = Number % 100;
	if(Remainder != 0){
		exit 99;
	}
	cmd_find = "LinuxTools\\busybox.exe sh ShellScripts/03_DETECTOR/05_Cadenza/02_CALL_DETECTOR_Cadenza_02.sh"
	while(cmd_find | getline NowCnt){
		break;
	}
	close(cmd_find);
	percent = NowCnt / LineCnt * 100;
	percent = int(percent);
	print "現在時刻　：　"strftime("%Y年%m月%d日　%H時%M分%S秒",systime());
	print "現在の処理件数　："NowCnt"/"LineCnt"件（"percent"％完了）";
}

# ------------------------------------------------------------------------------------------------------------------------

