#! /usr/bin/gawk
# 05_Adagio_SubSystem_05.awk
# gawk.exe -f AWKScripts/03_DETECTOR/03_SubSystem/01_Adagio/05_Adagio_SubSystem_05.awk DETECTOR_WORKS/Filter_02.tsv

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
	Cnt = 0;
}

{
	check_col1();
	check_col2();
	check_col3();
	check_col4();
	check_col5();
	check_col6();
	Cnt++;
	print > FILTER_03;
}

END{
	if(Cnt == 0){
		exit 1;
	} else {
		exit 0;
	}
}

# ------------------------------------------------------------------------------------------------------------------------

function check_col1(){
	switch($1){
		case "昭":
			break;
		case "平":
			break;
		case "令":
			break;
		default:
			next;
	}
}

# ------------------------------------------------------------------------------------------------------------------------

function check_col2(){
	if($1 == "昭"){
		switch($2){
			case "30":
				break;
			case "31":
				break;
			case "32":
				break;
			case "33":
				break;
			case "34":
				break;
			case "35":
				break;
			case "36":
				break;
			case "37":
				break;
			case "38":
				break;
			case "39":
				break;
			case "40":
				break;
			case "41":
				break;
			case "42":
				break;
			case "43":
				break;
			case "44":
				break;
			case "45":
				break;
			case "46":
				break;
			case "47":
				break;
			case "48":
				break;
			case "49":
				break;
			case "50":
				break;
			case "51":
				break;
			case "52":
				break;
			case "53":
				break;
			case "54":
				break;
			case "55":
				break;
			case "56":
				break;
			case "57":
				break;
			case "58":
				break;
			case "59":
				break;
			case "60":
				break;
			case "61":
				break;
			case "62":
				break;
			case "63":
				break;
			default:
				next;
		}
	} else if($1 == "平"){
		switch($2){
			case "1":
				break;
			case "2":
				break;
			case "3":
				break;
			case "4":
				break;
			case "5":
				break;
			case "6":
				break;
			case "7":
				break;
			case "8":
				break;
			case "9":
				break;
			case "10":
				break;
			case "11":
				break;
			case "12":
				break;
			case "13":
				break;
			case "14":
				break;
			case "15":
				break;
			case "16":
				break;
			case "17":
				break;
			case "18":
				break;
			case "19":
				break;
			case "20":
				break;
			case "21":
				break;
			case "22":
				break;
			case "23":
				break;
			case "24":
				break;
			case "25":
				break;
			case "26":
				break;
			case "27":
				break;
			case "28":
				break;
			case "29":
				break;
			case "30":
				break;
			default:
				next;
		}
	} else {
		switch($2){
			case "1":
				break;
			case "2":
				break;
			case "3":
				break;
			case "4":
				break;
			case "5":
				break;
			case "6":
				break;
			case "7":
				break;
			case "8":
				break;
			case "9":
				break;
			case "10":
				break;
			default:
				next;
		}
	}
}

# ------------------------------------------------------------------------------------------------------------------------

function check_col3(){
	switch($3){
		case "幼専":
			break;
		case "幼1":
			break;
		case "幼2":
			break;
		case "幼臨":
			break;
		case "幼特":
			break;
		case "小専":
			break;
		case "小1":
			break;
		case "小2":
			break;
		case "小臨":
			break;
		case "小特":
			break;
		case "中専":
			break;
		case "中1":
			break;
		case "中2":
			break;
		case "中臨":
			break;
		case "中特":
			break;
		case "高専":
			break;
		case "高1":
			break;
		case "高2":
			break;
		case "高臨":
			break;
		case "高特":
			break;
		case "特支専":
			break;
		case "特支1":
			break;
		case "特支2":
			break;
		case "特支臨":
			break;
		case "特支特":
			break;
		case "養教専":
			break;
		case "養教1":
			break;
		case "養教2":
			break;
		case "養教臨":
			break;
		case "養教特":
			break;
		case "栄専":
			break;
		case "栄1":
			break;
		case "栄2":
			break;
		case "栄臨":
			break;
		case "栄特":
			break;
		case "盲専":
			break;
		case "盲1":
			break;
		case "盲2":
			break;
		case "盲臨":
			break;
		case "盲特":
			break;
		case "聾専":
			break;
		case "聾1":
			break;
		case "聾2":
			break;
		case "聾臨":
			break;
		case "聾特":
			break;
		case "養学専":
			break;
		case "養学1":
			break;
		case "養学2":
			break;
		case "養学臨":
			break;
		case "養学特":
			break;
		default:
			next;
	}
}

# ------------------------------------------------------------------------------------------------------------------------

function check_col4(){
	if($4 != "第"){
		next;
	}
}

# ------------------------------------------------------------------------------------------------------------------------

function check_col5(){
	if($5 < 1 || length($5) > 5){
		next;
	}
}

# ------------------------------------------------------------------------------------------------------------------------

function check_col6(){
	if($6 != "号"){
		next;
	}
}

# ------------------------------------------------------------------------------------------------------------------------

