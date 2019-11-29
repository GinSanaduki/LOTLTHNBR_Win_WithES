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
	WorksDir_02 = "DETECTOR_WORKS";
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
	TMP_EXT_CSV_02 = WorksDir_02"/Tmp_Ext_CSV_02.txt";
	TMP_EXT_TSV_UTF8 = WorksDir_02"/Tmp_Ext_TSV_UTF8.txt";
	TMP_EXT_TSV_SJIS = WorksDir_02"/Tmp_Ext_TSV_SJIS.txt";
	TMP_EXT_TSV = WorksDir_02"/Tmp_Ext_TSV.txt";
	TMP_EXT_TSV_02 = WorksDir_02"/Tmp_Ext_TSV_02.txt";
	TMP_EXT_ASTER = WorksDir_02"/Tmp_Ext_*.txt";
	EXTRACT = WorksDir_02"/ExtractedWord.txt";
	EXTRACTOR_EXT_TXT = WorksDir_02"/Extractor_Ext_TXT.sh";
	EXTRACTOR_EXT_DAT = WorksDir_02"/Extractor_Ext_DAT.sh";
	EXTRACTOR_EXT_LOG = WorksDir_02"/Extractor_Ext_LOG.sh";
	EXTRACTOR_EXT_DEF = WorksDir_02"/Extractor_Ext_DEF.sh";
	EXTRACTOR_EXT_CONF = WorksDir_02"/Extractor_Ext_CONF.sh";
	EXTRACTOR_EXT_CSV = WorksDir_02"/Extractor_Ext_CSV.sh";
	EXTRACTOR_EXT_TSV = WorksDir_02"/Extractor_Ext_TSV.sh";

}

# ------------------------------------------------------------------------------------------------------------------------

