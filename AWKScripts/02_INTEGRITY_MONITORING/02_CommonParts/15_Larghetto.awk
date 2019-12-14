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
	# AcquiredHTML_SJIS、AcquiredHTML_EDIT、AcquiredXLSX、DefineCSV配下のファイルを削除する。
	Larghetto_Sub01();
	# ハッシュ表との整合性チェック
	Larghetto_Sub03();
}

# ------------------------------------------------------------------------------------------------------------------------

function Larghetto_Sub01(){
	# ハッシュ表のファイル名から日付を取得し、配列に格納する。
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
		# ファイル毎の生成日を取得する。
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
	# DefineCSV配下の各ハッシュ表の各行の先頭にハッシュ表のファイル名を挿入し、配列に格納する。
	Larghetto_Sub07();
	# DefineCSV配下の各ハッシュ表の各ファイル名とビット値を配列に格納する。
	Larghetto_Sub08();
	# DefineCSV配下のCSVに対する検証を行う。
	Larghetto_Sub09(CheckFile_CSV);
	# AcquiredXLSX配下のXLSXに対する検証を行う。
	Larghetto_Sub09(CheckFile_XLSX);
	# EditedHTML配下のHTMLに対する検証を行う。
	Larghetto_Sub09(CheckFile_EDIT);
	# AcquiredHTML_ShiftJIS配下のHTMLに対する検証を行う。
	Larghetto_Sub09(CheckFile_SJIS);
	# AcquiredHTML_UTF8配下のHTMLに対する検証を行う。
	Larghetto_Sub09(CheckFile_UTF8);
	# ハッシュ表の抹消ビット(CSV)とハッシュ表の抹消ビット(XLSX)が双方共に反転している場合、
	# ハッシュ表の抹消ビット(EDITHTML)、ハッシュ表の抹消ビット(SJISHTML)、
	# ハッシュ表の抹消ビット(UTF8HTML)を反転させる。
	Larghetto_Sub10();
	# この時点で、ハッシュ表の抹消ビットが1のファイルを削除する。
	Larghetto_Sub05();
	# ハッシュ表の抹消ビット(CSV)が未反転であり、かつハッシュ表の抹消ビット(XLSX)が反転している場合、
	# 当該XLSXから当該CSVを復元し、ハッシュ表の抹消ビット(CSV)を未反転状態に戻す。
	Larghetto_Sub11();
	# ハッシュ表を全削除し、ハッシュ表の抹消ビットが未反転のものに限りハッシュ表に出力する。
	Larghetto_Sub12();
	delete Larghetto_Sub03_CMD01Arrays;
	delete Larghetto_Sub03_CMD02Arrays;
}

# ------------------------------------------------------------------------------------------------------------------------

function Larghetto_Sub04(Larghetto_Sub04_CheckFile,Larghetto_Sub04_CMD01,Larghetto_Sub04_CMD01_RetVal){
	for(i in Larghetto_Sub03_CMD02Arrays){
		Larghetto_Sub04_CMD01 = "";
		Larghetto_Sub04_CMD01_RetVal = "";
		Larghetto_Sub04_CMD01 = CALL_BUSYBOX" egrep -q -e \"^^"Larghetto_Sub04_CheckFile"\" "Larghetto_Sub03_CMD02Arrays[i][1];
		Larghetto_Sub04_CMD01_RetVal = RetExecCmd(Larghetto_Sub04_CMD01);
		if(Larghetto_Sub04_CMD01_RetVal == 1){
			if(Larghetto_Sub04_CheckFile == CheckFile_CSV){
				Larghetto_Sub03_CMD02Arrays[i][2] = 1;
			} else if(Larghetto_Sub04_CheckFile == CheckFile_XLSX){
				Larghetto_Sub03_CMD02Arrays[i][3] = 1;
			} else if(Larghetto_Sub04_CheckFile == CheckFile_EDIT){
				Larghetto_Sub03_CMD02Arrays[i][4] = 1;
			} else if(Larghetto_Sub04_CheckFile == CheckFile_SJIS){
				Larghetto_Sub03_CMD02Arrays[i][5] = 1;
			} else if(Larghetto_Sub04_CheckFile == CheckFile_UTF8){
				Larghetto_Sub03_CMD02Arrays[i][6] = 1;
			}
		}
	}
}

