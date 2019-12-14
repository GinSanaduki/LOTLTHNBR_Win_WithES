#! /usr/bin/gawk
# 05_Allegro_Rondo_SubSystem_02.awk
# gawk.exe -f AWKScripts/02_INTEGRITY_MONITORING/03_SubSystem/05_Allegro_Rondo_SubSystem_02.awk INTEGRITY_MONITORING_WORKS/Tmp_RetCode_UTF8.txt INTEGRITY_MONITORING_WORKS/Tmp_RetCode_SJIS.txt INTEGRITY_MONITORING_WORKS/Tmp_RetCode_EDIT.txt INTEGRITY_MONITORING_WORKS/Tmp_RetCode_XLSX.txt INTEGRITY_MONITORING_WORKS/Tmp_RetCode_CSV.txt

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

@include "AWKScripts/02_INTEGRITY_MONITORING/02_CommonParts/01_Konzertouverture.awk";

BEGIN{
	FS = ",";
	Declaration_02();
}

BEGINFILE{
	Fname = FILENAME;
}

(FNR == 1){
	HashValue = $4;
	Main();
	next;
}

{
	if(HashValue == $4){
		print > Tmp_Extracted_Other;
		next;
	}
	HashValue = $4;
	Main();
}

function Main(){
	if(Fname == Tmp_RetCode_UTF8){
		print > Tmp_Extracted_UTF8;
	} else if(Fname == Tmp_RetCode_SJIS){
		print > Tmp_Extracted_SJIS;
	} else if(Fname == Tmp_RetCode_EDIT){
		print > Tmp_Extracted_EDIT;
	} else if(Fname == Tmp_RetCode_XLSX){
		print > Tmp_Extracted_XLSX;
	} else if(Fname == Tmp_RetCode_CSV){
		print > Tmp_Extracted_CSV;
	} else {
		exit 99;
	}
}

