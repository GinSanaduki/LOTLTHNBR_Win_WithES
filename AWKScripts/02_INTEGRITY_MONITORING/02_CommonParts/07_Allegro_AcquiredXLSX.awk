#! /usr/bin/gawk
# 07_Allegro_AcquiredXLSX.awk

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

# ------------------------------------------------------------------------------------------------------------------------

BEGIN{
	Konzertouverture();
	Allegro_AcquiredXLSX_RetCode = Allegro_AcquiredXLSX();
	print Allegro_AcquiredXLSX_RetCode > Tmp_RetCode_XLSX;
}

# ------------------------------------------------------------------------------------------------------------------------

function Allegro_AcquiredXLSX(){
	# AcquiredXLSX/*.*の存在を確認する
	Allegro_AcquiredXLSXCMD_01_Ret = Allegro_AcquiredXLSX_Check01();
	if(Allegro_AcquiredXLSXCMD_01_Ret == 1){
		print "AcquiredXLSX内にファイルが存在しません。" > "con";
		print "Allegro終了後に取得を行います。" > "con";
		close("con");
		return 99;
	}
	# AcquiredXLSX/Acquisition_2[0-9]{3}[0-1][0-9][0-3][0-9]_UnderText_From_2[0-9]{3}[0-1][0-9]_To_2[0-9]{3}[0-1][0-9]_Origin_.+\.xlsx以外を削除する
	Allegro_AcquiredXLSXCMD_02_Ret = Allegro_AcquiredXLSX_Check02();
	if(Allegro_AcquiredXLSXCMD_02_Ret == 0){
		print "AcquiredXLSX内にHTML以外のファイルが存在するため、削除します。" > "con";
		close("con");
		Allegro_AcquiredXLSX_Sub01();
	}
	# AcquiredXLSX/*.*の存在を確認する
	Allegro_AcquiredXLSXCMD_01_Ret = Allegro_AcquiredXLSX_Check01();
	if(Allegro_AcquiredXLSXCMD_01_Ret == 1){
		print "AcquiredXLSX内にファイルが存在しません。" > "con";
		print "Allegro終了後に取得を行います。" > "con";
		close("con");
		return 99;
	}
	# 本日日付のXLSXが存在するかを確認する
	Allegro_AcquiredXLSXCMD_03_Ret = Allegro_AcquiredXLSX_Check03();
	if(Allegro_AcquiredXLSXCMD_03_Ret == 1){
		print "AcquiredXLSX内に本日日付のXLSXが存在しません。" > "con";
		print "Allegro終了後に取得を行います。" > "con";
		close("con");
		return 99;
	}
	return 0;
}

# ------------------------------------------------------------------------------------------------------------------------

function Allegro_AcquiredXLSX_Sub01(Allegro_AcquiredXLSX_Sub01CMD_01,Allegro_AcquiredXLSX_Sub01CMD_02,Allegro_AcquiredXLSX_Sub01CMD_03,Allegro_AcquiredXLSX_Sub01CMD){
	Allegro_AcquiredXLSX_Sub01CMD_01 = Allegro_AcquiredXLSXCMD_02_01;
	Allegro_AcquiredXLSX_Sub01CMD_02 = CALL_BUSYBOX" egrep -v -e \"^^"XLSXREG"\" | ";
	Allegro_AcquiredXLSX_Sub01CMD_03 = CALL_BUSYBOX" xargs -P 4 -I{} rm \"{}\" > "OUT_DEVNULL;
	Allegro_AcquiredXLSX_Sub01CMD = Allegro_AcquiredXLSX_Sub01CMD_01 Allegro_AcquiredXLSX_Sub01CMD_02 Allegro_AcquiredXLSX_Sub01CMD_03;
	ExecCmd(Allegro_AcquiredXLSX_Sub01CMD);
}

# ------------------------------------------------------------------------------------------------------------------------

function Allegro_AcquiredXLSX_Check01(){
	Allegro_AcquiredXLSXCMD_00 = CALL_BUSYBOX_GLOB" ls "DIR_XLSX"/*.*";
	Allegro_AcquiredXLSXCMD_01 = Allegro_AcquiredXLSXCMD_00" > "OUT_DEVNULL;
	return RetExecCmd(Allegro_AcquiredXLSXCMD_01);
}

# ------------------------------------------------------------------------------------------------------------------------

function Allegro_AcquiredXLSX_Check02(){
	Allegro_AcquiredXLSXCMD_02_01 = Allegro_AcquiredXLSXCMD_00" | ";
	Allegro_AcquiredXLSXCMD_02_02 = CALL_BUSYBOX" egrep -q -v -e \"^^"XLSXREG"\"";
	Allegro_AcquiredXLSXCMD_02 = Allegro_AcquiredXLSXCMD_02_01 Allegro_AcquiredXLSXCMD_02_02;
	return RetExecCmd(Allegro_AcquiredXLSXCMD_02);
}

# ------------------------------------------------------------------------------------------------------------------------

function Allegro_AcquiredXLSX_Check03(){
	Allegro_AcquiredXLSXCMD_03_01 = Allegro_AcquiredXLSXCMD_00" | ";
	Allegro_AcquiredXLSXCMD_03_02 = CALL_BUSYBOX" egrep -e \"^^"XLSXREG"\" | ";
	Allegro_AcquiredXLSXCMD_03_03 = CALL_BUSYBOX" egrep -q -e \""TODAY_XLSX"\"";
	Allegro_AcquiredXLSXCMD_03 = Allegro_AcquiredXLSXCMD_03_01 Allegro_AcquiredXLSXCMD_03_02 Allegro_AcquiredXLSXCMD_03_03;
	return RetExecCmd(Allegro_AcquiredXLSXCMD_03);
}

# ------------------------------------------------------------------------------------------------------------------------

