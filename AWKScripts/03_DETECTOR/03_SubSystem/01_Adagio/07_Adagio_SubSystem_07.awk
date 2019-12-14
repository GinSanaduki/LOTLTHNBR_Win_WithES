#! /usr/bin/gawk
# 07_Adagio_SubSystem_07.awk
# gawk.exe -f AWKScripts/03_DETECTOR/03_SubSystem/01_Adagio/07_Adagio_SubSystem_07.awk

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
	Remainder = 1;
	Fname = SPLIT_01;
}

# ------------------------------------------------------------------------------------------------------------------------

{
	print > Fname;
	next;
	if($1 != Cnt){
		Cnt = $1;
		Cnt2++;
		Remainder = Cnt % 8;
		switch(Remainder){
			case "1":
				Fname = SPLIT_01;
				break;
			case "2":
				Fname = SPLIT_02;
				break;
			case "3":
				Fname = SPLIT_03;
				break;
			case "4":
				Fname = SPLIT_04;
				break;
			case "5":
				Fname = SPLIT_05;
				break;
			case "6":
				Fname = SPLIT_06;
				break;
			case "7":
				Fname = SPLIT_07;
				break;
			case "0":
				Fname = SPLIT_08;
				break;
		}
	}
	print > Fname;
}

# ------------------------------------------------------------------------------------------------------------------------

