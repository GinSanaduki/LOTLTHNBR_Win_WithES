#! /usr/bin/gawk
# 15_Larghetto.awk

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

function Larghetto(){
	# ハッシュ表のファイル名の日付に存在しない日付のAcquiredHTML_UTF8、
	# AcquiredHTML_SJIS、AcquiredHTML_EDIT、AcquiredXLSX、
	# DefineCSV配下のファイルを削除する。
	# Larghetto_Sub01();
	# ハッシュ表との整合性チェック
	Larghetto_Sub03();
}

# ------------------------------------------------------------------------------------------------------------------------

function Larghetto_Sub01(){
	# ハッシュ表のファイル名から日付を取得し、配列に格納する
	Larghetto_Sub01_CMD_01_00 = CALL_BUSYBOX_GLOB" ls "DIR_HASHCONF"/*.*";
	Larghetto_Sub01_CMD_01_01 = Larghetto_Sub01_CMD_01_00" | ";
	Larghetto_Sub01_CMD_01_02 = CALL_BUSYBOX" egrep -e \"^^"HASHCONFREG"\"";
	Larghetto_Sub01_CMD_01 = Larghetto_Sub01_CMD_01_01 Larghetto_Sub01_CMD_01_02;
	Larghetto_Sub01_CMD_01_Cnt = 1;
	while(Larghetto_Sub01_CMD_01 | getline Larghetto_Sub01_CMD_01_ResText){
		Larghetto_Sub01_CMD_01Array[Larghetto_Sub01_CMD_01_Cnt] = substr(Larghetto_Sub01_CMD_01_ResText,19,8);
		Larghetto_Sub01_CMD_01_Cnt++;
	}
	close(Larghetto_Sub01_CMD_01);
	
	# AcquiredHTML_UTF8の検査
	print "AcquiredHTML_UTF8配下の過去日付ファイルの検査を開始します。" > "con";
	close("con");
	Larghetto_Sub02(DIR_HTML_UTF8,HTML_UTF8_HTMLNAMEREG);
	print "AcquiredHTML_UTF8配下の過去日付ファイルの検査が完了しました。" > "con";
	close("con");
	
	# AcquiredHTML_ShiftJISの検査
	print "AcquiredHTML_ShiftJIS配下の過去日付ファイルの検査を開始します。" > "con";
	close("con");
	Larghetto_Sub02(DIR_HTML_SJIS,HTML_SJIS_HTMLNAMEREG);
	print "AcquiredHTML_ShiftJIS配下の過去日付ファイルの検査が完了しました。" > "con";
	close("con");

	# EditedHTMLの検査
	print "EditedHTML配下の過去日付ファイルの検査を開始します。" > "con";
	close("con");
	Larghetto_Sub02(DIR_HTML_EDIT,HTML_EDIT_HTMLNAMEREG);
	print "EditedHTML配下の過去日付ファイルの検査が完了しました。" > "con";
	close("con");
	
	# AcquiredXLSXの検査
	print "AcquiredXLSX配下の過去日付ファイルの検査を開始します。" > "con";
	close("con");
	Larghetto_Sub02(DIR_XLSX,XLSXREG);
	print "AcquiredXLSX配下の過去日付ファイルの検査が完了しました。" > "con";
	close("con");
	
	# DefineCSVの検査
	print "DefineCSV配下の過去日付ファイルの検査を開始します。" > "con";
	close("con");
	Larghetto_Sub02(DIR_DEFINECSV,CSVREG);
	print "DefineCSV配下の過去日付ファイルの検査が完了しました。" > "con";
	close("con");
	
	delete Larghetto_Sub01_CMD_01Array;
}

# ------------------------------------------------------------------------------------------------------------------------

