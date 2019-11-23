#! /usr/bin/gawk
# 04_Allegro_AcquiredHTML_UTF8.awk

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

@include "AWKScripts/02_INTEGRITY_MONITORING/02_CommonParts/01_Konzertouverture_02.awk";

# ------------------------------------------------------------------------------------------------------------------------

BEGIN{
	Konzertouverture_02();
	Allegro_AcquiredHTML_UTF8_RetCode = Allegro_AcquiredHTML_UTF8();
	print Allegro_AcquiredHTML_UTF8_RetCode > Tmp_RetCode_UTF8;
}

# ------------------------------------------------------------------------------------------------------------------------

function Allegro_AcquiredHTML_UTF8(){
	# AcquiredHTML_UTF8/*.*の存在を確認する
	Allegro_AcquiredHTML_UTF8CMD_01_Ret = Allegro_AcquiredHTML_UTF8_Check01();
	if(Allegro_AcquiredHTML_UTF8CMD_01_Ret == 1){
		print "AcquiredHTML_UTF8内にファイルが存在しません。" > "con";
		print "Allegro終了後に取得を行います。" > "con";
		close("con");
		return 99;
	}
	# AcquiredHTML_UTF8/List_of_license_numbers_that_have_not_returned_a_teachers_license_2[0-9]{3}[0-1][0-9][0-3][0-9].txt以外を削除する
	Allegro_AcquiredHTML_UTF8CMD_02_Ret = Allegro_AcquiredHTML_UTF8_Check02();
	if(Allegro_AcquiredHTML_UTF8CMD_02_Ret == 0){
		print "AcquiredHTML_UTF8内にHTML以外のファイルが存在するため、削除します。" > "con";
		close("con");
		Allegro_AcquiredHTML_UTF8_Sub01();
	}
	# AcquiredHTML_UTF8/*.*の存在を確認する
	Allegro_AcquiredHTML_UTF8CMD_01_Ret = Allegro_AcquiredHTML_UTF8_Check01();
	if(Allegro_AcquiredHTML_UTF8CMD_01_Ret == 1){
		print "AcquiredHTML_UTF8内にファイルが存在しません。" > "con";
		print "Allegro終了後に取得を行います。" > "con";
		close("con");
		return 99;
	}
	# 本日日付のHTMLが存在するかを確認する
	Allegro_AcquiredHTML_UTF8CMD_03_Ret = Allegro_AcquiredHTML_UTF8_Check03();
	if(Allegro_AcquiredHTML_UTF8CMD_03_Ret == 1){
		print "AcquiredHTML_UTF8内に本日日付のHTMLが存在しません。" > "con";
		print "Allegro終了後に取得を行います。" > "con";
		close("con");
		return 99;
	}
	return 0;
}

# ------------------------------------------------------------------------------------------------------------------------

function Allegro_AcquiredHTML_UTF8_Sub01(Allegro_AcquiredHTML_UTF8_Sub01CMD_01,Allegro_AcquiredHTML_UTF8_Sub01CMD_02,Allegro_AcquiredHTML_UTF8_Sub01CMD_03,Allegro_AcquiredHTML_UTF8_Sub01CMD){
	Allegro_AcquiredHTML_UTF8_Sub01CMD_01 = Allegro_AcquiredHTML_UTF8CMD_02_01;
	Allegro_AcquiredHTML_UTF8_Sub01CMD_02 = CALL_BUSYBOX" egrep -v -e \"^^"HTML_UTF8_HTMLNAMEREG"\" | ";
	Allegro_AcquiredHTML_UTF8_Sub01CMD_03 = CALL_BUSYBOX" xargs -P 4 -I{} rm \"{}\" > "OUT_DEVNULL;
	Allegro_AcquiredHTML_UTF8_Sub01CMD = Allegro_AcquiredHTML_UTF8_Sub01CMD_01 Allegro_AcquiredHTML_UTF8_Sub01CMD_02 Allegro_AcquiredHTML_UTF8_Sub01CMD_03;
	ExecCmd(Allegro_AcquiredHTML_UTF8_Sub01CMD);
}

# ------------------------------------------------------------------------------------------------------------------------

function Allegro_AcquiredHTML_UTF8_Check01(){
	Allegro_AcquiredHTML_UTF8CMD_00 = CALL_BUSYBOX_GLOB" ls "DIR_HTML_UTF8"/*.*";
	Allegro_AcquiredHTML_UTF8CMD_01 = Allegro_AcquiredHTML_UTF8CMD_00" > "OUT_DEVNULL;
	return RetExecCmd(Allegro_AcquiredHTML_UTF8CMD_01);
}

# ------------------------------------------------------------------------------------------------------------------------

function Allegro_AcquiredHTML_UTF8_Check02(){
	Allegro_AcquiredHTML_UTF8CMD_02_01 = Allegro_AcquiredHTML_UTF8CMD_00" | ";
	Allegro_AcquiredHTML_UTF8CMD_02_02 = CALL_BUSYBOX" egrep -q -v -e \"^^"HTML_UTF8_HTMLNAMEREG"\"";
	Allegro_AcquiredHTML_UTF8CMD_02 = Allegro_AcquiredHTML_UTF8CMD_02_01 Allegro_AcquiredHTML_UTF8CMD_02_02;
	return RetExecCmd(Allegro_AcquiredHTML_UTF8CMD_02);
}

# ------------------------------------------------------------------------------------------------------------------------

function Allegro_AcquiredHTML_UTF8_Check03(){
	Allegro_AcquiredHTML_UTF8CMD_03_01 = Allegro_AcquiredHTML_UTF8CMD_00" | ";
	Allegro_AcquiredHTML_UTF8CMD_03_02 = CALL_BUSYBOX" egrep -e \"^^"HTML_UTF8_HTMLNAMEREG"\" | ";
	Allegro_AcquiredHTML_UTF8CMD_03_03 = CALL_BUSYBOX" fgrep -q -e \""TODAY_HTML_UTF8"\"";
	Allegro_AcquiredHTML_UTF8CMD_03 = Allegro_AcquiredHTML_UTF8CMD_03_01 Allegro_AcquiredHTML_UTF8CMD_03_02 Allegro_AcquiredHTML_UTF8CMD_03_03;
	return RetExecCmd(Allegro_AcquiredHTML_UTF8CMD_03);
}

# ------------------------------------------------------------------------------------------------------------------------

