#! /usr/bin/gawk
# 05_Cadenza_SubSystem_05.awk
# gawk.exe -f AWKScripts/03_DETECTOR/03_SubSystem/03_Cadenza/05_Cadenza_SubSystem_05.awk -v LineCnt=LineCnt DETECTOR_WORKS_NEUF/Detector_WORD_FileList.csv

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
	LineCnt = LineCnt + 0;
	LineCnt = int(LineCnt);
	if(LineCnt < 1){
		exit 99;
	}
}

# ------------------------------------------------------------------------------------------------------------------------

(LineCnt < 200){
	# 照会処理中の経過監視は、200件以上の場合に100行の処理単位で実施する。
	# 199件以下の場合、照会処理中の経過監視は実施しない。
	print "fgrep -f DETECTOR_WORKS_CINQ/Detector_WORD_No_"$1".txt DETECTOR_WORKS_SEPT/GrepDefine_Phase1.tsv > DETECTOR_WORKS_ONZE/GrepRes_No_"$1".txt";
	next;
}

# ------------------------------------------------------------------------------------------------------------------------

{
	Remainder = $1 % 100;
	if(Remainder == 0 || NR == LineCnt){
		print "fgrep -f DETECTOR_WORKS_CINQ/Detector_WORD_No_"$1".txt DETECTOR_WORKS_SEPT/GrepDefine_Phase1.tsv > DETECTOR_WORKS_ONZE/GrepRes_No_"$1".txt; LinuxTools/gawk.exe -f AWKScripts/03_DETECTOR/03_SubSystem/03_Cadenza/04_Cadenza_SubSystem_04.awk -v Number="$1" -v LineCnt="LineCnt" > \"con\"";
	} else {
		print "fgrep -f DETECTOR_WORKS_CINQ/Detector_WORD_No_"$1".txt DETECTOR_WORKS_SEPT/GrepDefine_Phase1.tsv > DETECTOR_WORKS_ONZE/GrepRes_No_"$1".txt";
	}
}