function Larghetto_Sub02(Larghetto_Sub02_ArgsDir,Larghetto_Sub02_FILENAMEREG){
	Larghetto_Sub02_CMD_01_00 = CALL_BUSYBOX_GLOB" ls "Larghetto_Sub02_ArgsDir"/*.*";
	Larghetto_Sub02_CMD_01_01 = Larghetto_Sub02_CMD_01_00" | ";
	Larghetto_Sub02_CMD_01_02 = CALL_BUSYBOX" egrep -e \"^^"Larghetto_Sub02_FILENAMEREG"\"";
	Larghetto_Sub02_CMD_01 = Larghetto_Sub02_CMD_01_01 Larghetto_Sub02_CMD_01_02;
	Larghetto_Sub02_CMD_01_BitField = 0;
	while(Larghetto_Sub02_CMD_01 | getline Larghetto_Sub02_CMD_01_ResText){
		Larghetto_Sub02_CMD_01_BitField = 0;
		if(Larghetto_Sub02_FILENAMEREG == HTML_UTF8_HTMLNAMEREG){
			Larghetto_Sub02_CMD_01_YYYYMMDD = substr(Larghetto_Sub02_CMD_01_ResText,85,8);
		} else if(Larghetto_Sub02_FILENAMEREG == HTML_SJIS_HTMLNAMEREG){
			Larghetto_Sub02_CMD_01_YYYYMMDD = substr(Larghetto_Sub02_CMD_01_ResText,89,8);
		} else if(Larghetto_Sub02_FILENAMEREG == HTML_EDIT_HTMLNAMEREG){
			Larghetto_Sub02_CMD_01_YYYYMMDD = substr(Larghetto_Sub02_CMD_01_ResText,78,8);
		} else if(Larghetto_Sub02_FILENAMEREG == XLSXREG){
			Larghetto_Sub02_CMD_01_YYYYMMDD = substr(Larghetto_Sub02_CMD_01_ResText,26,8);
		} else if(Larghetto_Sub02_FILENAMEREG == CSVREG){
			Larghetto_Sub02_CMD_01_YYYYMMDD = substr(Larghetto_Sub02_CMD_01_ResText,23,8);
		} else {
			exit 99;
		}
		
		# ハッシュ表の日付と照合し、一致した場合ビットを反転させる。
		for(i in Larghetto_Sub01_CMD_01Array){
			if(Larghetto_Sub01_CMD_01Array[i] == Larghetto_Sub02_CMD_01_YYYYMMDD){
				Larghetto_Sub02_CMD_01_BitField = 1;
				break;
			}
		}
		# ビットが反転していない場合、当該ファイルを削除する。
		if(Larghetto_Sub02_CMD_01_BitField == 0){
			Larghetto_Sub02_CMD_02 = CALL_BUSYBOX" rm \""Larghetto_Sub02_CMD_01_ResText"\" > "OUT_DEVNULL;
			ExecCmd(Larghetto_Sub02_CMD_02);
		}
	}
	close(Larghetto_Sub02_CMD_01);
}

# ------------------------------------------------------------------------------------------------------------------------

function Larghetto_Sub03(){
	# DefineCSV配下の各ハッシュ表の各行の先頭にハッシュ表のファイル名を挿入し、配列に格納する
	Larghetto_Sub03_CMD01 = CALL_GAWK" -f AWKScripts/02_INTEGRITY_MONITORING/03_SubSystem/01_Larghetto_SubSystem_01.awk HashConf/HashInfo_2*.def";
	Larghetto_Sub03_CMD01_Cnt = 1;
	while(Larghetto_Sub03_CMD01 | getline Larghetto_Sub03_CMD01_RetLine){
		Larghetto_Sub03_CMD01Arrays[Larghetto_Sub03_CMD01_Cnt] = Larghetto_Sub03_CMD01_RetLine;
		Larghetto_Sub03_CMD01_Cnt++;
	}
	close(Larghetto_Sub03_CMD01);
	
	# DefineCSV配下の各ハッシュ表の各ファイル名とビット値を配列に格納する
	Larghetto_Sub03_CMD02 = CALL_GAWK" -f AWKScripts/02_INTEGRITY_MONITORING/03_SubSystem/02_Larghetto_SubSystem_02.awk HashConf/HashInfo_2*.def";
	Larghetto_Sub03_CMD02_Cnt = 1;
	while(Larghetto_Sub03_CMD02 | getline Larghetto_Sub03_CMD02_RetLine){
		Larghetto_Sub03_CMD02Arrays[Larghetto_Sub03_CMD01_Cnt][1] = Larghetto_Sub03_CMD02_RetLine;
		# ハッシュ表の抹消ビット(CSV)
		Larghetto_Sub03_CMD02Arrays[Larghetto_Sub03_CMD01_Cnt][2] = "0";
		# ハッシュ表の抹消ビット(XLSX)
		Larghetto_Sub03_CMD02Arrays[Larghetto_Sub03_CMD01_Cnt][3] = "0";
		Larghetto_Sub03_CMD02_Cnt++;
	}
	close(Larghetto_Sub03_CMD02);
	
	# 2カラム目の先頭から22字までが「DefineCSV/Define_Gene_」の場合、
	# 存在チェックとハッシュ値の検証を行う。
	for(i in Larghetto_Sub03_CMD01Arrays){
		split(Larghetto_Sub03_CMD01Arrays[i],Larghetto_Sub03_CMD01ArraysLine,",");
		if(substr(Larghetto_Sub03_CMD01ArraysLine[2],1,22) == "DefineCSV/Define_Gene_"){
			# print Larghetto_Sub03_CMD01ArraysLine[2];
			Larghetto_Sub04();
		}
		delete Larghetto_Sub03_CMD01ArraysLine;
	}
}

