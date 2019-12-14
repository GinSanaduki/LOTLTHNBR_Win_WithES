#! /usr/bin/gawk
# 03_Vivace_SubSystem_03.awk
# gawk.exe -f AWKScripts/03_DETECTOR/03_SubSystem/04_Vivace/03_Vivace_SubSystem_03.awk

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

{
	Tex = $2;
	gsub("DETECTOR_WORKS_QUATORZE/GrepRes_No_","",Tex);
	gsub(".txt","",Tex);
	# シーケンス番号、phase1のGrepResファイル名、GrepDefineファイル、GrepResファイルのバイトサイズ、phase1の結果
	if($1 > 0){
		print NR","$2",DETECTOR_WORKS_CINQ/Detector_WORD_No_"Tex".txt,"$1",TRUE";
	} else {
		print NR","$2",DETECTOR_WORKS_CINQ/Detector_WORD_No_"Tex".txt,"$1",FALSE";
	}
}