# ------------------------------------------------------------------------------------------------------------------------

function Larghetto_Sub05(Larghetto_Sub05_RM_YYYYMMDD,Larghetto_Sub05_RM_Target,Larghetto_Sub05_CMD01){
	for(i in Larghetto_Sub03_CMD02Arrays){
		if(Larghetto_Sub03_CMD02Arrays[i][2] == 1 || Larghetto_Sub03_CMD02Arrays[i][3] == 1 || Larghetto_Sub03_CMD02Arrays[i][4] == 1 || Larghetto_Sub03_CMD02Arrays[i][5] == 1 || Larghetto_Sub03_CMD02Arrays[i][6] == 1){
			Larghetto_Sub05_RM_YYYYMMDD = "";
			Larghetto_Sub05_RM_YYYYMMDD = substr(Larghetto_Sub03_CMD02Arrays[i][1],19,8);
			if(Larghetto_Sub03_CMD02Arrays[i][2] == 1){
				Larghetto_Sub05_RM_Target = "";
				Larghetto_Sub05_CMD01 = "";
				Larghetto_Sub05_RM_Target = CheckFile_CSV Larghetto_Sub05_RM_YYYYMMDD"*.*";
				Larghetto_Sub05_CMD01 = CALL_BUSYBOX_GLOB" rm \""Larghetto_Sub05_RM_Target"\" > "OUT_DEVNULL;
				ExecCmd(Larghetto_Sub05_CMD01);
			}
			if(Larghetto_Sub03_CMD02Arrays[i][3] == 1){
				Larghetto_Sub05_RM_Target = "";
				Larghetto_Sub05_CMD01 = "";
				Larghetto_Sub05_RM_Target = CheckFile_XLSX Larghetto_Sub05_RM_YYYYMMDD"*.*";
				Larghetto_Sub05_CMD01 = CALL_BUSYBOX_GLOB" rm \""Larghetto_Sub05_RM_Target"\" > "OUT_DEVNULL;
				ExecCmd(Larghetto_Sub05_CMD01);
			}
			if(Larghetto_Sub03_CMD02Arrays[i][4] == 1){
				Larghetto_Sub05_RM_Target = "";
				Larghetto_Sub05_CMD01 = "";
				Larghetto_Sub05_RM_Target = CheckFile_EDIT Larghetto_Sub05_RM_YYYYMMDD"*.*";
				Larghetto_Sub05_CMD01 = CALL_BUSYBOX_GLOB" rm \""Larghetto_Sub05_RM_Target"\" > "OUT_DEVNULL;
				ExecCmd(Larghetto_Sub05_CMD01);
			}
			if(Larghetto_Sub03_CMD02Arrays[i][5] == 1){
				Larghetto_Sub05_RM_Target = "";
				Larghetto_Sub05_CMD01 = "";
				Larghetto_Sub05_RM_Target = CheckFile_SJIS Larghetto_Sub05_RM_YYYYMMDD"*.*";
				Larghetto_Sub05_CMD01 = CALL_BUSYBOX_GLOB" rm \""Larghetto_Sub05_RM_Target"\" > "OUT_DEVNULL;
				ExecCmd(Larghetto_Sub05_CMD01);
			}
			if(Larghetto_Sub03_CMD02Arrays[i][6] == 1){
				Larghetto_Sub05_RM_Target = "";
				Larghetto_Sub05_CMD01 = "";
				Larghetto_Sub05_RM_Target = CheckFile_UTF8 Larghetto_Sub05_RM_YYYYMMDD"*.*";
				Larghetto_Sub05_CMD01 = CALL_BUSYBOX_GLOB" rm \""Larghetto_Sub05_RM_Target"\" > "OUT_DEVNULL;
				ExecCmd(Larghetto_Sub05_CMD01);
			}
		}
	}
}

# ------------------------------------------------------------------------------------------------------------------------

