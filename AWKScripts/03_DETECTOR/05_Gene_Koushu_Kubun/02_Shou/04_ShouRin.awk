#! /usr/bin/gawk
# 04_ShouRin.awk
# Import : AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/02_Shou/04_ShouRin.awk

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

# 小学校_臨時
function GeneShouRin(){
	for(j in ShouRin){
		# 通常のケース（元号が1文字かつ年度にゼロパディングがない）
		Tex_ShouRin_01 = "";
		# 元号が2文字のケース
		Tex_ShouRin_02 = "";
		# 元号が1文字かつ年度にゼロパディングがあるケース
		Tex_ShouRin_03 = "";
		# 元号が2文字かつ年度にゼロパディングがあるケース
		Tex_ShouRin_04 = "";
		# 2カラム目、3カラム目のペアが「平」、「1」または「令」、「1」で、「平1」または「令1」を表現する
		Tex_ShouRin_05 = "";
		# 2カラム目、3カラム目のペアが「平」、「1」または「令」、「1」で、「平成1」または「令和1」を表現する
		Tex_ShouRin_06 = "";
		# 2カラム目、3カラム目のペアが「平」、「1」または「令」、「1」で、「平01」または「令01」を表現する
		Tex_ShouRin_07 = "";
		# 2カラム目、3カラム目のペアが「平」、「1」または「令」、「1」で、「平成01」または「令和01」を表現する
		Tex_ShouRin_08 = "";
		# 2カラム目、3カラム目のペアが「平」、「1」または「令」、「1」で、「平元」または「令元」を表現する
		Tex_ShouRin_09 = "";
		# 2カラム目、3カラム目のペアが「平」、「1」または「令」、「1」で、「平成元」または「令和元」を表現する
		Tex_ShouRin_10 = "";
		# 2カラム目、3カラム目のペアが「平」、「1」または「令」、「1」で、「昭64」または「平31」を表現する
		Tex_ShouRin_11 = "";
		# 2カラム目、3カラム目のペアが「平」、「1」または「令」、「1」で、「昭和64」または「平成31」を表現する
		Tex_ShouRin_12 = "";
		Tex_ShouRin_01 = ShouRin[j];
		Tex_ShouRin_02 = Tex_ShouRin_01;
		Tex_ShouRin_03 = Tex_ShouRin_01;
		Tex_ShouRin_04 = Tex_ShouRin_01;
		Tex_ShouRin_05 = Tex_ShouRin_01;
		Tex_ShouRin_06 = Tex_ShouRin_01;
		Tex_ShouRin_07 = Tex_ShouRin_01;
		Tex_ShouRin_08 = Tex_ShouRin_01;
		Tex_ShouRin_09 = Tex_ShouRin_01;
		Tex_ShouRin_10 = Tex_ShouRin_01;
		Tex_ShouRin_11 = Tex_ShouRin_01;
		Tex_ShouRin_12 = Tex_ShouRin_01;
		if($2 == "昭"){
			# 昭和の時点で、03以降の考慮は不要になる
			GeneShouRin_Showa();
		} else if($2 == "平"){
			GeneShouRin_Heisei();
		} else if($2 == "令"){
			GeneShouRin_Reiwa();
		}
	}
}

# ------------------------------------------------------------------------------------------------------------------------

function GeneShouRin_Showa(){
	# 昭和の時点で、03以降の考慮は不要になる
	Tex_ShouRin_03 = "";
	Tex_ShouRin_04 = Tex_ShouRin_03;
	Tex_ShouRin_05 = Tex_ShouRin_03;
	Tex_ShouRin_06 = Tex_ShouRin_03;
	Tex_ShouRin_07 = Tex_ShouRin_03;
	Tex_ShouRin_08 = Tex_ShouRin_03;
	Tex_ShouRin_09 = Tex_ShouRin_03;
	Tex_ShouRin_10 = Tex_ShouRin_03;
	Tex_ShouRin_11 = Tex_ShouRin_03;
	Tex_ShouRin_12 = Tex_ShouRin_03;
	gsub("<COL_02>","昭",Tex_ShouRin_01);
	gsub("<COL_02>","昭和",Tex_ShouRin_02);
	gsub("<COL_03>",$3,Tex_ShouRin_01);
	gsub("<COL_03>",$3,Tex_ShouRin_02);
	gsub("<COL_06>",$6,Tex_ShouRin_01);
	gsub("<COL_06>",$6,Tex_ShouRin_02);
	print Tex_ShouRin_01 > Fname;
	print Tex_ShouRin_02 > Fname;
}

