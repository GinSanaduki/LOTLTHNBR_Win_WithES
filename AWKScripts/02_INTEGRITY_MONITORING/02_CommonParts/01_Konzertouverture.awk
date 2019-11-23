#! /usr/bin/gawk
# 01_Konzertouverture.awk

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

function Konzertouverture_02(){
	Declaration();
	# UPDATEベースのDeclarationの差分
	Declaration_02();
	# 作業ディレクトリのリセット
	MDRM(WorksDir);
}

# ------------------------------------------------------------------------------------------------------------------------

function Declaration_02(){
	DIR_HTML_UTF8 = "AcquiredHTML_UTF8";
	DIR_HTML_SJIS = "AcquiredHTML_ShiftJIS";
	DIR_HTML_EDIT = "EditedHTML";
	DIR_HASHCONF = "HashConf";
	DIR_XLSX = "AcquiredXLSX";
	DIR_DEFINECSV = "DefineCSV";
	HASHCONFREG = DIR_HASHCONF"/HashInfo_2[0-9]{3}[0-1][0-9][0-3][0-9].def";
	HTMLNAMEREG = "List_of_license_numbers_that_have_not_returned_a_teachers_license_2[0-9]{3}[0-1][0-9][0-3][0-9].txt";
	HTML_UTF8_HTMLNAMEREG = DIR_HTML_UTF8"/"HTMLNAMEREG;
	HTML_SJIS_HTMLNAMEREG = DIR_HTML_SJIS"/"HTMLNAMEREG;
	HTML_EDIT_HTMLNAMEREG = DIR_HTML_EDIT"/"HTMLNAMEREG;
	XLSXREG = DIR_XLSX"/Acquisition_2[0-9]{3}[0-1][0-9][0-3][0-9]_UnderText_From_2[0-9]{3}[0-1][0-9]_To_2[0-9]{3}[0-1][0-9]_Origin_.+\\.xlsx";
	CSVREG = DIR_DEFINECSV"/Define_Gene_2[0-9]{3}[0-1][0-9][0-3][0-9]_XML_From_2[0-9]{3}[0-1][0-9]_To_2[0-9]{3}[0-1][0-9]_OriginXLSX_Acquisition_2[0-9]{3}[0-1][0-9][0-3][0-9]_UnderText_Origin_.+\\.csv";
	TODAY = strftime("%Y%m%d",systime());
	TODAY_HTML = "List_of_license_numbers_that_have_not_returned_a_teachers_license_"TODAY".txt";
	TODAY_HTML_UTF8 = DIR_HTML_UTF8"/"TODAY_HTML;
	TODAY_HTML_SJIS = DIR_HTML_SJIS"/"TODAY_HTML;
	TODAY_HTML_EDIT = DIR_HTML_EDIT"/"TODAY_HTML;
	TODAY_XLSX = DIR_XLSX"/Acquisition_"TODAY"_UnderText_From_2[0-9]{3}[0-1][0-9]_To_2[0-9]{3}[0-1][0-9]_Origin_.+\\.xlsx";
	TODAY_CSV = DIR_DEFINECSV"/Define_Gene_"TODAY"_XML_From_2[0-9]{3}[0-1][0-9]_To_2[0-9]{3}[0-1][0-9]_OriginXLSX_Acquisition_2[0-9]{3}[0-1][0-9][0-3][0-9]_UnderText_Origin_.+\\.csv";
	TODAY_HASHINFO = DIR_HASHCONF"/HashInfo_"TODAY".def";
	CALL_BUSYBOX = "LinuxTools\\busybox.exe";
	CALL_BUSYBOX_GLOB = "LinuxTools\\busybox_glob.exe";
	CALL_NKF32 = "LinuxTools\\nkf32.exe";
	CALL_GAWK = "LinuxTools\\gawk.exe";
	OUT_DEVNULL = "nul 2>&1";
	WorksDir = "INTEGRITY_MONITORING_WORKS";
	Tmp_RetCode_UTF8 = WorksDir"/Tmp_RetCode_UTF8.txt";
	Tmp_RetCode_SJIS = WorksDir"/Tmp_RetCode_SJIS.txt";
	Tmp_RetCode_EDIT = WorksDir"/Tmp_RetCode_EDIT.txt";
	Tmp_RetCode_XLSX = WorksDir"/Tmp_RetCode_XLSX.txt";
	Tmp_RetCode_CSV = WorksDir"/Tmp_RetCode_CSV.txt";
	Tmp_RetCode_HASH = WorksDir"/Tmp_RetCode_HASH.txt";
	GetRetCode_UTF8 = CALL_BUSYBOX" cat "Tmp_RetCode_UTF8;
	GetRetCode_SJIS = CALL_BUSYBOX" cat "Tmp_RetCode_SJIS;
	GetRetCode_EDIT = CALL_BUSYBOX" cat "Tmp_RetCode_EDIT;
	GetRetCode_XLSX = CALL_BUSYBOX" cat "Tmp_RetCode_XLSX;
	GetRetCode_CSV = CALL_BUSYBOX" cat "Tmp_RetCode_CSV;
	GetRetCode_HASH = CALL_BUSYBOX" cat "Tmp_RetCode_HASH;
	CheckFile_UTF8 = "AcquiredHTML_UTF8/List_of_license_numbers_that_have_not_returned_a_teachers_license_";
	CheckFile_SJIS = "AcquiredHTML_ShiftJIS/List_of_license_numbers_that_have_not_returned_a_teachers_license_";
	CheckFile_EDIT = "EditedHTML/List_of_license_numbers_that_have_not_returned_a_teachers_license_";
	CheckFile_XLSX = "AcquiredXLSX/Acquisition_";
	CheckFile_CSV = "DefineCSV/Define_Gene_";
	GENE_EXECSHELL_02 = "EXECSHELL_02.sh";
	EXEC_SHELL_02 = CALL_BUSYBOX" sh \""GENE_EXECSHELL_02"\"";
	RM_SHELL_02 = CALL_BUSYBOX" rm \""GENE_EXECSHELL_02"\" > "OUT_DEVNULL;
	Tmp_Extracted_UTF8 = WorksDir"/Tmp_Extracted_UTF8.txt";
	Tmp_Extracted_SJIS = WorksDir"/Tmp_Extracted_SJIS.txt";
	Tmp_Extracted_EDIT = WorksDir"/Tmp_Extracted_EDIT.txt";
	Tmp_Extracted_XLSX = WorksDir"/Tmp_Extracted_XLSX.txt";
	Tmp_Extracted_CSV = WorksDir"/Tmp_Extracted_CSV.txt";
	Tmp_Extracted_HASH = WorksDir"/Tmp_Extracted_HASH.txt";
	Tmp_Extracted_Other = WorksDir"/Tmp_Extracted_Other.txt";
}

# ------------------------------------------------------------------------------------------------------------------------

