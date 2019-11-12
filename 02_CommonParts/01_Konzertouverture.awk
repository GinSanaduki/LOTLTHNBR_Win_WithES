#! /usr/bin/gawk
# 01_Konzertouverture.awk

# ------------------------------------------------------------------------------------------------------------------------

# Copyright 2019 The LOTLTHNBR Project Authors, GinSanaduki.
# All rights reserved.
# Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
# LOTLTHNBR Scripts provides a function to obtain a list of non-returned license numbers of teacher licenses from the Ministry of Education, Culture, Sports, Science and Technology from the website of the Ministry of Education, Culture, Sports, Science and Technology, and to inquire by license number.
# This Scripts needs GAWK(the GNU implementation of the AWK programming language) version 4.0 or later and BusyBox developed by Erik Andersen, Rob Landley, Denys Vlasenko and others.
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

function Hammerklavier_Initialize(){
	Declaration();
	DirPrep();
}

# ------------------------------------------------------------------------------------------------------------------------

function Declaration(){
	MEXT_URL = "http://www.mext.go.jp/a_menu/shotou/kyoin/1342205.htm";
	HTML_FILENAME = "未返納教員免許状一覧_文部科学省_"strftime("%Y%m%d",systime())".txt";
	DIR_HTML_UTF8 = "AcquiredHTML_UTF8";
	DIR_HTML_SJIS = "AcquiredHTML_ShiftJIS";
	DIR_HTML_EDIT = "EditedHTML";
	DIR_HASHCONF = "HashConf";
	DIR_DEFINECSV = "DefineCSV";
	DIR_ACQUIREDXLSX = "AcquiredXLSX";
	FNAME_UTF8 = DIR_HTML_UTF8"/"HTML_FILENAME;
	FNAME_SJIS = DIR_HTML_SJIS"/"HTML_FILENAME;
	FNAME_EDIT = DIR_HTML_EDIT"/"HTML_FILENAME;
	FNAME_HASH = DIR_HASHCONF"/HashInfo_"strftime("%Y%m%d",systime())".def";
	KEYWORD_01 = "返納が必要であるにもかかわらず返納されていない教員免許状一覧";
	KEYWORD_02 = "<a href=\\\"\\/a_menu\\/shotou\\/kyoin\\/__icsFiles\\/afieldfile\\/2[0-9][0-9][0-9]\\/[0-1][0-9]\\/[0-3][0-9]\\/[0-9]+_[0-9]*\\.xlsx";
	KEYWORD_03 = substr(MEXT_URL,1,21);
	GENE_EXECSHELL = "EXECSHELL.sh";
	ColSearchWord01 = "授与権者";
	ColSearchWord02 = "免許番号";
	ColSearchWord03 = "教科";
	CALL_BUSYBOX = "LinuxTools\\busybox.exe";
	CALL_NKF32 = "LinuxTools\\nkf32.exe";
	OUT_DEVNULL = "nul 2>&1";
}

# ------------------------------------------------------------------------------------------------------------------------

function DirPrep(){
	MD(DIR_HTML_UTF8);
	MD(DIR_HTML_SJIS);
	MD(DIR_HTML_EDIT);
	MD(DIR_DEFINECSV);
	MD(DIR_ACQUIREDXLSX);
	GENEHASH();
}

# ------------------------------------------------------------------------------------------------------------------------

function ExecCmd(CMDTEXT){
	system(CMDTEXT);
	close(CMDTEXT);
}

# ------------------------------------------------------------------------------------------------------------------------

function RetExecCmd(CMDTEXT){
	RETVAL = system(CMDTEXT);
	close(CMDTEXT);
	return RETVAL;
}

# ------------------------------------------------------------------------------------------------------------------------

function RetTextExecCmd(CMDTEXT){
	while(CMDTEXT | getline RetTextExecCmdEsc){
		break;
	}
	close(CMDTEXT);
	return RetTextExecCmdEsc;
}

# ------------------------------------------------------------------------------------------------------------------------

function MD(DIR_MD){
	CMD_MD=CALL_BUSYBOX" mkdir -p \""DIR_MD"\" > "OUT_DEVNULL;
	ExecCmd(CMD_MD);
}

# ------------------------------------------------------------------------------------------------------------------------

function RM(DIR_RM){
	CMD_RM="LinuxTools\\busybox.exe rm -r \""DIR_RM"\" > "OUT_DEVNULL;
	ExecCmd(CMD_RM);
}

# ------------------------------------------------------------------------------------------------------------------------

function MDRM(DIR_MDRM){
	RM(DIR_MDRM);
	MD(DIR_MDRM);
}

# ------------------------------------------------------------------------------------------------------------------------

function GENEHASH(){
	cmd = CALL_BUSYBOX" ls "DIR_HASHCONF" > "OUT_DEVNULL;
	ret = RetExecCmd(cmd);
	if(ret == 1){
		HASHMAKE();
	}
	cmd = CALL_BUSYBOX" ls "FNAME_HASH" > "OUT_DEVNULL;
	ret = RetExecCmd(cmd);
	if(ret == 1){
		HASHMAKE();
	}
	cmd = CALL_BUSYBOX" find "FNAME_HASH" -size 0";
	ret = RetTextExecCmd(cmd);
	if(ret != ""){
		HASHMAKE();
	}
}

# ------------------------------------------------------------------------------------------------------------------------

function HASHMAKE(){
	MD(DIR_HASHCONF);
	cmd = CALL_BUSYBOX" touch "FNAME_HASH;
	ExecCmd(cmd);
	MDRM(DIR_HTML_UTF8);
	MDRM(DIR_HTML_SJIS);
	MDRM(DIR_HTML_EDIT);
	MDRM(DIR_DEFINECSV);
	MDRM(DIR_ACQUIREDXLSX);
}

# ------------------------------------------------------------------------------------------------------------------------