function Larghetto_Sub06(Larghetto_Sub06_CheckFile,Larghetto_Sub06_CMD01,Larghetto_Sub06_CMD01_RetText,Larghetto_Sub06_CMD02,Larghetto_Sub06_CMD02_RetVal,Larghetto_Sub06_HashValue){
	for(i in Larghetto_Sub03_CMD02Arrays){
		if(Larghetto_Sub06_CheckFile == CheckFile_CSV){
			if(Larghetto_Sub03_CMD02Arrays[i][2] == 0){
				Larghetto_Sub06_CMD01 = "";
				Larghetto_Sub06_CMD01_RetText = "";
				Larghetto_Sub06_CMD02 = "";
				Larghetto_Sub06_CMD02_RetVal = "";
				Larghetto_Sub06_HashValue = "";
				Larghetto_Sub06_CMD01 = CALL_BUSYBOX" egrep -e \"^^"Larghetto_Sub06_CheckFile"\" "Larghetto_Sub03_CMD02Arrays[i][1];
				# ハッシュ表から当該行を取得
				Larghetto_Sub06_CMD01_RetText = RetTextExecCmd(Larghetto_Sub06_CMD01);
				split(Larghetto_Sub06_CMD01_RetText,Larghetto_Sub06_CMD01_RetTextArrays,",");
				# 1カラム目で存在チェック
				Larghetto_Sub06_CMD02 = CALL_BUSYBOX" ls "Larghetto_Sub06_CMD01_RetTextArrays[1]" > "OUT_DEVNULL;
				Larghetto_Sub06_CMD02_RetVal = RetExecCmd(Larghetto_Sub06_CMD02);
				if(Larghetto_Sub06_CMD02_RetVal == 1){
					Larghetto_Sub03_CMD02Arrays[i][2] = 1;
				}
				delete Larghetto_Sub06_CMD01_RetTextArrays;
			}
		} else if(Larghetto_Sub06_CheckFile == CheckFile_XLSX){
			if(Larghetto_Sub03_CMD02Arrays[i][3] == 0){
				Larghetto_Sub06_CMD01 = "";
				Larghetto_Sub06_CMD01_RetText = "";
				Larghetto_Sub06_CMD02 = "";
				Larghetto_Sub06_CMD02_RetVal = "";
				Larghetto_Sub06_HashValue = "";
				Larghetto_Sub06_CMD01 = CALL_BUSYBOX" egrep -e \"^^"Larghetto_Sub06_CheckFile"\" "Larghetto_Sub03_CMD02Arrays[i][1];
				# ハッシュ表から当該行を取得
				Larghetto_Sub06_CMD01_RetText = RetTextExecCmd(Larghetto_Sub06_CMD01);
				split(Larghetto_Sub06_CMD01_RetText,Larghetto_Sub06_CMD01_RetTextArrays,",");
				# 1カラム目で存在チェック
				Larghetto_Sub06_CMD02 = CALL_BUSYBOX" ls "Larghetto_Sub06_CMD01_RetTextArrays[1]" > "OUT_DEVNULL;
				Larghetto_Sub06_CMD02_RetVal = RetExecCmd(Larghetto_Sub06_CMD02);
				if(Larghetto_Sub06_CMD02_RetVal == 1){
					Larghetto_Sub03_CMD02Arrays[i][3] = 1;
				}
				delete Larghetto_Sub06_CMD01_RetTextArrays;
			}
		} else if(Larghetto_Sub06_CheckFile == CheckFile_EDIT){
			if(Larghetto_Sub03_CMD02Arrays[i][4] == 0){
				Larghetto_Sub06_CMD01 = "";
				Larghetto_Sub06_CMD01_RetText = "";
				Larghetto_Sub06_CMD02 = "";
				Larghetto_Sub06_CMD02_RetVal = "";
				Larghetto_Sub06_HashValue = "";
				Larghetto_Sub06_CMD01 = CALL_BUSYBOX" egrep -e \"^^"Larghetto_Sub06_CheckFile"\" "Larghetto_Sub03_CMD02Arrays[i][1];
				# ハッシュ表から当該行を取得
				Larghetto_Sub06_CMD01_RetText = RetTextExecCmd(Larghetto_Sub06_CMD01);
				split(Larghetto_Sub06_CMD01_RetText,Larghetto_Sub06_CMD01_RetTextArrays,",");
				# 1カラム目で存在チェック
				Larghetto_Sub06_CMD02 = CALL_BUSYBOX" ls "Larghetto_Sub06_CMD01_RetTextArrays[1]" > "OUT_DEVNULL;
				Larghetto_Sub06_CMD02_RetVal = RetExecCmd(Larghetto_Sub06_CMD02);
				if(Larghetto_Sub06_CMD02_RetVal == 1){
					Larghetto_Sub03_CMD02Arrays[i][4] = 1;
				}
				delete Larghetto_Sub06_CMD01_RetTextArrays;
			}
		} else if(Larghetto_Sub06_CheckFile == CheckFile_SJIS){
			if(Larghetto_Sub03_CMD02Arrays[i][5] == 0){
				Larghetto_Sub06_CMD01 = "";
				Larghetto_Sub06_CMD01_RetText = "";
				Larghetto_Sub06_CMD02 = "";
				Larghetto_Sub06_CMD02_RetVal = "";
				Larghetto_Sub06_HashValue = "";
				Larghetto_Sub06_CMD01 = CALL_BUSYBOX" egrep -e \"^^"Larghetto_Sub06_CheckFile"\" "Larghetto_Sub03_CMD02Arrays[i][1];
				# ハッシュ表から当該行を取得
				Larghetto_Sub06_CMD01_RetText = RetTextExecCmd(Larghetto_Sub06_CMD01);
				split(Larghetto_Sub06_CMD01_RetText,Larghetto_Sub06_CMD01_RetTextArrays,",");
				# 1カラム目で存在チェック
				Larghetto_Sub06_CMD02 = CALL_BUSYBOX" ls "Larghetto_Sub06_CMD01_RetTextArrays[1]" > "OUT_DEVNULL;
				Larghetto_Sub06_CMD02_RetVal = RetExecCmd(Larghetto_Sub06_CMD02);
				if(Larghetto_Sub06_CMD02_RetVal == 1){
					Larghetto_Sub03_CMD02Arrays[i][5] = 1;
				}
				delete Larghetto_Sub06_CMD01_RetTextArrays;
			}
		} else if(Larghetto_Sub06_CheckFile == CheckFile_UTF8){
			if(Larghetto_Sub03_CMD02Arrays[i][6] == 0){
				Larghetto_Sub06_CMD01 = "";
				Larghetto_Sub06_CMD01_RetText = "";
				Larghetto_Sub06_CMD02 = "";
				Larghetto_Sub06_CMD02_RetVal = "";
				Larghetto_Sub06_HashValue = "";
				Larghetto_Sub06_CMD01 = CALL_BUSYBOX" egrep -e \"^^"Larghetto_Sub06_CheckFile"\" "Larghetto_Sub03_CMD02Arrays[i][1];
				# ハッシュ表から当該行を取得
				Larghetto_Sub06_CMD01_RetText = RetTextExecCmd(Larghetto_Sub06_CMD01);
				split(Larghetto_Sub06_CMD01_RetText,Larghetto_Sub06_CMD01_RetTextArrays,",");
				# 1カラム目で存在チェック
				Larghetto_Sub06_CMD02 = CALL_BUSYBOX" ls "Larghetto_Sub06_CMD01_RetTextArrays[1]" > "OUT_DEVNULL;
				Larghetto_Sub06_CMD02_RetVal = RetExecCmd(Larghetto_Sub06_CMD02);
				if(Larghetto_Sub06_CMD02_RetVal == 1){
					Larghetto_Sub03_CMD02Arrays[i][6] = 1;
				}
				delete Larghetto_Sub06_CMD01_RetTextArrays;
			}
		}
	}
}

