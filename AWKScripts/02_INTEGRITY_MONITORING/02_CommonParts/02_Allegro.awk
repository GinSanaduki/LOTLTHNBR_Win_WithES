#! /usr/bin/gawk
# 02_Allegro.awk

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

function Allegro(){
	AllegroCMD_01 = CALL_BUSYBOX" sh ShellScripts/03_CALL_INTEGRITY_MONITORING_Allegro_01.sh";
	ExecCmd(AllegroCMD_01);
	Allegro_Sub01();
	AllegroCMD_15 = CALL_BUSYBOX" sh ShellScripts/04_CALL_INTEGRITY_MONITORING_Allegro_02.sh";
	ExecCmd(AllegroCMD_15);
	Allegro_RetCode = Allegro_Sub02();
	RM(WorksDir);
	return Allegro_RetCode;
}

# ------------------------------------------------------------------------------------------------------------------------

function Allegro_Sub01(){
	Allegro_Sub01_RC_UTF8 = RetTextExecCmd(GetRetCode_UTF8);
	Allegro_Sub01_RC_SJIS = RetTextExecCmd(GetRetCode_SJIS);
	Allegro_Sub01_RC_EDIT = RetTextExecCmd(GetRetCode_EDIT);
	Allegro_Sub01_RC_XLSX = RetTextExecCmd(GetRetCode_XLSX);
	Allegro_Sub01_RC_CSV = RetTextExecCmd(GetRetCode_CSV);
	Allegro_Sub01_RC_HASH = RetTextExecCmd(GetRetCode_HASH);
	if(Allegro_Sub01_RC_UTF8 != 0 || Allegro_Sub01_RC_SJIS != 0 || Allegro_Sub01_RC_EDIT != 0 || Allegro_Sub01_RC_XLSX != 0 || Allegro_Sub01_RC_CSV != 0 || Allegro_Sub01_RC_HASH != 0){
		AllegroCMD_08 = CALL_BUSYBOX" sh ShellScripts/01_CALL_UPDATE.sh";
		ExecCmd(AllegroCMD_08);
	}
	MDRM(WorksDir);
}

# ------------------------------------------------------------------------------------------------------------------------

function Allegro_Sub02(){
	Allegro_Sub02_RetCode = 0;
	Allegro_Sub02_RC_UTF8 = RetTextExecCmd(GetRetCode_UTF8);
	Allegro_Sub02_RC_SJIS = RetTextExecCmd(GetRetCode_SJIS);
	Allegro_Sub02_RC_EDIT = RetTextExecCmd(GetRetCode_EDIT);
	Allegro_Sub02_RC_XLSX = RetTextExecCmd(GetRetCode_XLSX);
	Allegro_Sub02_RC_CSV = RetTextExecCmd(GetRetCode_CSV);
	Allegro_Sub02_RC_HASH = RetTextExecCmd(GetRetCode_HASH);
	if(Allegro_Sub02_RC_UTF8 != 0 || Allegro_Sub02_RC_SJIS != 0 || Allegro_Sub02_RC_EDIT != 0 || Allegro_Sub02_RC_XLSX != 0 || Allegro_Sub02_RC_CSV != 0 || Allegro_Sub02_RC_HASH != 0){
		Allegro_Sub02_RetCode = Allegro_Sub03();
	}
	MDRM(WorksDir);
	return Allegro_Sub02_RetCode;
}

# ------------------------------------------------------------------------------------------------------------------------

function Allegro_Sub03(){
	# AcquiredHTML_UTF8、AcquiredHTML_SJIS、AcquiredHTML_EDIT、
	# AcquiredXLSX、DefineCSV、HashConf配下に過去のファイルが存在しない場合、正常終了する。
	if(Allegro_Sub02_RC_UTF8 != 0 && Allegro_Sub02_RC_SJIS != 0 && Allegro_Sub02_RC_EDIT != 0 && Allegro_Sub02_RC_XLSX != 0 && Allegro_Sub02_RC_CSV != 0 && Allegro_Sub02_RC_HASH != 0){
		print "AcquiredHTML_UTF8、AcquiredHTML_SJIS、AcquiredHTML_EDIT、" > "con";
		print "AcquiredXLSX、DefineCSV、HashConfに本日日付のファイルしか存在しないため、" > "con";
		print "01_Konzert_fur_Klavier_und_Orchester_Nr27_B_Dur_K595を正常終了します。" > "con";
		close("con");
		return 99;
	}
	# 過去のハッシュ表が存在しない場合、リターンコードが0のファイルの区分の過去ファイルを削除し、正常終了する。
	if(Allegro_Sub02_RC_HASH != 0){
		print "HashConfに本日日付のファイルしか存在しないため、" > "con";
		print "過去日付のAcquiredHTML_UTF8、AcquiredHTML_SJIS、AcquiredHTML_EDIT、" > "con";
		print "AcquiredXLSX、DefineCSV配下のファイルを削除し、" > "con";
		print "01_Konzert_fur_Klavier_und_Orchester_Nr27_B_Dur_K595を正常終了します。" > "con";
		close("con");
		Allegro_Sub04();
		return 99;
	}
	return 0;
}

