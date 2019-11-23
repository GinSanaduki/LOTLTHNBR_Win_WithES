#! /usr/bin/gawk
# 03_Larghetto_SubSystem_03.awk
# gawk.exe -f AWKScripts/02_INTEGRITY_MONITORING/03_SubSystem/03_Larghetto_SubSystem_03.awk -v XLSXName=XLSXName -v CSVName=CSVName

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
@include "AWKScripts/01_UPDATE/02_CommonParts/04_FileUtils.awk";

# ------------------------------------------------------------------------------------------------------------------------

BEGIN{
	Declaration();
	len_XLSX_minus5 = length(XLSXName) - 5;
	DirName = substr(XLSXName,1,len_XLSX_minus5);
	FileName = XLSXName;
	MD(DirName);
	Unzip(FileName,DirName);
	UMLCleaner(DirName);
	nkfSJIS(DirName);
	InsCRLF_02(DirName);
	ExplorerSheetName(DirName);
	ExtractSharedStrings(DirName);
	Extractsheet_ZEN_TODOUFUKEN(DirName);
	OuterJoin(DirName);
	UMLCleaner02(DirName);
	Line_RewardGiver = SearchLine(DirName,KEYWORD_08);
	Line_LicenseNumber = SearchLine(DirName,KEYWORD_09);
	Line_Curriculum = SearchLine(DirName,KEYWORD_10);
	split(Line_RewardGiver,Line_RewardGiverArrays,",");
	split(Line_LicenseNumber,Line_LicenseNumberArrays,",");
	split(Line_Curriculum,Line_CurriculumArrays,",");
	ColAlphabet_RewardGiver = Line_RewardGiverArrays[2];
	ColAlphabet_LicenseNumber = Line_LicenseNumberArrays[2];
	ColAlphabet_Curriculum = Line_CurriculumArrays[2];
	RowNumber_RewardGiver = Line_RewardGiverArrays[3];
	RowNumber_LicenseNumber = Line_LicenseNumberArrays[3];
	RowNumber_Curriculum = Line_CurriculumArrays[3];
	delete Line_RewardGiverArrays;
	delete Line_LicenseNumberArrays;
	delete Line_CurriculumArrays;
	DelugeMyth(DirName,ColAlphabet_RewardGiver,ColAlphabet_LicenseNumber,ColAlphabet_Curriculum,RowNumber_RewardGiver,RowNumber_LicenseNumber,RowNumber_Curriculum);
	GenerateDefineCSV(DirName,CSVName,ColAlphabet_RewardGiver,ColAlphabet_LicenseNumber,ColAlphabet_Curriculum);
	CMD = CALL_BUSYBOX" rm -r \""DirName"\" > "OUT_DEVNULL;
	ExecCmd(CMD);
}

function InsCRLF_02(InsCRLF_DIRNAME){
	InsCRLFCMD_01 = CALL_BUSYBOX_GLOB" ls -1 \""InsCRLF_DIRNAME"\" | ";
	InsCRLFCMD_02 = CALL_BUSYBOX" fgrep -e \".xml\" | "
	InsCRLFCMD_03 = CALL_BUSYBOX" fgrep -e \"ConvertedSJIS_\"";
	InsCRLFCMD = InsCRLFCMD_01 InsCRLFCMD_02 InsCRLFCMD_03;
	InsCRLFCMD02 = CALL_BUSYBOX" sh ShellScripts/05_PWGen.sh"
	GENE_EXECSHELL = RetTextExecCmd(InsCRLFCMD02);
	GENE_EXECSHELL = GENE_EXECSHELL".sh";
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
	EXEC_SHELL = CALL_BUSYBOX" sh \""GENE_EXECSHELL"\"";
	RM_SHELL = CALL_BUSYBOX" rm \""GENE_EXECSHELL"\" > "OUT_DEVNULL;
	ExecCmd(EXEC_SHELL);
	ExecCmd(RM_SHELL);
}

