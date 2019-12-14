#! /usr/bin/gawk
# 06_Adagio_SubSystem_06.awk
# gawk.exe -f AWKScripts/03_DETECTOR/03_SubSystem/01_Adagio/06_Adagio_SubSystem_06.awk

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

# Declaration_03
@include "AWKScripts/03_DETECTOR/02_CommonParts/01_Konzertouverture.awk";

# ------------------------------------------------------------------------------------------------------------------------

BEGIN{
	FS = "\t";
	Declaration_03();
	Cnt = 1;
}

{
	len = length($5);
	if(len == 5){
		print Cnt"\t"$1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6 > FILTER_04;
		Cnt++;
		next;
	}
	switch(len){
		case "1":
			Adjust_1_1 = "0000"$5;
			Adjust_1_2 = "000"$5;
			Adjust_1_3 = "00"$5;
			Adjust_1_4 = "0"$5;
			print Cnt"\t"$1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6 > FILTER_04;
			print Cnt"\t"$1"\t"$2"\t"$3"\t"$4"\t"Adjust_1_4"\t"$6 > FILTER_04;
			print Cnt"\t"$1"\t"$2"\t"$3"\t"$4"\t"Adjust_1_3"\t"$6 > FILTER_04;
			print Cnt"\t"$1"\t"$2"\t"$3"\t"$4"\t"Adjust_1_2"\t"$6 > FILTER_04;
			print Cnt"\t"$1"\t"$2"\t"$3"\t"$4"\t"Adjust_1_1"\t"$6 > FILTER_04;
			Cnt++;
			next;
		case "2":
			Adjust_2_1 = "000"$5;
			Adjust_2_2 = "00"$5;
			Adjust_2_3 = "0"$5;
			print Cnt"\t"$1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6 > FILTER_04;
			print Cnt"\t"$1"\t"$2"\t"$3"\t"$4"\t"Adjust_2_3"\t"$6 > FILTER_04;
			print Cnt"\t"$1"\t"$2"\t"$3"\t"$4"\t"Adjust_2_2"\t"$6 > FILTER_04;
			print Cnt"\t"$1"\t"$2"\t"$3"\t"$4"\t"Adjust_2_1"\t"$6 > FILTER_04;
			Cnt++;
			next;
		case "3":
			Adjust_3_1 = "00"$5;
			Adjust_3_2 = "0"$5;
			print Cnt"\t"$1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6 > FILTER_04;
			print Cnt"\t"$1"\t"$2"\t"$3"\t"$4"\t"Adjust_3_2"\t"$6 > FILTER_04;
			print Cnt"\t"$1"\t"$2"\t"$3"\t"$4"\t"Adjust_3_1"\t"$6 > FILTER_04;
			Cnt++;
			next;
		case "4":
			Adjust_4_1 = "0"$5;
			print Cnt"\t"$1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6 > FILTER_04;
			print Cnt"\t"$1"\t"$2"\t"$3"\t"$4"\t"Adjust_4_1"\t"$6 > FILTER_04;
			Cnt++;
			next;
	}
}

