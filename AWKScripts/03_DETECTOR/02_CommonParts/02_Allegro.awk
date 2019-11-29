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
	Allegro_Sub01();
}

# ------------------------------------------------------------------------------------------------------------------------

function Allegro_Sub01(){
	MD(DIR_EXPLORER_DEFINE);
	Allegro_Sub03();
	# ExplorerDefineから拡張子が.txt、.dat、.log、.def、.conf、.csv、.tsvのファイルリストを抽出する。
	# nkfの-g（--guess）オプションでShift_JISかUTF-8のみ抽出する。
	# asciiはマルチバイト文字検索を行う前提からしておかしいので、抽出対象には入らない。
	Allegro_Sub02();
	MDRM(WorksDir_02);
	Allegro_Sub04();
	Allegro_Sub06();
	Allegro_Sub18();
	Allegro_Sub19();
	Allegro_Sub20();
}

# ------------------------------------------------------------------------------------------------------------------------

function Allegro_Sub02(){
	Allegro_Sub02_CMD02 = CALL_BUSYBOX_GLOB" ls "DIR_EXPLORER_DEFINE"/*.txt > "OUT_DEVNULL;
	Allegro_Sub02_CMD03 = CALL_BUSYBOX_GLOB" ls "DIR_EXPLORER_DEFINE"/*.dat > "OUT_DEVNULL;
	Allegro_Sub02_CMD04 = CALL_BUSYBOX_GLOB" ls "DIR_EXPLORER_DEFINE"/*.log > "OUT_DEVNULL;
	Allegro_Sub02_CMD05 = CALL_BUSYBOX_GLOB" ls "DIR_EXPLORER_DEFINE"/*.def > "OUT_DEVNULL;
	Allegro_Sub02_CMD06 = CALL_BUSYBOX_GLOB" ls "DIR_EXPLORER_DEFINE"/*.conf > "OUT_DEVNULL;
	Allegro_Sub02_CMD07 = CALL_BUSYBOX_GLOB" ls "DIR_EXPLORER_DEFINE"/*.csv > "OUT_DEVNULL;
	Allegro_Sub02_CMD08 = CALL_BUSYBOX_GLOB" ls "DIR_EXPLORER_DEFINE"/*.tsv > "OUT_DEVNULL;
	Allegro_Sub02_CMD02_RetCode = RetExecCmd(Allegro_Sub02_CMD02);
	Allegro_Sub02_CMD03_RetCode = RetExecCmd(Allegro_Sub02_CMD03);
	Allegro_Sub02_CMD04_RetCode = RetExecCmd(Allegro_Sub02_CMD04);
	Allegro_Sub02_CMD05_RetCode = RetExecCmd(Allegro_Sub02_CMD05);
	Allegro_Sub02_CMD06_RetCode = RetExecCmd(Allegro_Sub02_CMD06);
	Allegro_Sub02_CMD07_RetCode = RetExecCmd(Allegro_Sub02_CMD07);
	Allegro_Sub02_CMD08_RetCode = RetExecCmd(Allegro_Sub02_CMD08);
	if(Allegro_Sub02_CMD02_RetCode == 1 && 
	Allegro_Sub02_CMD03_RetCode == 1 && 
	Allegro_Sub02_CMD04_RetCode == 1 && 
	Allegro_Sub02_CMD05_RetCode == 1 && 
	Allegro_Sub02_CMD06_RetCode == 1 && 
	Allegro_Sub02_CMD07_RetCode == 1 && 
	Allegro_Sub02_CMD08_RetCode == 1){
		print "ExplorerDefine配下に拡張子が「txt」、「dat」、「log」、「def」、「conf」、" > "con";
		print "「csv」、「tsv」のいずれかのファイルが存在しません。" > "con";
		print "ExplorerDefine配下に前述の拡張子のファイルを配置してから、再度起動してください。" > "con";
		close("con");
		exit 99;
	}
}

# ------------------------------------------------------------------------------------------------------------------------

