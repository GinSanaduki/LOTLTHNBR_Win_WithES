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

function Konzertouverture_03(){
	Declaration();
	# UPDATEベースのDeclarationの差分
	Declaration_02();
	# INTEGRITY_MONITORINGベースのDeclarationの差分
	Declaration_03();
}

# ------------------------------------------------------------------------------------------------------------------------

function Declaration_03(){
	# Tmp_Ext_TXT_*.txtを格納
	WorksDir_02 = "DETECTOR_WORKS";
	# Extractor_Ext_*.shを格納
	WorksDir_03 = "DETECTOR_WORKS_DEUX";
	# フィルタ透過後の照会キーワードファイルを格納
	WorksDir_04 = "DETECTOR_WORKS_TROIS";
	# ExecExtractDetector.sh、ExecExtractDetector_Parallel_0[1-8].shを格納
	WorksDir_05 = "DETECTOR_WORKS_QUATRE";
	# Detector_WORD_No_[[:digit:]].txtを格納
	WorksDir_06 = "DETECTOR_WORKS_CINQ";
	# DefineCSV/Define_Gene_2[0-9]{3}[0-1][0-9][0-3][0-9]_XML_From_2[0-9]{3}[0-1][0-9]_To_2[0-9]{3}[0-1][0-9]_OriginXLSX_Acquisition_2[0-9]{3}[0-1][0-9][0-3][0-9]_UnderText_Origin_.+\\.csv
	# のファイルリストを格納
	WorksDir_07 = "DETECTOR_WORKS_SIX";
	# 最新分（当日分）のExtract（WARNING対象）であるGrepDefine_Phase1.tsvを格納
	WorksDir_08 = "DETECTOR_WORKS_SEPT";
	# それ以前のExtract（CAUTION対象、最新分（当日分）のExtractの記載事項に係る共通部分を除外）であるGrepDefine_Phase2.tsvを格納
	WorksDir_09 = "DETECTOR_WORKS_HUIT";
	# Detector_WORD_No_[[:digit:]].txtのファイルリストを格納
	WorksDir_10 = "DETECTOR_WORKS_NEUF";
	# Phase1Grep_ParallelExecShell.shを格納
	WorksDir_11 = "DETECTOR_WORKS_DIX";
	# 最新分（当日分）のExtract（WARNING対象）に対するGrepRes_No_[[:digit:]].txtを格納
	WorksDir_12 = "DETECTOR_WORKS_ONZE";
	# 最新分（当日分）のExtract（WARNING対象）に対するGrepRes_No_[[:digit:]].txtを格納
	WorksDir_13 = "DETECTOR_WORKS_DOUZE";
	WorksDir_14 = "DETECTOR_WORKS_TREIZE";
	# 
	WorksDir_15 = "DETECTOR_WORKS_QUATORZE";
	# 
	WorksDir_16 = "DETECTOR_WORKS_QUINZE";
	# 
	WorksDir_17 = "DETECTOR_WORKS_SEIZE";



	# それ以前のExtract（CAUTION対象、最新分（当日分）のExtractの記載事項に係る共通部分を除外）
	# に対するGrepRes_No_[[:digit:]].txtを格納


	DIR_EXPLORER_DEFINE = "ExplorerDefine";
	
	TMP_EXT_TXT_UTF8 = WorksDir_02"/Tmp_Ext_TXT_UTF8.txt";
	TMP_EXT_TXT_SJIS = WorksDir_02"/Tmp_Ext_TXT_SJIS.txt";
	TMP_EXT_TXT = WorksDir_02"/Tmp_Ext_TXT.txt";
	
	TMP_EXT_DAT_UTF8 = WorksDir_02"/Tmp_Ext_DAT_UTF8.txt";
	TMP_EXT_DAT_SJIS = WorksDir_02"/Tmp_Ext_DAT_SJIS.txt";
	TMP_EXT_DAT = WorksDir_02"/Tmp_Ext_DAT.txt";
	
	TMP_EXT_LOG_UTF8 = WorksDir_02"/Tmp_Ext_LOG_UTF8.txt";
	TMP_EXT_LOG_SJIS = WorksDir_02"/Tmp_Ext_LOG_SJIS.txt";
	TMP_EXT_LOG = WorksDir_02"/Tmp_Ext_LOG.txt";
	
	TMP_EXT_DEF_UTF8 = WorksDir_02"/Tmp_Ext_DEF_UTF8.txt";
	TMP_EXT_DEF_SJIS = WorksDir_02"/Tmp_Ext_DEF_SJIS.txt";
	TMP_EXT_DEF = WorksDir_02"/Tmp_Ext_DEF.txt";
	
	TMP_EXT_CONF_UTF8 = WorksDir_02"/Tmp_Ext_CONF_UTF8.txt";
	TMP_EXT_CONF_SJIS = WorksDir_02"/Tmp_Ext_CONF_SJIS.txt";
	TMP_EXT_CONF = WorksDir_02"/Tmp_Ext_CONF.txt";
	
	TMP_EXT_CSV_UTF8 = WorksDir_02"/Tmp_Ext_CSV_UTF8.txt";
	TMP_EXT_CSV_SJIS = WorksDir_02"/Tmp_Ext_CSV_SJIS.txt";
	TMP_EXT_CSV = WorksDir_02"/Tmp_Ext_CSV.txt";
	# カンマを改行に変換
	TMP_EXT_CSV_02 = WorksDir_02"/Tmp_Ext_CSV_02.txt";
	
	TMP_EXT_TSV_UTF8 = WorksDir_02"/Tmp_Ext_TSV_UTF8.txt";
	TMP_EXT_TSV_SJIS = WorksDir_02"/Tmp_Ext_TSV_SJIS.txt";
	TMP_EXT_TSV = WorksDir_02"/Tmp_Ext_TSV.txt";
	# タブ文字を改行に変換
	TMP_EXT_TSV_02 = WorksDir_02"/Tmp_Ext_TSV_02.txt";
	
	TMP_EXT_ASTER = WorksDir_02"/Tmp_Ext_*.txt";
	
	# Tmp_Ext_*.txtを結合した照会キーワードファイル
	EXTRACT = WorksDir_04"/ExtractedWord.txt";
	
	# 並列処理Shell
	EXTRACTOR_EXT_TXT = WorksDir_03"/Extractor_Ext_TXT.sh";
	EXTRACTOR_EXT_DAT = WorksDir_03"/Extractor_Ext_DAT.sh";
	EXTRACTOR_EXT_LOG = WorksDir_03"/Extractor_Ext_LOG.sh";
	EXTRACTOR_EXT_DEF = WorksDir_03"/Extractor_Ext_DEF.sh";
	EXTRACTOR_EXT_CONF = WorksDir_03"/Extractor_Ext_CONF.sh";
	EXTRACTOR_EXT_CSV = WorksDir_03"/Extractor_Ext_CSV.sh";
	EXTRACTOR_EXT_TSV = WorksDir_03"/Extractor_Ext_TSV.sh";
	
	# フィルタ透過後の照会キーワードファイル
	FILTER_01 = WorksDir_04"/Filter_01.txt";
	FILTER_02 = WorksDir_04"/Filter_02.tsv";
	FILTER_03 = WorksDir_04"/Filter_03.tsv";
	FILTER_04 = WorksDir_04"/Filter_04.tsv";
	
	# Filter_04.tsvのナンバーで16分割
	SPLIT_01 = WorksDir_05"/SplitFile_01.txt";
	SPLIT_02 = WorksDir_05"/SplitFile_02.txt";
	SPLIT_03 = WorksDir_05"/SplitFile_03.txt";
	SPLIT_04 = WorksDir_05"/SplitFile_04.txt";
	SPLIT_05 = WorksDir_05"/SplitFile_05.txt";
	SPLIT_06 = WorksDir_05"/SplitFile_06.txt";
	SPLIT_07 = WorksDir_05"/SplitFile_07.txt";
	SPLIT_08 = WorksDir_05"/SplitFile_08.txt";
	
	# ExecExtractDetector.sh、ExecExtractDetector_Parallel_[0-1][0-9].shを格納
	EXEC_EXTRACT = WorksDir_05"/ExecExtractDetector.sh";
	EXEC_EXTRACT_Parallel_01 = WorksDir_05"/ExecExtractDetector_Parallel_01.sh";
	EXEC_EXTRACT_Parallel_02 = WorksDir_05"/ExecExtractDetector_Parallel_02.sh";
	EXEC_EXTRACT_Parallel_03 = WorksDir_05"/ExecExtractDetector_Parallel_03.sh";
	EXEC_EXTRACT_Parallel_04 = WorksDir_05"/ExecExtractDetector_Parallel_04.sh";
	EXEC_EXTRACT_Parallel_05 = WorksDir_05"/ExecExtractDetector_Parallel_05.sh";
	EXEC_EXTRACT_Parallel_06 = WorksDir_05"/ExecExtractDetector_Parallel_06.sh";
	EXEC_EXTRACT_Parallel_07 = WorksDir_05"/ExecExtractDetector_Parallel_07.sh";
	EXEC_EXTRACT_Parallel_08 = WorksDir_05"/ExecExtractDetector_Parallel_08.sh";
	
	# 最新分（当日分）のExtract（WARNING対象）
	GREPDEF_PHASE1 = WorksDir_08"/GrepDefine_Phase1.tsv";
	# それ以前のExtract（CAUTION対象、最新分（当日分）のExtractの記載事項に係る共通部分を除外）
	GREPDEF_PHASE2_01 = WorksDir_09"/GrepDefine_Phase2.tsv";
	# ファイルリスト
	FLIST = WorksDir_07"/FileList.tsv";
	# Detector_WORD_No_[[:digit:]].txtのファイルリスト
	DETECTOR_WORD_FLIST = WorksDir_14"/Detector_WORD_FileList.csv";
	# Phase1Grepの並列処理管理シェルスクリプト
	PHASE1GREP_EXECSHELL = WorksDir_15"/Phase1Grep_ParallelExecShell.sh";
}

# ------------------------------------------------------------------------------------------------------------------------