# ------------------------------------------------------------------------------------------------------------------------

function Allegro_Sub04(){
	if(Allegro_Sub02_RC_UTF8 == 0){
		print "AcquiredHTML_UTF8配下の過去日付ファイルの削除を開始します。" > "con";
		close("con");
		Allegro_Sub05();
		print "AcquiredHTML_UTF8配下の過去日付ファイルの削除が完了しました。" > "con";
		close("con");
	}
	if(Allegro_Sub02_RC_SJIS == 0){
		print "AcquiredHTML_SJIS配下の過去日付ファイルの削除を開始します。" > "con";
		close("con");
		Allegro_Sub06();
		print "AcquiredHTML_SJIS配下の過去日付ファイルの削除が完了しました。" > "con";
		close("con");
	}
	if(Allegro_Sub02_RC_EDIT == 0){
		print "AcquiredHTML_EDIT配下の過去日付ファイルの削除を開始します。" > "con";
		close("con");
		Allegro_Sub07();
		print "AcquiredHTML_EDIT配下の過去日付ファイルの削除が完了しました。" > "con";
		close("con");
	}
	if(Allegro_Sub02_RC_XLSX == 0){
		print "AcquiredXLSX配下の過去日付ファイルの削除を開始します。" > "con";
		close("con");
		Allegro_Sub08();
		print "AcquiredXLSX配下の過去日付ファイルの削除が完了しました。" > "con";
		close("con");
	}
	if(Allegro_Sub02_RC_CSV == 0){
		print "DefineCSV配下の過去日付ファイルの削除を開始します。" > "con";
		close("con");
		Allegro_Sub09();
		print "DefineCSV配下の過去日付ファイルの削除が完了しました。" > "con";
		close("con");
	}
}

# ------------------------------------------------------------------------------------------------------------------------

function Allegro_Sub05(){
	Allegro_Sub05_CMD_01_00 = CALL_BUSYBOX_GLOB" ls "DIR_HTML_UTF8"/*.*";
	Allegro_Sub05_CMD_01_01 = Allegro_Sub05_CMD_01_00" | ";
	Allegro_Sub05_CMD_01_02 = CALL_BUSYBOX" egrep -e \"^^"HTML_UTF8_HTMLNAMEREG"\" | ";
	Allegro_Sub05_CMD_01_03 = CALL_BUSYBOX" fgrep -v -e \""TODAY_HTML_UTF8"\"";
	Allegro_Sub05_CMD_01 = Allegro_Sub05_CMD_01_01 Allegro_Sub05_CMD_01_02 Allegro_Sub05_CMD_01_03;
	while(Allegro_Sub05_CMD_01 | getline Allegro_Sub05_CMD_01_ResText){
		Allegro_Sub05_CMD_02 = CALL_BUSYBOX" rm \""Allegro_Sub05_CMD_01_ResText"\" > "OUT_DEVNULL;
		ExecCmd(Allegro_Sub05_CMD_02);
	}
	close(Allegro_Sub05_CMD_01);
}

# ------------------------------------------------------------------------------------------------------------------------

