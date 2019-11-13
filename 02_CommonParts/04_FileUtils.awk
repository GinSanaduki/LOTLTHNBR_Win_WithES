#! /usr/bin/gawk
# 04_FileUtils.awk

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

function GetHashValue(GetHashValue_FileName){
	cmd = CALL_BUSYBOX" sha512sum \""GetHashValue_FileName"\"";
	GetHashValue_hash = RetTextExecCmd(cmd);
	return substr(GetHashValue_hash,1,64);
}

# ------------------------------------------------------------------------------------------------------------------------

function GetHashTable(){
	cmd = CALL_BUSYBOX" cat \""FNAME_HASH"\"";
	cnt = 1;
	while(cmd | getline esc){
		HashTable[cnt] = esc;
		cnt++;
	}
	close(cmd);
}

# ------------------------------------------------------------------------------------------------------------------------

function Unzip(UZ_FNAME,UZ_DIRNAME){
	UnzipCMD = CALL_BUSYBOX" unzip -q \""UZ_FNAME"\" -d \""UZ_DIRNAME"\"";
	ExecCmd(UnzipCMD);
}

# ------------------------------------------------------------------------------------------------------------------------

function UMLCleaner(TargetDir){
	deltarget = TargetDir"/_rels";
	RM(deltarget);
	deltarget = TargetDir"/docProps";
	RM(deltarget);
	deltarget = TargetDir"/xl/_rels";
	RM(deltarget);
	deltarget = TargetDir"/xl/printerSettings";
	RM(deltarget);
	deltarget = TargetDir"/xl/theme";
	RM(deltarget);
	deltarget = TargetDir"/xl/calcChain.xml";
	RM(deltarget);
	deltarget = TargetDir"/xl/styles.xml";
	RM(deltarget);
	deltarget = TargetDir"/xl/worksheets/_rels";
	RM(deltarget);
	deltarget = TargetDir"/[Content_Types].xml";
	RM(deltarget);
	UMLCleaner_CMD1 = CALL_BUSYBOX" find "TargetDir" -type f | ";
	UMLCleaner_CMD2 = CALL_BUSYBOX" xargs -I% mv % "TargetDir;
	UMLCleaner_CMD = UMLCleaner_CMD1 UMLCleaner_CMD2;
	ExecCmd(UMLCleaner_CMD);
	deltarget = TargetDir"/xl";
	RM(deltarget);
}

# ------------------------------------------------------------------------------------------------------------------------

function nkfSJIS(NKF_DIRNAME){
	nkfSJISCMD_01 = CALL_BUSYBOX_GLOB" ls -1 \""NKF_DIRNAME"\" | ";
	nkfSJISCMD_02 = CALL_BUSYBOX" fgrep -e \".xml\"";
	nkfSJISCMD = nkfSJISCMD_01 nkfSJISCMD_02;
	esc = "";
	while(nkfSJISCMD | getline esc){
		esc2 = "ConvertedSJIS_"esc;
		nkfSJISCMD2 = CALL_NKF32" -s -Lw \""NKF_DIRNAME"/"esc"\" > \""NKF_DIRNAME"/"esc2"\"";
		ExecCmd(nkfSJISCMD2);
	}
	close(nkfSJISCMD);
	esc = "";
}

# ------------------------------------------------------------------------------------------------------------------------

function InsCRLF(InsCRLF_DIRNAME){
	InsCRLFCMD_01 = CALL_BUSYBOX_GLOB" ls -1 \""InsCRLF_DIRNAME"\" | ";
	InsCRLFCMD_02 = CALL_BUSYBOX" fgrep -e \".xml\" | "
	InsCRLFCMD_03 = CALL_BUSYBOX" fgrep -e \"ConvertedSJIS_\"";
	InsCRLFCMD = InsCRLFCMD_01 InsCRLFCMD_02 InsCRLFCMD_03;
	print "#! /bin/sh" > GENE_EXECSHELL;
	esc = "";
	while(InsCRLFCMD | getline esc){
		esc2 = esc;
		gsub("ConvertedSJIS_","InsertedCRLF_",esc2);
		# Bourne Shellで実行するためと、カンマ区切りのセルという迷惑な代物が存在したため
		InsCRLFCMD2_01 = "cat \""InsCRLF_DIRNAME"/"esc"\" | ";
		InsCRLFCMD2_02 = "sed -e 's/></>\\\n</g' | ";
		InsCRLFCMD2_03 = "sed -e 's/,/、/g' > \""InsCRLF_DIRNAME"/"esc2"\" & ";
		InsCRLFCMD2 = InsCRLFCMD2_01 InsCRLFCMD2_02 InsCRLFCMD2_03;
		print InsCRLFCMD2 > GENE_EXECSHELL;
	}
	close(cmd);
	esc = "";
	print "wait" > GENE_EXECSHELL;
	print "exit" > GENE_EXECSHELL;
	print "" > GENE_EXECSHELL;
	close(GENE_EXECSHELL);
	# 並列処理のため
	ExecCmd(EXEC_SHELL);
	ExecCmd(RM_SHELL);
}

