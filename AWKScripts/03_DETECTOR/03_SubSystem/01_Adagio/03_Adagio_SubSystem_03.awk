#! /usr/bin/gawk
# 03_Adagio_SubSystem_03.awk
# gawk.exe -f AWKScripts/03_DETECTOR/03_SubSystem/01_Adagio/03_Adagio_SubSystem_03.awk

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
	FS = "\t";
}

{
	# 幼稚園
	mat = match($2,/^幼専第/);
	if(mat > 0){
		gsub("幼専","幼専\t",$2);
		print $1"\t"$2;
		next;
	}
	mat = match($2,/^幼1第/);
	if(mat > 0){
		gsub("幼1","幼1\t",$2);
		print $1"\t"$2;
		next;
	}
	mat = match($2,/^幼2第/);
	if(mat > 0){
		gsub("幼2","幼2\t",$2);
		print $1"\t"$2;
		next;
	}
	mat = match($2,/^幼臨第/);
	if(mat > 0){
		gsub("幼臨","幼臨\t",$2);
		print $1"\t"$2;
		next;
	}
	mat = match($2,/^幼特第/);
	if(mat > 0){
		gsub("幼特","幼特\t",$2);
		print $1"\t"$2;
		next;
	}
	# 小学校
	mat = match($2,/^小専第/);
	if(mat > 0){
		gsub("小専","小専\t",$2);
		print $1"\t"$2;
		next;
	}
	mat = match($2,/^小1第/);
	if(mat > 0){
		gsub("小1","小1\t",$2);
		print $1"\t"$2;
		next;
	}
	mat = match($2,/^小2第/);
	if(mat > 0){
		gsub("小2","小2\t",$2);
		print $1"\t"$2;
		next;
	}
	mat = match($2,/^小臨第/);
	if(mat > 0){
		gsub("小臨","小臨\t",$2);
		print $1"\t"$2;
		next;
	}
	mat = match($2,/^小特第/);
	if(mat > 0){
		gsub("小特","小特\t",$2);
		print $1"\t"$2;
		next;
	}
	# 中学校
	mat = match($2,/^中専第/);
	if(mat > 0){
		gsub("中専","中専\t",$2);
		print $1"\t"$2;
		next;
	}
	mat = match($2,/^中1第/);
	if(mat > 0){
		gsub("中1","中1\t",$2);
		print $1"\t"$2;
		next;
	}
	mat = match($2,/^中2第/);
	if(mat > 0){
		gsub("中2","中2\t",$2);
		print $1"\t"$2;
		next;
	}
	mat = match($2,/^中臨第/);
	if(mat > 0){
		gsub("中臨","中臨\t",$2);
		print $1"\t"$2;
		next;
	}
	mat = match($2,/^中特第/);
	if(mat > 0){
		gsub("中特","中特\t",$2);
		print $1"\t"$2;
		next;
	}
	# 高等学校
	mat = match($2,/^高専第/);
	if(mat > 0){
		gsub("高専","高専\t",$2);
		print $1"\t"$2;
		next;
	}
	mat = match($2,/^高1第/);
	if(mat > 0){
		gsub("高1","高1\t",$2);
		print $1"\t"$2;
		next;
	}
	mat = match($2,/^高2第/);
	if(mat > 0){
		gsub("高2","高2\t",$2);
		print $1"\t"$2;
		next;
	}
	mat = match($2,/^高臨第/);
	if(mat > 0){
		gsub("高臨","高臨\t",$2);
		print $1"\t"$2;
		next;
	}
	mat = match($2,/^高特第/);
	if(mat > 0){
		gsub("高特","高特\t",$2);
		print $1"\t"$2;
		next;
	}
	# 特別支援学校
	mat = match($2,/^特支専第/);
	if(mat > 0){
		gsub("特支専","特支専\t",$2);
		print $1"\t"$2;
		next;
	}
	mat = match($2,/^特支1第/);
	if(mat > 0){
		gsub("特支1","特支1\t",$2);
		print $1"\t"$2;
		next;
	}
	mat = match($2,/^特支2第/);
	if(mat > 0){
		gsub("特支2","特支2\t",$2);
		print $1"\t"$2;
		next;
	}
	mat = match($2,/^特支臨第/);
	if(mat > 0){
		gsub("特支臨","特支臨\t",$2);
		print $1"\t"$2;
		next;
	}
	mat = match($2,/^特支特第/);
	if(mat > 0){
		gsub("特支特","特支特\t",$2);
		print $1"\t"$2;
		next;
	}
	# 養護教諭
	mat = match($2,/^養教専第/);
	if(mat > 0){
		gsub("養教専","養教専\t",$2);
		print $1"\t"$2;
		next;
	}
	mat = match($2,/^養教1第/);
	if(mat > 0){
		gsub("養教1","養教1\t",$2);
		print $1"\t"$2;
		next;
	}
	mat = match($2,/^養教2第/);
	if(mat > 0){
		gsub("養教2","養教2\t",$2);
		print $1"\t"$2;
		next;
	}
	mat = match($2,/^養教臨第/);
	if(mat > 0){
		gsub("養教臨","養教臨\t",$2);
		print $1"\t"$2;
		next;
	}
	mat = match($2,/^養教特第/);
	if(mat > 0){
		gsub("養教特","養教特\t",$2);
		print $1"\t"$2;
		next;
	}
	# 栄養教諭
	mat = match($2,/^栄専第/);
	if(mat > 0){
		gsub("栄専","栄専\t",$2);
		print $1"\t"$2;
		next;
	}
	mat = match($2,/^栄1第/);
	if(mat > 0){
		gsub("栄1","栄1\t",$2);
		print $1"\t"$2;
		next;
	}
	mat = match($2,/^栄2第/);
	if(mat > 0){
		gsub("栄2","栄2\t",$2);
		print $1"\t"$2;
		next;
	}
	mat = match($2,/^栄臨第/);
	if(mat > 0){
		gsub("栄臨","栄臨\t",$2);
		print $1"\t"$2;
		next;
	}
	mat = match($2,/^栄特第/);
	if(mat > 0){
		gsub("栄特","栄特\t",$2);
		print $1"\t"$2;
		next;
	}
	# 盲学校
	mat = match($2,/^盲専第/);
	if(mat > 0){
		gsub("盲専","盲専\t",$2);
		print $1"\t"$2;
		next;
	}
	mat = match($2,/^盲1第/);
	if(mat > 0){
		gsub("盲1","盲1\t",$2);
		print $1"\t"$2;
		next;
	}
	mat = match($2,/^盲2第/);
	if(mat > 0){
		gsub("盲2","盲2\t",$2);
		print $1"\t"$2;
		next;
	}
	mat = match($2,/^盲臨第/);
	if(mat > 0){
		gsub("盲臨","盲臨\t",$2);
		print $1"\t"$2;
		next;
	}
	mat = match($2,/^盲特第/);
	if(mat > 0){
		gsub("盲特","盲特\t",$2);
		print $1"\t"$2;
		next;
	}
	# 聾学校
	mat = match($2,/^聾専第/);
	if(mat > 0){
		gsub("聾専","聾専\t",$2);
		print $1"\t"$2;
		next;
	}
	mat = match($2,/^聾1第/);
	if(mat > 0){
		gsub("聾1","聾1\t",$2);
		print $1"\t"$2;
		next;
	}
	mat = match($2,/^聾2第/);
	if(mat > 0){
		gsub("聾2","聾2\t",$2);
		print $1"\t"$2;
		next;
	}
	mat = match($2,/^聾臨第/);
	if(mat > 0){
		gsub("聾臨","聾臨\t",$2);
		print $1"\t"$2;
		next;
	}
	mat = match($2,/^聾特第/);
	if(mat > 0){
		gsub("聾特","聾特\t",$2);
		print $1"\t"$2;
		next;
	}
	# 養護学校
	mat = match($2,/^養学専第/);
	if(mat > 0){
		gsub("養学専","養学専\t",$2);
		print $1"\t"$2;
		next;
	}
	mat = match($2,/^養学1第/);
	if(mat > 0){
		gsub("養学1","養学1\t",$2);
		print $1"\t"$2;
		next;
	}
	mat = match($2,/^養学2第/);
	if(mat > 0){
		gsub("養学2","養学2\t",$2);
		print $1"\t"$2;
		next;
	}
	mat = match($2,/^養学臨第/);
	if(mat > 0){
		gsub("養学臨","養学臨\t",$2);
		print $1"\t"$2;
		next;
	}
	mat = match($2,/^養学特第/);
	if(mat > 0){
		gsub("養学特","養学特\t",$2);
		print $1"\t"$2;
		next;
	}
}

# ------------------------------------------------------------------------------------------------------------------------

