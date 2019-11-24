#! /usr/bin/gawk
# 16_Allegro_Rondo.awk

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

function Allegro_Rondo(){
	Allegro_Rondo_Sub01();
	Allegro_Rondo_Sub02();
	Allegro_Rondo_Sub03();
	Allegro_Rondo_Sub04();
	RM(WorksDir);
}

# ------------------------------------------------------------------------------------------------------------------------

function Allegro_Rondo_Sub01(){
	# UTF-8を回収
	Allegro_Rondo_Sub01_CMD01_01 = CALL_GAWK" -f AWKScripts/02_INTEGRITY_MONITORING/03_SubSystem/04_Allegro_Rondo_SubSystem_01.awk HashConf/HashInfo_2*.def | ";
	Allegro_Rondo_Sub01_CMD01_02 = CALL_BUSYBOX" fgrep -e \""CheckFile_UTF8"\" | ";
	Allegro_Rondo_Sub01_CMD01_03 = CALL_BUSYBOX" sort -t \",\" -k 2nr,2 > \""Tmp_RetCode_UTF8"\"";
	Allegro_Rondo_Sub01_CMD01 = Allegro_Rondo_Sub01_CMD01_01 Allegro_Rondo_Sub01_CMD01_02 Allegro_Rondo_Sub01_CMD01_03;
	# Shift-JISを回収
	Allegro_Rondo_Sub01_CMD02_01 = Allegro_Rondo_Sub01_CMD01_01;
	Allegro_Rondo_Sub01_CMD02_02 = CALL_BUSYBOX" fgrep -e \""CheckFile_SJIS"\" | ";
	Allegro_Rondo_Sub01_CMD02_03 = CALL_BUSYBOX" sort -t \",\" -k 2nr,2 > \""Tmp_RetCode_SJIS"\"";
	Allegro_Rondo_Sub01_CMD02 = Allegro_Rondo_Sub01_CMD02_01 Allegro_Rondo_Sub01_CMD02_02 Allegro_Rondo_Sub01_CMD02_03;
	# EDITHTMLを回収
	Allegro_Rondo_Sub01_CMD03_01 = Allegro_Rondo_Sub01_CMD01_01;
	Allegro_Rondo_Sub01_CMD03_02 = CALL_BUSYBOX" fgrep -e \""CheckFile_EDIT"\" | ";
	Allegro_Rondo_Sub01_CMD03_03 = CALL_BUSYBOX" sort -t \",\" -k 2nr,2 > \""Tmp_RetCode_EDIT"\"";
	Allegro_Rondo_Sub01_CMD03 = Allegro_Rondo_Sub01_CMD03_01 Allegro_Rondo_Sub01_CMD03_02 Allegro_Rondo_Sub01_CMD03_03;
	# XLSXを回収
	Allegro_Rondo_Sub01_CMD04_01 = Allegro_Rondo_Sub01_CMD01_01;
	Allegro_Rondo_Sub01_CMD04_02 = CALL_BUSYBOX" fgrep -e \","CheckFile_XLSX"\" | ";
	# DefineCSV行共通部分を除外
	Allegro_Rondo_Sub01_CMD04_03 = CALL_BUSYBOX" fgrep -v -e \","CheckFile_CSV"\" | ";
	Allegro_Rondo_Sub01_CMD04_04 = CALL_BUSYBOX" sort -t \",\" -k 2nr,2 > \""Tmp_RetCode_XLSX"\"";
	Allegro_Rondo_Sub01_CMD04 = Allegro_Rondo_Sub01_CMD04_01 Allegro_Rondo_Sub01_CMD04_02 Allegro_Rondo_Sub01_CMD04_03 Allegro_Rondo_Sub01_CMD04_04;
	# CSVを回収
	Allegro_Rondo_Sub01_CMD05_01 = Allegro_Rondo_Sub01_CMD01_01;
	Allegro_Rondo_Sub01_CMD05_02 = CALL_BUSYBOX" fgrep -e \","CheckFile_CSV"\" | ";
	Allegro_Rondo_Sub01_CMD05_03 = CALL_BUSYBOX" sort -t \",\" -k 2nr,2 > \""Tmp_RetCode_CSV"\"";
	Allegro_Rondo_Sub01_CMD05 = Allegro_Rondo_Sub01_CMD05_01 Allegro_Rondo_Sub01_CMD05_02 Allegro_Rondo_Sub01_CMD05_03;
	ExecCmd(Allegro_Rondo_Sub01_CMD01);
	ExecCmd(Allegro_Rondo_Sub01_CMD02);
	ExecCmd(Allegro_Rondo_Sub01_CMD03);
	ExecCmd(Allegro_Rondo_Sub01_CMD04);
	ExecCmd(Allegro_Rondo_Sub01_CMD05);
}

# ------------------------------------------------------------------------------------------------------------------------