function Allegro_Sub06(){
	Allegro_Sub06_CMD_01_00 = CALL_BUSYBOX_GLOB" ls "DIR_HTML_SJIS"/*.*";
	Allegro_Sub06_CMD_01_01 = Allegro_Sub06_CMD_01_00" | ";
	Allegro_Sub06_CMD_01_02 = CALL_BUSYBOX" egrep -e \"^^"HTML_SJIS_HTMLNAMEREG"\" | ";
	Allegro_Sub06_CMD_01_03 = CALL_BUSYBOX" fgrep -v -e \""TODAY_HTML_SJIS"\"";
	Allegro_Sub06_CMD_01 = Allegro_Sub06_CMD_01_01 Allegro_Sub06_CMD_01_02 Allegro_Sub06_CMD_01_03;
	while(Allegro_Sub06_CMD_01 | getline Allegro_Sub06_CMD_01_ResText){
		Allegro_Sub06_CMD_02 = CALL_BUSYBOX" rm \""Allegro_Sub06_CMD_01_ResText"\" > "OUT_DEVNULL;
		ExecCmd(Allegro_Sub06_CMD_02);
	}
	close(Allegro_Sub06_CMD_01);
}

# ------------------------------------------------------------------------------------------------------------------------

function Allegro_Sub07(){
	Allegro_Sub07_CMD_01_00 = CALL_BUSYBOX_GLOB" ls "DIR_HTML_EDIT"/*.*";
	Allegro_Sub07_CMD_01_01 = Allegro_Sub07_CMD_01_00" | ";
	Allegro_Sub07_CMD_01_02 = CALL_BUSYBOX" egrep -e \"^^"HTML_EDIT_HTMLNAMEREG"\" | ";
	Allegro_Sub07_CMD_01_03 = CALL_BUSYBOX" fgrep -v -e \""TODAY_HTML_EDIT"\"";
	Allegro_Sub07_CMD_01 = Allegro_Sub07_CMD_01_01 Allegro_Sub07_CMD_01_02 Allegro_Sub07_CMD_01_03;
	while(Allegro_Sub07_CMD_01 | getline Allegro_Sub07_CMD_01_ResText){
		Allegro_Sub07_CMD_02 = CALL_BUSYBOX" rm \""Allegro_Sub07_CMD_01_ResText"\" > "OUT_DEVNULL;
		ExecCmd(Allegro_Sub07_CMD_02);
	}
	close(Allegro_Sub07_CMD_01);
}

# ------------------------------------------------------------------------------------------------------------------------

function Allegro_Sub08(){
	Allegro_Sub08_CMD_01_00 = CALL_BUSYBOX_GLOB" ls "DIR_XLSX"/*.*";
	Allegro_Sub08_CMD_01_01 = Allegro_Sub08_CMD_01_00" | ";
	Allegro_Sub08_CMD_01_02 = CALL_BUSYBOX" egrep -e \"^^"XLSXREG"\" | ";
	Allegro_Sub08_CMD_01_03 = CALL_BUSYBOX" egrep -v -e \""TODAY_XLSX"\"";
	Allegro_Sub08_CMD_01 = Allegro_Sub08_CMD_01_01 Allegro_Sub08_CMD_01_02 Allegro_Sub08_CMD_01_03;
	while(Allegro_Sub08_CMD_01 | getline Allegro_Sub08_CMD_01_ResText){
		Allegro_Sub08_CMD_02 = CALL_BUSYBOX" rm \""Allegro_Sub08_CMD_01_ResText"\" > "OUT_DEVNULL;
		ExecCmd(Allegro_Sub08_CMD_02);
	}
	close(Allegro_Sub08_CMD_01);
}

# ------------------------------------------------------------------------------------------------------------------------

function Allegro_Sub09(){
	Allegro_Sub09_CMD_01_00 = CALL_BUSYBOX_GLOB" ls "DIR_DEFINECSV"/*.*";
	Allegro_Sub09_CMD_01_01 = Allegro_Sub09_CMD_01_00" | ";
	Allegro_Sub09_CMD_01_02 = CALL_BUSYBOX" egrep -e \"^^"CSVREG"\" | ";
	Allegro_Sub09_CMD_01_03 = CALL_BUSYBOX" egrep -v -e \""TODAY_CSV"\"";
	Allegro_Sub09_CMD_01 = Allegro_Sub09_CMD_01_01 Allegro_Sub09_CMD_01_02 Allegro_Sub09_CMD_01_03;
	while(Allegro_Sub09_CMD_01 | getline Allegro_Sub09_CMD_01_ResText){
		Allegro_Sub09_CMD_02 = CALL_BUSYBOX" rm \""Allegro_Sub09_CMD_01_ResText"\" > "OUT_DEVNULL;
		ExecCmd(Allegro_Sub09_CMD_02);
	}
	close(Allegro_Sub09_CMD_01);
}

# ------------------------------------------------------------------------------------------------------------------------

