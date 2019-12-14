#! /usr/bin/gawk
# 07_Menuet.awk

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

function Menuet(){
	Menuet_Sub01_RetCode = Menuet_Sub01();
	Menuet_Sub02();
	# CAUTION区分でWARNINGと共通部分コンポーネント以外のコンポーネントが存在しない場合は1
	# CAUTION区分が存在しない場合も1
	# CAUTION区分が存在する（WARNINGと共通部分コンポーネント以外のコンポーネントが存在する）場合は0に反転
	Menuet_Sub03_RetCode = 1;
	if(Menuet_Sub01_RetCode == 0){
		Menuet_Sub03_RetCode = Menuet_Sub03();
	} else {
		Menuet_Sub04();
	}
}

# ------------------------------------------------------------------------------------------------------------------------

function Menuet_Sub01(){
	DeadCnt = 0;
	while(1){
		if(DeadCnt > 3){
			print "最新分の定義ファイル作成に一定回失敗したため、異常終了します。" > "con";
			close("con");
			exit 99;
		}
		Menuet_Sub01_CMD01 = CALL_BUSYBOX" sh ShellScripts/03_DETECTOR/04_Menuet/01_CALL_DETECTOR_Menuet_01.sh";
		# RCが0：ファイルリストが2件以上
		# RCが1：ファイルリストが1件のみ（最新分のみ存在する）
		# RCが2：ファイルリストが0件
		Menuet_Sub01_CMD01_RetCode = RetExecCmd(Menuet_Sub01_CMD01);
		if(Menuet_Sub01_CMD01_RetCode == 2){
			print "DefineCSV配下の照会定義CSVファイルが空ファイルです。" > "con";
			print "最新分の定義CSVファイルを作成します。" > "con";
			close("con");
			Menuet_Sub01_CMD02 = CALL_BUSYBOX" sh ShellScripts/01_UPDATE/01_CALL_UPDATE.sh";
			ExecCmd(Menuet_Sub01_CMD02);
			DeadCnt++;
		} else {
			break;
		}
	}
	return Menuet_Sub01_CMD01_RetCode;
}

# ------------------------------------------------------------------------------------------------------------------------

function Menuet_Sub02(){
	Menuet_Sub02_CMD01 = CALL_BUSYBOX" sh ShellScripts/03_DETECTOR/04_Menuet/02_CALL_DETECTOR_Menuet_02.sh";
	ExecCmd(Menuet_Sub02_CMD01);
}

# ------------------------------------------------------------------------------------------------------------------------

function Menuet_Sub03(){
	Menuet_Sub03_CMD01 = CALL_BUSYBOX" sh ShellScripts/03_DETECTOR/04_Menuet/03_CALL_DETECTOR_Menuet_03.sh";
	Menuet_Sub03_CMD01_RetCode = RetExecCmd(Menuet_Sub03_CMD01);
	if(Menuet_Sub03_CMD01_RetCode == 1){
		# CAUTION区分でWARNINGと共通部分コンポーネント以外のコンポーネントが存在しない場合
		Menuet_Sub04();
		return 1;
	}
	return 1;
}

# ------------------------------------------------------------------------------------------------------------------------

function Menuet_Sub04(){
	Menuet_Sub04_CMD01 = CALL_BUSYBOX" sh ShellScripts/03_DETECTOR/04_Menuet/04_CALL_DETECTOR_Menuet_04.sh";
	ExecCmd(Menuet_Sub04_CMD01);
}

# ------------------------------------------------------------------------------------------------------------------------

