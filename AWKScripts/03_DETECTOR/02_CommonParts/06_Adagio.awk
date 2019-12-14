#! /usr/bin/gawk
# 06_Adagio.awk

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

function Adagio(){
	Adagio_Sub01();
	Adagio_Sub02();
	Adagio_Sub03();
	Adagio_Sub04();
}

# ------------------------------------------------------------------------------------------------------------------------

function Adagio_Sub01(Adagio_Sub01_CMD01,Adagio_Sub01_CMDRetVal){
	Adagio_Sub01_CMD01 = CALL_GAWK" -f AWKScripts/03_DETECTOR/03_SubSystem/01_Adagio/01_Adagio_SubSystem_01.awk "EXTRACT;
	Adagio_Sub01_CMDRetVal = RetExecCmd(Adagio_Sub01_CMD01);
	if(Adagio_Sub01_CMDRetVal == 1){
		print "ExplorerDefine配下に拡張子が「txt」、「dat」、「log」、「def」、「conf」、" > "con";
		print "「csv」、「tsv」のいずれかのファイル内に、適切な免許番号が存在しません。" > "con";
		print "ExplorerDefine配下に前述の拡張子のファイルを配置し、適切な免許番号を記載してから、再度起動してください。" > "con";
		close("con");
		exit 99;
	}
	Adagio_Sub02_CMD01 = CALL_BUSYBOX" sh ShellScripts/03_DETECTOR/03_Adagio/01_CALL_DETECTOR_Adagio_01.sh";
	ExecCmd(Adagio_Sub02_CMD01);
}

# ------------------------------------------------------------------------------------------------------------------------

function Adagio_Sub02(Adagio_Sub02_CMD01,Adagio_Sub02_CMD02){
	# 12_CALL_DETECTOR_Adagio_01.shの後処理
	Adagio_Sub02_CMD02 = CALL_BUSYBOX" rm "FILTER_01" > "OUT_DEVNULL;
	ExecCmd(Adagio_Sub02_CMD02);
}

# ------------------------------------------------------------------------------------------------------------------------

function Adagio_Sub03(Adagio_Sub03_CMD01,Adagio_Sub03_CMD02){
	Adagio_Sub03_CMD01 = CALL_GAWK" -f AWKScripts/03_DETECTOR/03_SubSystem/01_Adagio/05_Adagio_SubSystem_05.awk "FILTER_02;
	Adagio_Sub03_CMDRetVal = RetExecCmd(Adagio_Sub03_CMD01);
	if(Adagio_Sub03_CMDRetVal == 1){
		print "ExplorerDefine配下に拡張子が「txt」、「dat」、「log」、「def」、「conf」、" > "con";
		print "「csv」、「tsv」のいずれかのファイル内に、適切な免許番号が存在しません。" > "con";
		print "ExplorerDefine配下に前述の拡張子のファイルを配置し、適切な免許番号を記載してから、再度起動してください。" > "con";
		close("con");
		exit 99;
	}
	# 05_Adagio_SubSystem_05.awkの後処理
	Adagio_Sub03_CMD02 = CALL_BUSYBOX" rm "FILTER_02" > "OUT_DEVNULL;
	ExecCmd(Adagio_Sub03_CMD02);
}

# ------------------------------------------------------------------------------------------------------------------------

function Adagio_Sub04(Adagio_Sub04_CMD01){
	Adagio_Sub04_CMD01 = CALL_BUSYBOX" sh ShellScripts/03_DETECTOR/03_Adagio/05_CALL_DETECTOR_Adagio_05.sh";
	ExecCmd(Adagio_Sub04_CMD01);
}

# ------------------------------------------------------------------------------------------------------------------------