function Allegro_Rondo_Sub02(){
	Allegro_Rondo_Sub02_CMD01 = CALL_GAWK" -f AWKScripts/02_INTEGRITY_MONITORING/03_SubSystem/05_Allegro_Rondo_SubSystem_02.awk "Tmp_RetCode_UTF8" "Tmp_RetCode_SJIS" "Tmp_RetCode_EDIT" "Tmp_RetCode_XLSX" "Tmp_RetCode_CSV;
	ExecCmd(Allegro_Rondo_Sub02_CMD01);
	Allegro_Rondo_Sub02_CMD02 = CALL_BUSYBOX" rm \""Tmp_RetCode_UTF8"\" > "OUT_DEVNULL;
	Allegro_Rondo_Sub02_CMD03 = CALL_BUSYBOX" rm \""Tmp_RetCode_SJIS"\" > "OUT_DEVNULL;
	Allegro_Rondo_Sub02_CMD04 = CALL_BUSYBOX" rm \""Tmp_RetCode_EDIT"\" > "OUT_DEVNULL;
	Allegro_Rondo_Sub02_CMD05 = CALL_BUSYBOX" rm \""Tmp_RetCode_XLSX"\" > "OUT_DEVNULL;
	Allegro_Rondo_Sub02_CMD06 = CALL_BUSYBOX" rm \""Tmp_RetCode_CSV"\" > "OUT_DEVNULL;
	ExecCmd(Allegro_Rondo_Sub02_CMD02);
	ExecCmd(Allegro_Rondo_Sub02_CMD03);
	ExecCmd(Allegro_Rondo_Sub02_CMD04);
	ExecCmd(Allegro_Rondo_Sub02_CMD05);
	ExecCmd(Allegro_Rondo_Sub02_CMD06);
}

# ------------------------------------------------------------------------------------------------------------------------

function Allegro_Rondo_Sub03(){
	Allegro_Rondo_Sub03_CMD01 = CALL_GAWK" -f AWKScripts/02_INTEGRITY_MONITORING/03_SubSystem/06_Allegro_Rondo_SubSystem_03.awk "Tmp_Extracted_Other;
	ExecCmd(Allegro_Rondo_Sub03_CMD01);
	Allegro_Rondo_Sub03_CMD02 = CALL_BUSYBOX" rm \""Tmp_Extracted_Other"\" > "OUT_DEVNULL;
	ExecCmd(Allegro_Rondo_Sub03_CMD02);
}

# ------------------------------------------------------------------------------------------------------------------------

function Allegro_Rondo_Sub04(){
	MDRM(DIR_HASHCONF);
	Allegro_Rondo_Sub04_CMD01_01 = CALL_BUSYBOX" cat "Tmp_Extracted_UTF8" "Tmp_Extracted_SJIS" "Tmp_Extracted_EDIT" "Tmp_Extracted_XLSX" "Tmp_Extracted_CSV" | ";
	Allegro_Rondo_Sub04_CMD01_02 = CALL_BUSYBOX" sort -t \",\" -k 2nr,2";
	Allegro_Rondo_Sub04_CMD01 = Allegro_Rondo_Sub04_CMD01_01 Allegro_Rondo_Sub04_CMD01_02;
	while(Allegro_Rondo_Sub04_CMD01 | getline Allegro_Rondo_Sub04_CMD01_RetText){
		split(Allegro_Rondo_Sub04_CMD01_RetText,Allegro_Rondo_Sub04_CMD01_RetTextArrays,",");
		if(substr(Allegro_Rondo_Sub04_CMD01_RetTextArrays[3],1,84) == CheckFile_UTF8){
			print Allegro_Rondo_Sub04_CMD01_RetTextArrays[3]","Allegro_Rondo_Sub04_CMD01_RetTextArrays[4]","Allegro_Rondo_Sub04_CMD01_RetTextArrays[5]","Allegro_Rondo_Sub04_CMD01_RetTextArrays[6] > Allegro_Rondo_Sub04_CMD01_RetTextArrays[1];
		} else if(substr(Allegro_Rondo_Sub04_CMD01_RetTextArrays[3],1,88) == CheckFile_SJIS){
			print Allegro_Rondo_Sub04_CMD01_RetTextArrays[3]","Allegro_Rondo_Sub04_CMD01_RetTextArrays[4] > Allegro_Rondo_Sub04_CMD01_RetTextArrays[1];
		} else if(substr(Allegro_Rondo_Sub04_CMD01_RetTextArrays[3],1,77) == CheckFile_EDIT){
			print Allegro_Rondo_Sub04_CMD01_RetTextArrays[3]","Allegro_Rondo_Sub04_CMD01_RetTextArrays[4] > Allegro_Rondo_Sub04_CMD01_RetTextArrays[1];
		} else if(substr(Allegro_Rondo_Sub04_CMD01_RetTextArrays[3],1,25) == CheckFile_XLSX){
			print Allegro_Rondo_Sub04_CMD01_RetTextArrays[3]","Allegro_Rondo_Sub04_CMD01_RetTextArrays[4]","Allegro_Rondo_Sub04_CMD01_RetTextArrays[5]","Allegro_Rondo_Sub04_CMD01_RetTextArrays[6] > Allegro_Rondo_Sub04_CMD01_RetTextArrays[1];
		}else if(substr(Allegro_Rondo_Sub04_CMD01_RetTextArrays[3],1,22) == CheckFile_CSV){
			print Allegro_Rondo_Sub04_CMD01_RetTextArrays[3]","Allegro_Rondo_Sub04_CMD01_RetTextArrays[4]","Allegro_Rondo_Sub04_CMD01_RetTextArrays[5]","Allegro_Rondo_Sub04_CMD01_RetTextArrays[6] > Allegro_Rondo_Sub04_CMD01_RetTextArrays[1];
		}
		delete Allegro_Rondo_Sub04_CMD01_RetTextArrays;
	}
	close(Allegro_Rondo_Sub04_CMD01);
}