# ------------------------------------------------------------------------------------------------------------------------

function Larghetto_Sub07(){
	Larghetto_Sub03_CMD01 = CALL_GAWK" -f AWKScripts/02_INTEGRITY_MONITORING/03_SubSystem/01_Larghetto_SubSystem_01.awk HashConf/HashInfo_2*.def";
	Larghetto_Sub03_CMD01_Cnt = 1;
	while(Larghetto_Sub03_CMD01 | getline Larghetto_Sub03_CMD01_RetLine){
		Larghetto_Sub03_CMD01Arrays[Larghetto_Sub03_CMD01_Cnt] = Larghetto_Sub03_CMD01_RetLine;
		Larghetto_Sub03_CMD01_Cnt++;
	}
	close(Larghetto_Sub03_CMD01);
}

# ------------------------------------------------------------------------------------------------------------------------

function Larghetto_Sub08(){
	Larghetto_Sub03_CMD02 = CALL_GAWK" -f AWKScripts/02_INTEGRITY_MONITORING/03_SubSystem/02_Larghetto_SubSystem_02.awk HashConf/HashInfo_2*.def";
	Larghetto_Sub03_CMD02_Cnt = 1;
	while(Larghetto_Sub03_CMD02 | getline Larghetto_Sub03_CMD02_RetLine){
		# ハッシュ表の行
		Larghetto_Sub03_CMD02Arrays[Larghetto_Sub03_CMD02_Cnt][1] = Larghetto_Sub03_CMD02_RetLine;
		# ハッシュ表の抹消ビット(CSV)
		Larghetto_Sub03_CMD02Arrays[Larghetto_Sub03_CMD02_Cnt][2] = 0;
		# ハッシュ表の抹消ビット(XLSX)
		Larghetto_Sub03_CMD02Arrays[Larghetto_Sub03_CMD02_Cnt][3] = 0;
		# ハッシュ表の抹消ビット(EDITHTML)
		Larghetto_Sub03_CMD02Arrays[Larghetto_Sub03_CMD02_Cnt][4] = 0;
		# ハッシュ表の抹消ビット(SJISHTML)
		Larghetto_Sub03_CMD02Arrays[Larghetto_Sub03_CMD02_Cnt][5] = 0;
		# ハッシュ表の抹消ビット(UTF8HTML)
		Larghetto_Sub03_CMD02Arrays[Larghetto_Sub03_CMD02_Cnt][6] = 0;
		Larghetto_Sub03_CMD02_Cnt++;
	}
	close(Larghetto_Sub03_CMD02);
}