# ------------------------------------------------------------------------------------------------------------------------

function Larghetto_Sub04(){
	Larghetto_Sub04_CMD01 = CALL_BUSYBOX" ls "Larghetto_Sub03_CMD01ArraysLine[2]" > "OUT_DEVNULL;
	Larghetto_Sub04_CMD01_Ret = RetExecCmd(Larghetto_Sub04_CMD01);
	if(Larghetto_Sub04_CMD01_Ret == 1){
		# Larghetto_Sub03_CMD02Arraysの当該ハッシュ表名に紐付くハッシュ表の抹消ビット(CSV)を反転させる。
		Larghetto_Sub05();
	} else {
		Larghetto_Sub04_CMD01_HashValue = GetHashValue(Larghetto_Sub03_CMD01ArraysLine[2]);
		if(Larghetto_Sub03_CMD01ArraysLine[3] != Larghetto_Sub04_CMD01_HashValue){
			# Larghetto_Sub03_CMD02Arraysの当該ハッシュ表名に紐付くハッシュ表の抹消ビット(CSV)を反転させる。
			print "以下のCSVファイルとハッシュ表のハッシュ値が不一致でした。" > "con";
			print "XLSXファイルの検証で復元できる可能性があります。" > "con";
			print "CSVファイル名　：　"Larghetto_Sub03_CMD01ArraysLine[2] > "con";
			print "CSVファイルのハッシュ値　：　"Larghetto_Sub04_CMD01_HashValue > "con";
			print "ハッシュ表ファイル名　：　"Larghetto_Sub03_CMD01ArraysLine[1] > "con";
			print "ハッシュ表に記録されているハッシュ値　：　"Larghetto_Sub03_CMD01ArraysLine[3] > "con";
			close("con");
			Larghetto_Sub05();
			# 当該CSVファイルを削除
			Larghetto_Sub04_CMD02 = CALL_BUSYBOX" rm \""Larghetto_Sub03_CMD01ArraysLine[2]"\" > "OUT_DEVNULL;
			ExecCmd(Larghetto_Sub04_CMD02);
		}
	}
}

# ------------------------------------------------------------------------------------------------------------------------

function Larghetto_Sub05(){
	for(j in Larghetto_Sub03_CMD02Arrays){
		if(Larghetto_Sub03_CMD02Arrays[j][1] == Larghetto_Sub03_CMD01ArraysLine[1]){
			Larghetto_Sub03_CMD02Arrays[j][2] = "1";
			break;
		}
	}
}

# ------------------------------------------------------------------------------------------------------------------------

# CSVが存在し、ハッシュが一致していた場合はOK。存在しないか、ハッシュが不一致の場合は、XLSXを検証し、XLSXが存在しないかハッシュ値が不一致の場合、その日付のファイルを抹消する。ハッシュを確認し、一致していた場合はそのXLSXでCSVを作り直し、ハッシュ表を書き直す。
# deleteマーカーのない、過去日付のAccquiredXLSXの存在チェック
# XLSXが存在し、ハッシュが一致していた場合はOK。存在しないか、ハッシュが不一致の場合は、ファイルを削除しdeleteマーカーをつける。
# deleteマーカーのない、過去日付のEDITHTMLの存在チェック
# EDITHTMLが存在し、ハッシュが一致していた場合はOK。存在しないか、ハッシュが不一致の場合は、SJISHTMLが存在し、ハッシュ値が一致するかを検証する。それでよければ、SJISから作り直す。それもだめなら、UTF-8から作り直し、UTF-8もだめなら、HTMLは全削除し、deleteマーカーをつける。