function Allegro_Sub03(){
	Allegro_Sub03_CMD01 = CALL_BUSYBOX_GLOB" ls "DIR_EXPLORER_DEFINE"/*.* > "OUT_DEVNULL;
	Allegro_Sub03_CMD01_RetCode = RetExecCmd(Allegro_Sub03_CMD01);
	if(Allegro_Sub03_CMD01_RetCode == 1){
		print "ExplorerDefine配下に拡張子が「txt」、「dat」、「log」、「def」、「conf」、" > "con";
		print "「csv」、「tsv」のいずれかのファイルが存在しません。" > "con";
		print "ExplorerDefine配下に前述の拡張子のファイルを配置してから、再度起動してください。" > "con";
		close("con");
		exit 99;
	}
}

# ------------------------------------------------------------------------------------------------------------------------

function Allegro_Sub04(){
	# 拡張子が「txt」の存在判定が正の場合
	if(Allegro_Sub02_CMD02_RetCode == 0){
		Allegro_Sub05("txt");
	}
	# 拡張子が「dat」の存在判定が正の場合
	if(Allegro_Sub02_CMD03_RetCode == 0){
		Allegro_Sub05("dat");
	}
	# 拡張子が「log」の存在判定が正の場合
	if(Allegro_Sub02_CMD04_RetCode == 0){
		Allegro_Sub05("log");
	}
	# 拡張子が「def」の存在判定が正の場合
	if(Allegro_Sub02_CMD05_RetCode == 0){
		Allegro_Sub05("def");
	}
	# 拡張子が「conf」の存在判定が正の場合
	if(Allegro_Sub02_CMD06_RetCode == 0){
		Allegro_Sub05("conf");
	}
	# 拡張子が「csv」の存在判定が正の場合
	if(Allegro_Sub02_CMD07_RetCode == 0){
		Allegro_Sub05("csv");
	}
	# 拡張子が「tsv」の存在判定が正の場合
	if(Allegro_Sub02_CMD08_RetCode == 0){
		Allegro_Sub05("tsv");
	}
}

# ------------------------------------------------------------------------------------------------------------------------