# ------------------------------------------------------------------------------------------------------------------------

function Larghetto_Sub09(Larghetto_Sub09_CheckFile){
	Larghetto_Sub04(Larghetto_Sub09_CheckFile);
	# ハッシュ表の抹消ビットが未反転のファイルに対し、存在チェックとハッシュ値チェックを行う。
	Larghetto_Sub06(Larghetto_Sub09_CheckFile);
}

# ------------------------------------------------------------------------------------------------------------------------

function Larghetto_Sub10(){
	for(i in Larghetto_Sub03_CMD02Arrays){
		if(Larghetto_Sub03_CMD02Arrays[i][2] == 1 && Larghetto_Sub03_CMD02Arrays[i][3] == 1){
			Larghetto_Sub03_CMD02Arrays[i][4] = 1;
			Larghetto_Sub03_CMD02Arrays[i][5] = 1;
			Larghetto_Sub03_CMD02Arrays[i][6] = 1;
		}
	}
}

# ------------------------------------------------------------------------------------------------------------------------

function Larghetto_Sub11(){
	Larghetto_Sub11_Cnt = 1;
	for(i in Larghetto_Sub03_CMD02Arrays){
		if(Larghetto_Sub03_CMD02Arrays[i][2] == 1 && Larghetto_Sub03_CMD02Arrays[i][3] == 0){
			# 変換元XLSXファイル名を取得
			Larghetto_Sub11_CMD01 = CALL_BUSYBOX" egrep -e \"^^"CheckFile_XLSX"\" "Larghetto_Sub03_CMD02Arrays[i][1];
			# ハッシュ表から当該行を取得
			Larghetto_Sub11_CMD01_RetText = RetTextExecCmd(Larghetto_Sub11_CMD01);
			split(Larghetto_Sub11_CMD01_RetText,Larghetto_Sub11_CMD01_RetTextArrays,",");
			Larghetto_Sub11_XLSXName = Larghetto_Sub11_CMD01_RetTextArrays[1];
			delete Larghetto_Sub11_CMD01_RetTextArrays;
			# 変換元CSVファイル名を取得
			Larghetto_Sub11_CMD02 = CALL_BUSYBOX" egrep -e \"^^"CheckFile_CSV"\" "Larghetto_Sub03_CMD02Arrays[i][1];
			# ハッシュ表から当該行を取得
			Larghetto_Sub11_CMD02_RetText = RetTextExecCmd(Larghetto_Sub11_CMD02);
			split(Larghetto_Sub11_CMD02_RetText,Larghetto_Sub11_CMD02_RetTextArrays,",");
			Larghetto_Sub11_CSVName = Larghetto_Sub11_CMD02_RetTextArrays[1];
			delete Larghetto_Sub11_CMD02_RetTextArrays;
			Larghetto_Sub11_CMD03 = "";
			Larghetto_Sub11_CMD03 = "LinuxTools/gawk.exe -f AWKScripts/02_INTEGRITY_MONITORING/03_SubSystem/03_Larghetto_SubSystem_03.awk -v XLSXName="Larghetto_Sub11_XLSXName" -v CSVName="Larghetto_Sub11_CSVName" & ";
			Larghetto_Sub11_CMDArrays[Larghetto_Sub11_Cnt] = Larghetto_Sub11_CMD03;
			Larghetto_Sub11_Cnt++;
			Larghetto_Sub03_CMD02Arrays[i][2] = 0;
		}
	}
	delete Larghetto_Sub11_TextArrays;
	if(Larghetto_Sub11_Cnt > 1){
		print "#! /bin/sh" > GENE_EXECSHELL_02;
		print "# "GENE_EXECSHELL_02 > GENE_EXECSHELL_02;
		print "" > GENE_EXECSHELL_02;
		for(i in Larghetto_Sub11_CMDArrays){
			print Larghetto_Sub11_CMDArrays[i] > GENE_EXECSHELL_02;
		}
		delete Larghetto_Sub11_CMDArrays;
		print "wait" > GENE_EXECSHELL_02;
		print "" > GENE_EXECSHELL_02;
		print "exit 0" > GENE_EXECSHELL_02;
		print "" > GENE_EXECSHELL_02;
		close(GENE_EXECSHELL_02);
		ExecCmd(EXEC_SHELL_02);
		ExecCmd(RM_SHELL_02);
	}
}