# ------------------------------------------------------------------------------------------------------------------------

function ExplorerSheetName(ExplorerSheetName_DIRNAME){
	# 不要ファイルの削除
	# 1. <sheet name=でgrep
	# 2. 連番を振る
	# EXCELは、<sheets>タグの中で、ゼロオリジンで見て、何番目にある、という見方をする
	# 3. 全都道府県の行を除外
	# 4. カンマ区切りの3カラム目を切り出す
	# 5. 出力されたファイルを削除
	ExplorerSheetNameCMD01 = CALL_BUSYBOX" fgrep -e \"<sheet name=\" "ExplorerSheetName_DIRNAME"/InsertedCRLF_workbook.xml | ";
	ExplorerSheetNameCMD02 = CALL_GAWK" -f AWKScripts/01_UPDATE/03_SubSystem/01_ExplorerSheetName_SubSystem_01.awk -v Dir="ExplorerSheetName_DIRNAME" | ";
	ExplorerSheetNameCMD03 = CALL_BUSYBOX" fgrep -v -e \""KEYWORD_04"\" | ";
	ExplorerSheetNameCMD04 = CALL_BUSYBOX" cut -f 3 -d \",\" | ";
	ExplorerSheetNameCMD05 = CALL_BUSYBOX" xargs -P 4 rm > "OUT_DEVNULL;
	ExplorerSheetNameCMD = ExplorerSheetNameCMD01 ExplorerSheetNameCMD02 ExplorerSheetNameCMD03 ExplorerSheetNameCMD04 ExplorerSheetNameCMD05;
	ExecCmd(ExplorerSheetNameCMD);
	# workbook.xml系列の削除
	ExplorerSheetNameCMD_02_01 = CALL_BUSYBOX" find "ExplorerSheetName_DIRNAME" -type f | ";
	ExplorerSheetNameCMD_02_02 = CALL_BUSYBOX" fgrep -e \"workbook.xml\" | ";
	ExplorerSheetNameCMD_02_03 = CALL_BUSYBOX" xargs -P 4 rm > "OUT_DEVNULL;
	ExplorerSheetNameCMD_02 = ExplorerSheetNameCMD_02_01 ExplorerSheetNameCMD_02_02 ExplorerSheetNameCMD_02_03;
	ExecCmd(ExplorerSheetNameCMD_02);
	
	# 残存ファイル名の修正
	ExplorerSheetNameCMD_03_01 = CALL_BUSYBOX" find "ExplorerSheetName_DIRNAME" -type f | ";
	ExplorerSheetNameCMD_03_02 = CALL_BUSYBOX" fgrep -e \"sheet\"";
	ExplorerSheetNameCMD_03 = ExplorerSheetNameCMD_03_01 ExplorerSheetNameCMD_03_02;
	esc = "";
	while(ExplorerSheetNameCMD_03 | getline esc){
		esc2 = gensub(/sheet[0-9]+?.xml/,"sheet_ZEN_TODOUFUKEN.xml","g",esc);
		ExplorerSheetNameCMD_04 = CALL_BUSYBOX" mv \""esc"\" \""esc2"\"";
		ExecCmd(ExplorerSheetNameCMD_04);
	}
	close(ExplorerSheetNameCMD_03);
	esc = "";
}

# ------------------------------------------------------------------------------------------------------------------------

