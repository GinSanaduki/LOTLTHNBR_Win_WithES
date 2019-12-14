#! /usr/bin/gawk
# 08_Adagio_SubSystem_08.awk
# gawk.exe -f AWKScripts/03_DETECTOR/03_SubSystem/01_Adagio/08_Adagio_SubSystem_08.awk

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
@include "AWKScripts/02_INTEGRITY_MONITORING/02_CommonParts/01_Konzertouverture.awk";
@include "AWKScripts/03_DETECTOR/02_CommonParts/01_Konzertouverture.awk";

# ------------------------------------------------------------------------------------------------------------------------

BEGIN{
	Konzertouverture_03();
	CntLine();
	GeneShell();
}

# ------------------------------------------------------------------------------------------------------------------------

function CntLine(CntLine_CMD01,CntLine_CMD02,CntLine_CMD03,CntLine_CMD04,CntLine_CMD05,CntLine_CMD06,CntLine_CMD07,CntLine_CMD08){
	CntLine_CMD01 = CALL_GAWK" -f AWKScripts/03_DETECTOR/03_SubSystem/01_Adagio/09_Adagio_SubSystem_09.awk -v Call=01 "FILTER_04;
	Res_CntLine_CMD01 = RetTextExecCmd(CntLine_CMD01);
}

# ------------------------------------------------------------------------------------------------------------------------

function GeneShell(){
	# wait用ビットフィールド
	BitField = 0;
	print "#! /bin/sh" > EXEC_EXTRACT;
	print "" > EXEC_EXTRACT;
	if(Res_CntLine_CMD01 > 0){
		GeneShell_02(EXEC_EXTRACT_Parallel_01,FILTER_04,"01");
	}
	if(BitField == 1){
		print "wait" > EXEC_EXTRACT;
		print "" > EXEC_EXTRACT;
	}
	print "exit 0" > EXEC_EXTRACT;
	print "" > EXEC_EXTRACT;
	close(EXEC_EXTRACT);
}

function GeneShell_02(GeneShell_02_Shell,GeneShell_02_FileName,GeneShell_02_ShellNumber){
	BitField = 1;
	# メインShellのコール部を記述
	print "sh "GeneShell_02_Shell" & " > EXEC_EXTRACT;
	# 並列用サブShellを記述
	print "#! /bin/sh" > GeneShell_02_Shell;
	print "" > GeneShell_02_Shell;
	print "LinuxTools/gawk.exe -f AWKScripts/03_DETECTOR/03_SubSystem/01_Adagio/11_Adagio_SubSystem_11.awk -v Call="GeneShell_02_ShellNumber" "GeneShell_02_FileName > GeneShell_02_Shell;
	print "" > GeneShell_02_Shell;
	print "exit 0" > GeneShell_02_Shell;
	print "" > GeneShell_02_Shell;
	close(GeneShell_02_Shell);
}

