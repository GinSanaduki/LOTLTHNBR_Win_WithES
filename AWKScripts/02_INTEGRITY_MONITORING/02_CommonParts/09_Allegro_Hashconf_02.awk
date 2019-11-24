#! /usr/bin/gawk
# 09_Allegro_Hashconf_02.awk

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

@include "AWKScripts/01_UPDATE/02_CommonParts/01_Konzertouverture.awk";
@include "AWKScripts/02_INTEGRITY_MONITORING/02_CommonParts/01_Konzertouverture.awk";

# ------------------------------------------------------------------------------------------------------------------------

BEGIN{
	Konzertouverture_02();
	Allegro_Hashconf_02_RetCode = Allegro_Hashconf_02();
	print Allegro_Hashconf_02_RetCode > Tmp_RetCode_HASH;
}

# ------------------------------------------------------------------------------------------------------------------------

function Allegro_Hashconf_02(){
	# 本日日付以外のハッシュ表が存在するかを確認する
	Allegro_Hashconf_02_CMD_01_Ret =Allegro_Hashconf_02_Check01();
	if(Allegro_Hashconf_02_CMD_01_Ret == 1){
		print "HashConf内に本日日付以外のハッシュ表が存在しません。" > "con";
		close("con");
		return 99;
	}
	# 未来日付のハッシュ表の存在を検証する
	# 存在した場合、未来日付のハッシュ表を削除する
	Allegro_Hashconf_02_Check02();
	# 本日日付以外のハッシュ表が存在するかを確認する
	Allegro_Hashconf_02_CMD_01_Ret =Allegro_Hashconf_02_Check01();
	if(Allegro_Hashconf_02_CMD_01_Ret == 1){
		print "HashConf内に本日日付以外のハッシュ表が存在しません。" > "con";
		close("con");
		return 99;
	}
	return 0;
}

# ------------------------------------------------------------------------------------------------------------------------

function Allegro_Hashconf_02_Check01(){
	Allegro_Hashconf_02_CMD_01_00 = CALL_BUSYBOX_GLOB" ls "DIR_HASHCONF"/*.*";
	Allegro_Hashconf_02_CMD_01_01 = Allegro_Hashconf_02_CMD_01_00" | ";
	Allegro_Hashconf_02_CMD_01_02 = CALL_BUSYBOX" egrep -e \"^^"HASHCONFREG"\" | ";
	Allegro_Hashconf_02_CMD_01_03 = CALL_BUSYBOX" fgrep -q -v -e \""TODAY_HASHINFO"\"";
	Allegro_Hashconf_02_CMD_01 = Allegro_Hashconf_02_CMD_01_01 Allegro_Hashconf_02_CMD_01_02 Allegro_Hashconf_02_CMD_01_03;
	return RetExecCmd(Allegro_Hashconf_02_CMD_01);
}

# ------------------------------------------------------------------------------------------------------------------------

function Allegro_Hashconf_02_Check02(){
	Allegro_Hashconf_02_CMD_02_01 = Allegro_Hashconf_02_CMD_01_00" | ";
	Allegro_Hashconf_02_CMD_02_02 = CALL_BUSYBOX" egrep -e \"^^"HASHCONFREG"\" | ";
	Allegro_Hashconf_02_CMD_02_03 = CALL_BUSYBOX" fgrep -v -e \""TODAY_HASHINFO"\"";
	Allegro_Hashconf_02_CMD_02 = Allegro_Hashconf_02_CMD_02_01 Allegro_Hashconf_02_CMD_02_02 Allegro_Hashconf_02_CMD_02_03;
	Allegro_Hashconf_02_Check02_Cnt = 1;
	while(Allegro_Hashconf_02_CMD_02 | getline Allegro_Hashconf_02_CMD_02_ResText){
		Allegro_Hashconf_02_CMD_02_Arrays[Allegro_Hashconf_02_Check02_Cnt][1] = Allegro_Hashconf_02_CMD_02_ResText;
		Allegro_Hashconf_02_CMD_02_Arrays[Allegro_Hashconf_02_Check02_Cnt][2] = substr(Allegro_Hashconf_02_CMD_02_ResText,19,8);
		Allegro_Hashconf_02_Check02_Cnt++;
	}
	close(Allegro_Hashconf_02_CMD_02);
	# 2カラム目の数値から本日日付を減じて1以上の場合、当該ファイルを削除する。
	for(i in Allegro_Hashconf_02_CMD_02_Arrays){
		Allegro_Hashconf_02_CMD_02_Arrays_TEST = Allegro_Hashconf_02_CMD_02_Arrays[i][2] - TODAY;
		if(Allegro_Hashconf_02_CMD_02_Arrays_TEST > 0){
			Allegro_Hashconf_02_CMD_03 = CALL_BUSYBOX" rm \""Allegro_Hashconf_02_CMD_02_Arrays[i][1]"\" > "OUT_DEVNULL;
			ExecCmd(Allegro_Hashconf_02_CMD_03);
		}
	}
	delete Allegro_Hashconf_02_CMD_02_Arrays;
}

# ------------------------------------------------------------------------------------------------------------------------

