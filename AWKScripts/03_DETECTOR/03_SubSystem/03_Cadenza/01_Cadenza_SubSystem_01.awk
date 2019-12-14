#! /usr/bin/gawk
# 01_Cadenza_SubSystem_01.awk
# gawk.exe -f AWKScripts/03_DETECTOR/03_SubSystem/03_Cadenza/01_Cadenza_SubSystem_01.awk -v Number=Number

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
	Cnt = Number + 0;
	Cnt = int(Cnt);
	if(Cnt < 1){
		exit 99;
	}
	# 引数を100（件単位）で除算し、14.5秒（278秒を20で割った13.9秒にバッファ込みで14.5秒）を掛ける
	# xargsの-Pオプションで200、-nオプションで5を指定し、2,000件で4分38秒
	# 中途状況監視がなければ、もう少し処理が早くなる（2,000件で4分30秒）
	Quotient = Cnt / 100;
	Quotient = int(Quotient + 0.5);
	if(Quotient == 0){
		exit 1;
	}
	Sec_Base = Quotient * 14.5;
	# 四捨五入
	Sec_RoundOff = int(Sec_Base + 0.5);
	if(Sec_RoundOff < 60){
		# 1分未満
		RetEstimate = Pattern_01();
	} else if(Sec_RoundOff > 3599){
		# 1時間未満
		RetEstimate = Pattern_02();
	} else {
		RetEstimate = Pattern_03();
	}
	print RetEstimate;
}

# ------------------------------------------------------------------------------------------------------------------------

function Pattern_01(){
	if(length(Sec_RoundOff) == 1){
		Sec_RoundOff = "0"Sec_RoundOff;
	}
	return Sec_RoundOff"秒";
}

# ------------------------------------------------------------------------------------------------------------------------

function Pattern_02(){
	Hour = Sec_RoundOff / 3600;
	Hour = int(Hour);
	Sec_Quotient = Sec_RoundOff % 3600;
	Sec_Quotient = int(Sec_Quotient);
	Minute = Sec_Quotient / 60;
	Minute = int(Minute);
	Sec_Quotient_Deux = Sec_Quotient % 60;
	Sec_Quotient_Deux = int(Sec_Quotient_Deux);
	if(length(Hour) == 1){
		Hour = "0"Hour;
	}
	if(length(Minute) == 1){
		Minute = "0"Minute;
	}
	if(length(Sec_Quotient_Deux) == 1){
		Sec_Quotient_Deux = "0"Sec_Quotient_Deux;
	}
	return Hour"時間"Minute"分"Sec_Quotient_Deux"秒";
}

# ------------------------------------------------------------------------------------------------------------------------

function Pattern_03(){
	Minute = Sec_RoundOff / 60;
	Minute = int(Minute);
	Sec_Quotient = Sec_RoundOff % 60;
	Sec_Quotient = int(Sec_Quotient);
	if(length(Minute) == 1){
		Minute = "0"Minute;
	}
	if(length(Sec_Quotient) == 1){
		Sec_Quotient= "0"Sec_Quotient;
	}
	return Minute"分"Sec_Quotient"秒";
}

# ------------------------------------------------------------------------------------------------------------------------