# ------------------------------------------------------------------------------------------------------------------------

function Larghetto_Sub12(){
	MDRM(DIR_HASHCONF);
	for(i in Larghetto_Sub03_CMD02Arrays){
		if(Larghetto_Sub03_CMD02Arrays[i][2] == 0 || Larghetto_Sub03_CMD02Arrays[i][3] == 0 || Larghetto_Sub03_CMD02Arrays[i][4] == 0 || Larghetto_Sub03_CMD02Arrays[i][5] == 0 || Larghetto_Sub03_CMD02Arrays[i][6] == 0){
			if(Larghetto_Sub03_CMD02Arrays[i][2] == 0){
				Larghetto_Sub13(Larghetto_Sub03_CMD02Arrays[i][1]);
			}
			if(Larghetto_Sub03_CMD02Arrays[i][3] == 0){
				Larghetto_Sub14(Larghetto_Sub03_CMD02Arrays[i][1]);
			}
			if(Larghetto_Sub03_CMD02Arrays[i][4] == 0){
				Larghetto_Sub15(Larghetto_Sub03_CMD02Arrays[i][1]);
			}
			if(Larghetto_Sub03_CMD02Arrays[i][5] == 0){
				Larghetto_Sub16(Larghetto_Sub03_CMD02Arrays[i][1]);
			}
			if(Larghetto_Sub03_CMD02Arrays[i][6] == 0){
				Larghetto_Sub17(Larghetto_Sub03_CMD02Arrays[i][1]);
			}
		}
	}
}

# ------------------------------------------------------------------------------------------------------------------------