# ------------------------------------------------------------------------------------------------------------------------

function GeneShouRin_Heisei(){
	len_ShouRin = length($3);
	if(len_ShouRin == 1){
		AddPadding_ShouRin = "0"$3;
		if($3 != 1){
			# 1以外の時点で、05以降の考慮は不要になる
			Tex_ShouRin_05 = "";
			Tex_ShouRin_06 = Tex_ShouRin_05;
			Tex_ShouRin_07 = Tex_ShouRin_05;
			Tex_ShouRin_08 = Tex_ShouRin_05;
			Tex_ShouRin_09 = Tex_ShouRin_05;
			Tex_ShouRin_10 = Tex_ShouRin_05;
			Tex_ShouRin_11 = Tex_ShouRin_05;
			Tex_ShouRin_12 = Tex_ShouRin_05;
			gsub("<COL_02>","平",Tex_ShouRin_01);
			gsub("<COL_02>","平成",Tex_ShouRin_02);
			Tex_ShouRin_03 = Tex_ShouRin_01;
			Tex_ShouRin_04 = Tex_ShouRin_02;
			gsub("<COL_03>",$3,Tex_ShouRin_01);
			gsub("<COL_03>",$3,Tex_ShouRin_02);
			gsub("<COL_03>",AddPadding_ShouRin,Tex_ShouRin_03);
			gsub("<COL_03>",AddPadding_ShouRin,Tex_ShouRin_04);
			gsub("<COL_06>",$6,Tex_ShouRin_01);
			gsub("<COL_06>",$6,Tex_ShouRin_02);
			gsub("<COL_06>",$6,Tex_ShouRin_03);
			gsub("<COL_06>",$6,Tex_ShouRin_04);
			print Tex_ShouRin_01 > Fname;
			print Tex_ShouRin_02 > Fname;
			print Tex_ShouRin_03 > Fname;
			print Tex_ShouRin_04 > Fname;
		} else {
			gsub("<COL_02>","平",Tex_ShouRin_01);
			Tex_ShouRin_03 = Tex_ShouRin_01;
			Tex_ShouRin_05 = Tex_ShouRin_01;
			Tex_ShouRin_07 = Tex_ShouRin_01;
			Tex_ShouRin_09 = Tex_ShouRin_01;
			gsub("<COL_03>",$3,Tex_ShouRin_01);
			gsub("<COL_06>",$6,Tex_ShouRin_01);
			gsub("<COL_02>","平成",Tex_ShouRin_02);
			Tex_ShouRin_04 = Tex_ShouRin_02;
			Tex_ShouRin_06 = Tex_ShouRin_02;
			Tex_ShouRin_08 = Tex_ShouRin_02;
			Tex_ShouRin_10 = Tex_ShouRin_02;
			gsub("<COL_03>",$3,Tex_ShouRin_02);
			gsub("<COL_06>",$6,Tex_ShouRin_02);
			gsub("<COL_03>",AddPadding_ShouRin,Tex_ShouRin_03);
			gsub("<COL_06>",$6,Tex_ShouRin_03);
			gsub("<COL_03>",AddPadding_ShouRin,Tex_ShouRin_04);
			gsub("<COL_06>",$6,Tex_ShouRin_04);
			gsub("<COL_03>",$3,Tex_ShouRin_05);
			gsub("<COL_06>",$6,Tex_ShouRin_05);
			gsub("<COL_03>",$3,Tex_ShouRin_06);
			gsub("<COL_06>",$6,Tex_ShouRin_06);
			gsub("<COL_03>",AddPadding_ShouRin,Tex_ShouRin_07);
			gsub("<COL_06>",$6,Tex_ShouRin_07);
			gsub("<COL_03>",AddPadding_ShouRin,Tex_ShouRin_08);
			gsub("<COL_06>",$6,Tex_ShouRin_08);
			gsub("<COL_03>","元",Tex_ShouRin_09);
			gsub("<COL_06>",$6,Tex_ShouRin_09);
			gsub("<COL_03>","元",Tex_ShouRin_10);
			gsub("<COL_06>",$6,Tex_ShouRin_10);
			gsub("<COL_02>","昭",Tex_ShouRin_11);
			gsub("<COL_03>","64",Tex_ShouRin_11);
			gsub("<COL_06>",$6,Tex_ShouRin_11);
			gsub("<COL_02>","昭和",Tex_ShouRin_12);
			gsub("<COL_03>","64",Tex_ShouRin_12);
			gsub("<COL_06>",$6,Tex_ShouRin_12);
			print Tex_ShouRin_01 > Fname;
			print Tex_ShouRin_02 > Fname;
			print Tex_ShouRin_03 > Fname;
			print Tex_ShouRin_04 > Fname;
			print Tex_ShouRin_05 > Fname;
			print Tex_ShouRin_06 > Fname;
			print Tex_ShouRin_07 > Fname;
			print Tex_ShouRin_08 > Fname;
			print Tex_ShouRin_09 > Fname;
			print Tex_ShouRin_10 > Fname;
			print Tex_ShouRin_11 > Fname;
			print Tex_ShouRin_12 > Fname;
		}
	} else {
		# 2桁の時点で、03以降の考慮は不要になる
		Tex_ShouRin_03 = "";
		Tex_ShouRin_04 = Tex_ShouRin_03;
		Tex_ShouRin_05 = Tex_ShouRin_03;
		Tex_ShouRin_06 = Tex_ShouRin_03;
		Tex_ShouRin_07 = Tex_ShouRin_03;
		Tex_ShouRin_08 = Tex_ShouRin_03;
		Tex_ShouRin_09 = Tex_ShouRin_03;
		Tex_ShouRin_10 = Tex_ShouRin_03;
		Tex_ShouRin_11 = Tex_ShouRin_03;
		Tex_ShouRin_12 = Tex_ShouRin_03;
		gsub("<COL_02>","平",Tex_ShouRin_01);
		gsub("<COL_02>","平成",Tex_ShouRin_02);
		gsub("<COL_03>",$3,Tex_ShouRin_01);
		gsub("<COL_03>",$3,Tex_ShouRin_02);
		gsub("<COL_06>",$6,Tex_ShouRin_01);
		gsub("<COL_06>",$6,Tex_ShouRin_02);
		print Tex_ShouRin_01 > Fname;
		print Tex_ShouRin_02 > Fname;
	}
}