function Allegro_Sub05(Allegro_Sub05_FileExt,Allegro_Sub05_CMD02){
	switch(Allegro_Sub05_FileExt){
		case "txt":
			Allegro_Sub05_TXT_UTF8ArraysCnt = 1;
			Allegro_Sub05_TXT_SJISArraysCnt = 1;
			Allegro_Sub05_CMD01 = CALL_BUSYBOX_GLOB" ls "DIR_EXPLORER_DEFINE"/*.txt";
			break;
		case "dat":
			Allegro_Sub05_DAT_UTF8ArraysCnt = 1;
			Allegro_Sub05_DAT_SJISArraysCnt = 1;
			Allegro_Sub05_CMD01 = CALL_BUSYBOX_GLOB" ls "DIR_EXPLORER_DEFINE"/*.dat";
			break;
		case "log":
			Allegro_Sub05_LOG_UTF8ArraysCnt = 1;
			Allegro_Sub05_LOG_SJISArraysCnt = 1;
			Allegro_Sub05_CMD01 = CALL_BUSYBOX_GLOB" ls "DIR_EXPLORER_DEFINE"/*.log";
			break;
		case "def":
			Allegro_Sub05_DEF_UTF8ArraysCnt = 1;
			Allegro_Sub05_DEF_SJISArraysCnt = 1;
			Allegro_Sub05_CMD01 = CALL_BUSYBOX_GLOB" ls "DIR_EXPLORER_DEFINE"/*.def";
			break;
		case "conf":
			Allegro_Sub05_CONF_UTF8ArraysCnt = 1;
			Allegro_Sub05_CONF_SJISArraysCnt = 1;
			Allegro_Sub05_CMD01 = CALL_BUSYBOX_GLOB" ls "DIR_EXPLORER_DEFINE"/*.conf";
			break;
		case "csv":
			Allegro_Sub05_CSV_UTF8ArraysCnt = 1;
			Allegro_Sub05_CSV_SJISArraysCnt = 1;
			Allegro_Sub05_CMD01 = CALL_BUSYBOX_GLOB" ls "DIR_EXPLORER_DEFINE"/*.csv";
			break;
		case "tsv":
			Allegro_Sub05_TSV_UTF8ArraysCnt = 1;
			Allegro_Sub05_TSV_SJISArraysCnt = 1;
			Allegro_Sub05_CMD01 = CALL_BUSYBOX_GLOB" ls "DIR_EXPLORER_DEFINE"/*.tsv";
			break;
		default:
			exit 99;
	}

	while(Allegro_Sub05_CMD01 | getline Allegro_Sub05_CMD01_RetText){
		Allegro_Sub05_CMD02 = "";
		# Windows版32Bitバイナリに限らず、-gだと改行コードを含まずに文字コードが返送され、
		# --guessだと改行コードを含み文字コードが返送される実装がある。
		# nkfでファイルの文字コードを確認する - It's raining cats and dogs.
		# http://tadasy.hateblo.jp/entry/2014/01/15/132522
		Allegro_Sub05_CMD02 = CALL_NKF32" --guess \""Allegro_Sub05_CMD01_RetText"\"";
		Allegro_Sub05_CMD02_RetText = RetTextExecCmd(Allegro_Sub05_CMD02);
		# ASCIIは、英数字のみとなることから、マルチバイト文字を含まない検索対象文字列しかないファイルは許容しない。
		# 文字コードがJISのファイルは許容しない。個人的には必要とは考えていない。ユーザーはふつうANSIかUTF-8でファイルを作るだろう。
		# 改行コードがCRのファイルは許容しない。Mac OS X以前の機種を考えるなら許容すべきだが、個人的には必要とは考えていない。
		if(Allegro_Sub05_CMD02_RetText == "UTF-8 (CRLF)" || 
		Allegro_Sub05_CMD02_RetText == "UTF-8 (LF)"){
			switch(Allegro_Sub05_FileExt){
				case "txt":
					Allegro_Sub05_TXT_UTF8Arrays[Allegro_Sub05_TXT_UTF8ArraysCnt] = Allegro_Sub05_CMD01_RetText;
					Allegro_Sub05_TXT_UTF8ArraysCnt++;
					break;
				case "dat":
					Allegro_Sub05_DAT_UTF8Arrays[Allegro_Sub05_TXT_UTF8ArraysCnt] = Allegro_Sub05_CMD01_RetText;
					Allegro_Sub05_DAT_UTF8ArraysCnt++;
					break;
				case "log":
					Allegro_Sub05_LOG_UTF8Arrays[Allegro_Sub05_TXT_UTF8ArraysCnt] = Allegro_Sub05_CMD01_RetText;
					Allegro_Sub05_LOG_UTF8ArraysCnt++;
					break;
				case "def":
					Allegro_Sub05_DEF_UTF8Arrays[Allegro_Sub05_TXT_UTF8ArraysCnt] = Allegro_Sub05_CMD01_RetText;
					Allegro_Sub05_DEF_UTF8ArraysCnt++;
					break;
				case "conf":
					Allegro_Sub05_CONF_UTF8Arrays[Allegro_Sub05_TXT_UTF8ArraysCnt] = Allegro_Sub05_CMD01_RetText;
					Allegro_Sub05_CONF_UTF8ArraysCnt++;
					break;
				case "csv":
					Allegro_Sub05_CSV_UTF8Arrays[Allegro_Sub05_TXT_UTF8ArraysCnt] = Allegro_Sub05_CMD01_RetText;
					Allegro_Sub05_CSV_UTF8ArraysCnt++;
					break;
				case "tsv":
					Allegro_Sub05_TSV_UTF8Arrays[Allegro_Sub05_TXT_UTF8ArraysCnt] = Allegro_Sub05_CMD01_RetText;
					Allegro_Sub05_TSV_UTF8ArraysCnt++;
					break;
				default:
					exit 99;
			}
		} else if(Allegro_Sub05_CMD02_RetText == "Shift_JIS (CRLF)" || 
		Allegro_Sub05_CMD02_RetText == "Shift_JIS (LF)"){
			switch(Allegro_Sub05_FileExt){
				case "txt":
					Allegro_Sub05_TXT_SJISArrays[Allegro_Sub05_TXT_SJISArraysCnt] = Allegro_Sub05_CMD01_RetText;
					Allegro_Sub05_TXT_SJISArraysCnt++;
					break;
				case "dat":
					Allegro_Sub05_DAT_SJISArrays[Allegro_Sub05_TXT_SJISArraysCnt] = Allegro_Sub05_CMD01_RetText;
					Allegro_Sub05_DAT_SJISArraysCnt++;
					break;
				case "log":
					Allegro_Sub05_LOG_SJISArrays[Allegro_Sub05_TXT_SJISArraysCnt] = Allegro_Sub05_CMD01_RetText;
					Allegro_Sub05_LOG_SJISArraysCnt++;
					break;
				case "def":
					Allegro_Sub05_DEF_SJISArrays[Allegro_Sub05_TXT_SJISArraysCnt] = Allegro_Sub05_CMD01_RetText;
					Allegro_Sub05_DEF_SJISArraysCnt++;
					break;
				case "conf":
					Allegro_Sub05_CONF_SJISArrays[Allegro_Sub05_TXT_SJISArraysCnt] = Allegro_Sub05_CMD01_RetText;
					Allegro_Sub05_CONF_SJISArraysCnt++;
					break;
				case "csv":
					Allegro_Sub05_CSV_SJISArrays[Allegro_Sub05_TXT_SJISArraysCnt] = Allegro_Sub05_CMD01_RetText;
					Allegro_Sub05_CSV_SJISArraysCnt++;
					break;
				case "tsv":
					Allegro_Sub05_TSV_SJISArrays[Allegro_Sub05_TXT_SJISArraysCnt] = Allegro_Sub05_CMD01_RetText;
					Allegro_Sub05_TSV_SJISArraysCnt++;
					break;
				default:
					exit 99;
			}
		}
	}
	close(Allegro_Sub05_CMD01);
}