function Larghetto_Sub13(Larghetto_Sub13_FileName){
	for(j in Larghetto_Sub03_CMD01Arrays){
		split(Larghetto_Sub03_CMD01Arrays[j],Larghetto_Sub03_CMD01ArraysLineText,",");
		if(Larghetto_Sub03_CMD01ArraysLineText[1] == Larghetto_Sub03_CMD02Arrays[i][1] && substr(Larghetto_Sub03_CMD01ArraysLineText[2],1,84) == CheckFile_UTF8){
			print Larghetto_Sub03_CMD01ArraysLineText[2]","Larghetto_Sub03_CMD01ArraysLineText[3]","Larghetto_Sub03_CMD01ArraysLineText[4]","Larghetto_Sub03_CMD01ArraysLineText[5] > Larghetto_Sub13_FileName;
		}
		delete Larghetto_Sub03_CMD01ArraysLineText;
	}
}

# ------------------------------------------------------------------------------------------------------------------------

function Larghetto_Sub14(Larghetto_Sub14_FileName){
	for(j in Larghetto_Sub03_CMD01Arrays){
		split(Larghetto_Sub03_CMD01Arrays[j],Larghetto_Sub03_CMD01ArraysLineText,",");
		if(Larghetto_Sub03_CMD01ArraysLineText[1] == Larghetto_Sub03_CMD02Arrays[i][1] && substr(Larghetto_Sub03_CMD01ArraysLineText[2],1,88) == CheckFile_SJIS){
			print Larghetto_Sub03_CMD01ArraysLineText[2]","Larghetto_Sub03_CMD01ArraysLineText[3] > Larghetto_Sub14_FileName;
		}
		delete Larghetto_Sub03_CMD01ArraysLineText;
	}
}

# ------------------------------------------------------------------------------------------------------------------------

function Larghetto_Sub15(Larghetto_Sub15_FileName){
	for(j in Larghetto_Sub03_CMD01Arrays){
		split(Larghetto_Sub03_CMD01Arrays[j],Larghetto_Sub03_CMD01ArraysLineText,",");
		if(Larghetto_Sub03_CMD01ArraysLineText[1] == Larghetto_Sub03_CMD02Arrays[i][1] && substr(Larghetto_Sub03_CMD01ArraysLineText[2],1,77) == CheckFile_EDIT){
			print Larghetto_Sub03_CMD01ArraysLineText[2]","Larghetto_Sub03_CMD01ArraysLineText[3] > Larghetto_Sub15_FileName;
		}
		delete Larghetto_Sub03_CMD01ArraysLineText;
	}
}

# ------------------------------------------------------------------------------------------------------------------------

function Larghetto_Sub16(Larghetto_Sub16_FileName){
	for(j in Larghetto_Sub03_CMD01Arrays){
		split(Larghetto_Sub03_CMD01Arrays[j],Larghetto_Sub03_CMD01ArraysLineText,",");
		if(Larghetto_Sub03_CMD01ArraysLineText[1] == Larghetto_Sub03_CMD02Arrays[i][1] && substr(Larghetto_Sub03_CMD01ArraysLineText[2],1,25) == CheckFile_XLSX){
			print Larghetto_Sub03_CMD01ArraysLineText[2]","Larghetto_Sub03_CMD01ArraysLineText[3]","Larghetto_Sub03_CMD01ArraysLineText[4]","Larghetto_Sub03_CMD01ArraysLineText[5] > Larghetto_Sub16_FileName;
		}
		delete Larghetto_Sub03_CMD01ArraysLineText;
	}
}

# ------------------------------------------------------------------------------------------------------------------------

function Larghetto_Sub17(Larghetto_Sub17_FileName){
	for(j in Larghetto_Sub03_CMD01Arrays){
		split(Larghetto_Sub03_CMD01Arrays[j],Larghetto_Sub03_CMD01ArraysLineText,",");
		if(Larghetto_Sub03_CMD01ArraysLineText[1] == Larghetto_Sub03_CMD02Arrays[i][1] && substr(Larghetto_Sub03_CMD01ArraysLineText[2],1,22) == CheckFile_CSV){
			print Larghetto_Sub03_CMD01ArraysLineText[2]","Larghetto_Sub03_CMD01ArraysLineText[3]","Larghetto_Sub03_CMD01ArraysLineText[4]","Larghetto_Sub03_CMD01ArraysLineText[5] > Larghetto_Sub17_FileName;
		}
		delete Larghetto_Sub03_CMD01ArraysLineText;
	}
}

# ------------------------------------------------------------------------------------------------------------------------

