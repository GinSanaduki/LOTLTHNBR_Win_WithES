#! /usr/bin/gawk -f
# 17_GenerateDefineCSV_SubSystem_01.awk
# gawk.exe -f AWKScripts/01_UPDATE/03_SubSystem/17_GenerateDefineCSV_SubSystem_01.awk -v GenerateDefineCSV_COL01=GenerateDefineCSV_COL01 -v GenerateDefineCSV_COL02=GenerateDefineCSV_COL02 -v GenerateDefineCSV_COL03=GenerateDefineCSV_COL03 DelugeMythed.csv > GenerateDefineCSV_OUT.csv

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

BEGIN{
	FS = ",";
	cnt = 0;
	BitField01 = 0;
	BitField02 = 0;
	Tex = "";
}

($2 == GenerateDefineCSV_COL01 && BitField01 == 0){
	BitField01 = 1;
	Tex = "";
	cnt = $3;
	Tex = $3","$5",";
	next;
}

($2 == GenerateDefineCSV_COL02 && BitField01 == 1 && $3 == cnt){
	BitField02 = 1;
	Tex = Tex $5",";
	next;
}

($2 == GenerateDefineCSV_COL03 && BitField01 == 1 && BitField02 == 1 && $3 == cnt){
	Tex = Tex $5;
	gsub("<改行コード>","、",Tex);
	print Tex;
	Tex = "";
	BitField01 = 0;
	BitField02 = 0;
}

# 教科欄が空のケースが存在するため
($2 == GenerateDefineCSV_COL01 && BitField01 == 1 && BitField02 == 1){
	gsub("<改行コード>","、",Tex);
	print Tex;
	Tex = "";
	BitField01 = 1;
	BitField02 = 0;
	cnt = $3;
	Tex = $3","$5",";
	next;
}