# ------------------------------------------------------------------------------------------------------------------------

function Allegro_Sub06(){
	# 中間ファイル初期化
	Allegro_Sub07();
	## 拡張子がtxtに対する処理
	Allegro_Sub07_BitField_TXT = Allegro_Sub08();
	# 拡張子がdatに対する処理
	Allegro_Sub07_BitField_DAT = Allegro_Sub09();
	# 拡張子がlogに対する処理
	Allegro_Sub07_BitField_LOG = Allegro_Sub10();
	# 拡張子がdefに対する処理
	Allegro_Sub07_BitField_DEF = Allegro_Sub11();
	# 拡張子がconfに対する処理
	Allegro_Sub07_BitField_CONF = Allegro_Sub12();
	# 拡張子がcsvに対する処理
	Allegro_Sub07_BitField_CSV = Allegro_Sub13();
	# 拡張子がtsvに対する処理
	Allegro_Sub07_BitField_TSV = Allegro_Sub14();
	# すべての拡張子のファイルが空ファイルだった場合
	if(Allegro_Sub07_BitField_TXT == 0 && 
	Allegro_Sub07_BitField_DAT == 0 && 
	Allegro_Sub07_BitField_LOG == 0 && 
	Allegro_Sub07_BitField_DEF == 0 && 
	Allegro_Sub07_BitField_CONF == 0 && 
	Allegro_Sub07_BitField_CSV == 0 && 
	Allegro_Sub07_BitField_TSV == 0){
		print "ExplorerDefine配下に拡張子が「txt」、「dat」、「log」、「def」、「conf」、" > "con";
		print "「csv」、「tsv」のいずれかのファイルも空ファイルです。" > "con";
		print "ExplorerDefine配下に前述の拡張子のファイルに免許番号を記載してから、再度起動してください。" > "con";
		close("con");
		exit 99;
	}
}

# ------------------------------------------------------------------------------------------------------------------------

function Allegro_Sub07(Allegro_Sub07_CMD01){
	Allegro_Sub07_CMD01 = CALL_BUSYBOX" sh ShellScripts/07_CALL_DETECTOR_Allegro_01.sh";
	ExecCmd(Allegro_Sub07_CMD01);
	Allegro_Sub07_BitField_TXT = 0;
	Allegro_Sub07_BitField_DAT = 0;
	Allegro_Sub07_BitField_LOG = 0;
	Allegro_Sub07_BitField_DEF = 0;
	Allegro_Sub07_BitField_CONF = 0;
	Allegro_Sub07_BitField_CSV = 0;
	Allegro_Sub07_BitField_TSV = 0;
}

# ------------------------------------------------------------------------------------------------------------------------