# ------------------------------------------------------------------------------------------------------------------------

function GeneShouRin_Reiwa(){
	len_ShouRin = length($3);
	if(len_ShouRin == 1){
		AddPadding_ShouRin = "0"$3;
		if($3 != 1){
			# 1以外の時点で、05以降の考慮は不要になる
			Tex_ShouRin_05 = "";
			Tex_ShouRin_06 = Tex_ShouRin_05;
			Tex_ShouRin_07 = Tex_ShouRin_05;
			Tex_ShouRin_08 = Tex_ShouRin_05;
			Tex_ShouRin_09 = Tex_ShouRin_05;
			Tex_ShouRin_10 = Tex_ShouRin_05;
			Tex_ShouRin_11 = Tex_ShouRin_05;
			Tex_ShouRin_12 = Tex_ShouRin_05;
			gsub("<COL_02>","令",Tex_ShouRin_01);
			gsub("<COL_02>","令和",Tex_ShouRin_02);
			Tex_ShouRin_03 = Tex_ShouRin_01;
			Tex_ShouRin_04 = Tex_ShouRin_02;
			gsub("<COL_03>",$3,Tex_ShouRin_01);
			gsub("<COL_03>",$3,Tex_ShouRin_02);
			gsub("<COL_03>",AddPadding_ShouRin,Tex_ShouRin_03);
			gsub("<COL_03>",AddPadding_ShouRin,Tex_ShouRin_04);
			gsub("<COL_06>",$6,Tex_ShouRin_01);
			gsub("<COL_06>",$6,Tex_ShouRin_02);
			gsub("<COL_06>",$6,Tex_ShouRin_03);
			gsub("<COL_06>",$6,Tex_ShouRin_04);
			print Tex_ShouRin_01 > Fname;
			print Tex_ShouRin_02 > Fname;
			print Tex_ShouRin_03 > Fname;
			print Tex_ShouRin_04 > Fname;
		} else {
			gsub("<COL_02>","令",Tex_ShouRin_01);
			Tex_ShouRin_03 = Tex_ShouRin_01;
			Tex_ShouRin_05 = Tex_ShouRin_01;
			Tex_ShouRin_07 = Tex_ShouRin_01;
			Tex_ShouRin_09 = Tex_ShouRin_01;
			gsub("<COL_03>",$3,Tex_ShouRin_01);
			gsub("<COL_06>",$6,Tex_ShouRin_01);
			gsub("<COL_02>","令和",Tex_ShouRin_02);
			Tex_ShouRin_04 = Tex_ShouRin_02;
			Tex_ShouRin_06 = Tex_ShouRin_02;
			Tex_ShouRin_08 = Tex_ShouRin_02;
			Tex_ShouRin_10 = Tex_ShouRin_02;
			gsub("<COL_03>",$3,Tex_ShouRin_02);
			gsub("<COL_06>",$6,Tex_ShouRin_02);
			gsub("<COL_03>",AddPadding_ShouRin,Tex_ShouRin_03);
			gsub("<COL_06>",$6,Tex_ShouRin_03);
			gsub("<COL_03>",AddPadding_ShouRin,Tex_ShouRin_04);
			gsub("<COL_06>",$6,Tex_ShouRin_04);
			gsub("<COL_03>",$3,Tex_ShouRin_05);
			gsub("<COL_06>",$6,Tex_ShouRin_05);
			gsub("<COL_03>",$3,Tex_ShouRin_06);
			gsub("<COL_06>",$6,Tex_ShouRin_06);
			gsub("<COL_03>",AddPadding_ShouRin,Tex_ShouRin_07);
			gsub("<COL_06>",$6,Tex_ShouRin_07);
			gsub("<COL_03>",AddPadding_ShouRin,Tex_ShouRin_08);
			gsub("<COL_06>",$6,Tex_ShouRin_08);
			gsub("<COL_03>","元",Tex_ShouRin_09);
			gsub("<COL_06>",$6,Tex_ShouRin_09);
			gsub("<COL_03>","元",Tex_ShouRin_10);
			gsub("<COL_06>",$6,Tex_ShouRin_10);
			gsub("<COL_02>","平",Tex_ShouRin_11);
			gsub("<COL_03>","31",Tex_ShouRin_11);
			gsub("<COL_06>",$6,Tex_ShouRin_11);
			gsub("<COL_02>","平成",Tex_ShouRin_12);
			gsub("<COL_03>","31",Tex_ShouRin_12);
			gsub("<COL_06>",$6,Tex_ShouRin_12);
			print Tex_ShouRin_01 > Fname;
			print Tex_ShouRin_02 > Fname;
			print Tex_ShouRin_03 > Fname;
			print Tex_ShouRin_04 > Fname;
			print Tex_ShouRin_05 > Fname;
			print Tex_ShouRin_06 > Fname;
			print Tex_ShouRin_07 > Fname;
			print Tex_ShouRin_08 > Fname;
			print Tex_ShouRin_09 > Fname;
			print Tex_ShouRin_10 > Fname;
			print Tex_ShouRin_11 > Fname;
			print Tex_ShouRin_12 > Fname;
		}
	} else {
		# 2桁の時点で、03以降の考慮は不要になる
		Tex_ShouRin_03 = "";
		Tex_ShouRin_04 = Tex_ShouRin_03;
		Tex_ShouRin_05 = Tex_ShouRin_03;
		Tex_ShouRin_06 = Tex_ShouRin_03;
		Tex_ShouRin_07 = Tex_ShouRin_03;
		Tex_ShouRin_08 = Tex_ShouRin_03;
		Tex_ShouRin_09 = Tex_ShouRin_03;
		Tex_ShouRin_10 = Tex_ShouRin_03;
		Tex_ShouRin_11 = Tex_ShouRin_03;
		Tex_ShouRin_12 = Tex_ShouRin_03;
		gsub("<COL_02>","令",Tex_ShouRin_01);
		gsub("<COL_02>","令和",Tex_ShouRin_02);
		gsub("<COL_03>",$3,Tex_ShouRin_01);
		gsub("<COL_03>",$3,Tex_ShouRin_02);
		gsub("<COL_06>",$6,Tex_ShouRin_01);
		gsub("<COL_06>",$6,Tex_ShouRin_02);
		print Tex_ShouRin_01 > Fname;
		print Tex_ShouRin_02 > Fname;
	}
}

# ------------------------------------------------------------------------------------------------------------------------

