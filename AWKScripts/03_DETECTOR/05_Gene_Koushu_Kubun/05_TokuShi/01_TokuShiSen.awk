#! /usr/bin/gawk
# 01_TokuShiSen.awk
# Import : AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/05_TokuShi/01_TokuShiSen.awk

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

# 特別支援学校_専修
function GeneTokuShiSen(){
	for(j in TokuShiSen){
		# 通常のケース（元号が1文字かつ年度にゼロパディングがない）
		Tex_TokuShiSen_01 = "";
		# 元号が2文字のケース
		Tex_TokuShiSen_02 = "";
		# 元号が1文字かつ年度にゼロパディングがあるケース
		Tex_TokuShiSen_03 = "";
		# 元号が2文字かつ年度にゼロパディングがあるケース
		Tex_TokuShiSen_04 = "";
		# 2カラム目、3カラム目のペアが「平」、「1」または「令」、「1」で、「平1」または「令1」を表現する
		Tex_TokuShiSen_05 = "";
		# 2カラム目、3カラム目のペアが「平」、「1」または「令」、「1」で、「平成1」または「令和1」を表現する
		Tex_TokuShiSen_06 = "";
		# 2カラム目、3カラム目のペアが「平」、「1」または「令」、「1」で、「平01」または「令01」を表現する
		Tex_TokuShiSen_07 = "";
		# 2カラム目、3カラム目のペアが「平」、「1」または「令」、「1」で、「平成01」または「令和01」を表現する
		Tex_TokuShiSen_08 = "";
		# 2カラム目、3カラム目のペアが「平」、「1」または「令」、「1」で、「平元」または「令元」を表現する
		Tex_TokuShiSen_09 = "";
		# 2カラム目、3カラム目のペアが「平」、「1」または「令」、「1」で、「平成元」または「令和元」を表現する
		Tex_TokuShiSen_10 = "";
		# 2カラム目、3カラム目のペアが「平」、「1」または「令」、「1」で、「昭64」または「平31」を表現する
		Tex_TokuShiSen_11 = "";
		# 2カラム目、3カラム目のペアが「平」、「1」または「令」、「1」で、「昭和64」または「平成31」を表現する
		Tex_TokuShiSen_12 = "";
		Tex_TokuShiSen_01 = TokuShiSen[j];
		Tex_TokuShiSen_02 = Tex_TokuShiSen_01;
		Tex_TokuShiSen_03 = Tex_TokuShiSen_01;
		Tex_TokuShiSen_04 = Tex_TokuShiSen_01;
		Tex_TokuShiSen_05 = Tex_TokuShiSen_01;
		Tex_TokuShiSen_06 = Tex_TokuShiSen_01;
		Tex_TokuShiSen_07 = Tex_TokuShiSen_01;
		Tex_TokuShiSen_08 = Tex_TokuShiSen_01;
		Tex_TokuShiSen_09 = Tex_TokuShiSen_01;
		Tex_TokuShiSen_10 = Tex_TokuShiSen_01;
		Tex_TokuShiSen_11 = Tex_TokuShiSen_01;
		Tex_TokuShiSen_12 = Tex_TokuShiSen_01;
		if($2 == "昭"){
			# 昭和の時点で、03以降の考慮は不要になる
			GeneTokuShiSen_Showa();
		} else if($2 == "平"){
			GeneTokuShiSen_Heisei();
		} else if($2 == "令"){
			GeneTokuShiSen_Reiwa();
		}
	}
}

# ------------------------------------------------------------------------------------------------------------------------

function GeneTokuShiSen_Showa(){
	# 昭和の時点で、03以降の考慮は不要になる
	Tex_TokuShiSen_03 = "";
	Tex_TokuShiSen_04 = Tex_TokuShiSen_03;
	Tex_TokuShiSen_05 = Tex_TokuShiSen_03;
	Tex_TokuShiSen_06 = Tex_TokuShiSen_03;
	Tex_TokuShiSen_07 = Tex_TokuShiSen_03;
	Tex_TokuShiSen_08 = Tex_TokuShiSen_03;
	Tex_TokuShiSen_09 = Tex_TokuShiSen_03;
	Tex_TokuShiSen_10 = Tex_TokuShiSen_03;
	Tex_TokuShiSen_11 = Tex_TokuShiSen_03;
	Tex_TokuShiSen_12 = Tex_TokuShiSen_03;
	gsub("<COL_02>","昭",Tex_TokuShiSen_01);
	gsub("<COL_02>","昭和",Tex_TokuShiSen_02);
	gsub("<COL_03>",$3,Tex_TokuShiSen_01);
	gsub("<COL_03>",$3,Tex_TokuShiSen_02);
	gsub("<COL_06>",$6,Tex_TokuShiSen_01);
	gsub("<COL_06>",$6,Tex_TokuShiSen_02);
	print Tex_TokuShiSen_01 > Fname;
	print Tex_TokuShiSen_02 > Fname;
}

# ------------------------------------------------------------------------------------------------------------------------

function GeneTokuShiSen_Heisei(){
	len_TokuShiSen = length($3);
	if(len_TokuShiSen == 1){
		AddPadding_TokuShiSen = "0"$3;
		if($3 != 1){
			# 1以外の時点で、05以降の考慮は不要になる
			Tex_TokuShiSen_05 = "";
			Tex_TokuShiSen_06 = Tex_TokuShiSen_05;
			Tex_TokuShiSen_07 = Tex_TokuShiSen_05;
			Tex_TokuShiSen_08 = Tex_TokuShiSen_05;
			Tex_TokuShiSen_09 = Tex_TokuShiSen_05;
			Tex_TokuShiSen_10 = Tex_TokuShiSen_05;
			Tex_TokuShiSen_11 = Tex_TokuShiSen_05;
			Tex_TokuShiSen_12 = Tex_TokuShiSen_05;
			gsub("<COL_02>","平",Tex_TokuShiSen_01);
			gsub("<COL_02>","平成",Tex_TokuShiSen_02);
			Tex_TokuShiSen_03 = Tex_TokuShiSen_01;
			Tex_TokuShiSen_04 = Tex_TokuShiSen_02;
			gsub("<COL_03>",$3,Tex_TokuShiSen_01);
			gsub("<COL_03>",$3,Tex_TokuShiSen_02);
			gsub("<COL_03>",AddPadding_TokuShiSen,Tex_TokuShiSen_03);
			gsub("<COL_03>",AddPadding_TokuShiSen,Tex_TokuShiSen_04);
			gsub("<COL_06>",$6,Tex_TokuShiSen_01);
			gsub("<COL_06>",$6,Tex_TokuShiSen_02);
			gsub("<COL_06>",$6,Tex_TokuShiSen_03);
			gsub("<COL_06>",$6,Tex_TokuShiSen_04);
			print Tex_TokuShiSen_01 > Fname;
			print Tex_TokuShiSen_02 > Fname;
			print Tex_TokuShiSen_03 > Fname;
			print Tex_TokuShiSen_04 > Fname;
		} else {
			gsub("<COL_02>","平",Tex_TokuShiSen_01);
			Tex_TokuShiSen_03 = Tex_TokuShiSen_01;
			Tex_TokuShiSen_05 = Tex_TokuShiSen_01;
			Tex_TokuShiSen_07 = Tex_TokuShiSen_01;
			Tex_TokuShiSen_09 = Tex_TokuShiSen_01;
			gsub("<COL_03>",$3,Tex_TokuShiSen_01);
			gsub("<COL_06>",$6,Tex_TokuShiSen_01);
			gsub("<COL_02>","平成",Tex_TokuShiSen_02);
			Tex_TokuShiSen_04 = Tex_TokuShiSen_02;
			Tex_TokuShiSen_06 = Tex_TokuShiSen_02;
			Tex_TokuShiSen_08 = Tex_TokuShiSen_02;
			Tex_TokuShiSen_10 = Tex_TokuShiSen_02;
			gsub("<COL_03>",$3,Tex_TokuShiSen_02);
			gsub("<COL_06>",$6,Tex_TokuShiSen_02);
			gsub("<COL_03>",AddPadding_TokuShiSen,Tex_TokuShiSen_03);
			gsub("<COL_06>",$6,Tex_TokuShiSen_03);
			gsub("<COL_03>",AddPadding_TokuShiSen,Tex_TokuShiSen_04);
			gsub("<COL_06>",$6,Tex_TokuShiSen_04);
			gsub("<COL_03>",$3,Tex_TokuShiSen_05);
			gsub("<COL_06>",$6,Tex_TokuShiSen_05);
			gsub("<COL_03>",$3,Tex_TokuShiSen_06);
			gsub("<COL_06>",$6,Tex_TokuShiSen_06);
			gsub("<COL_03>",AddPadding_TokuShiSen,Tex_TokuShiSen_07);
			gsub("<COL_06>",$6,Tex_TokuShiSen_07);
			gsub("<COL_03>",AddPadding_TokuShiSen,Tex_TokuShiSen_08);
			gsub("<COL_06>",$6,Tex_TokuShiSen_08);
			gsub("<COL_03>","元",Tex_TokuShiSen_09);
			gsub("<COL_06>",$6,Tex_TokuShiSen_09);
			gsub("<COL_03>","元",Tex_TokuShiSen_10);
			gsub("<COL_06>",$6,Tex_TokuShiSen_10);
			gsub("<COL_02>","昭",Tex_TokuShiSen_11);
			gsub("<COL_03>","64",Tex_TokuShiSen_11);
			gsub("<COL_06>",$6,Tex_TokuShiSen_11);
			gsub("<COL_02>","昭和",Tex_TokuShiSen_12);
			gsub("<COL_03>","64",Tex_TokuShiSen_12);
			gsub("<COL_06>",$6,Tex_TokuShiSen_12);
			print Tex_TokuShiSen_01 > Fname;
			print Tex_TokuShiSen_02 > Fname;
			print Tex_TokuShiSen_03 > Fname;
			print Tex_TokuShiSen_04 > Fname;
			print Tex_TokuShiSen_05 > Fname;
			print Tex_TokuShiSen_06 > Fname;
			print Tex_TokuShiSen_07 > Fname;
			print Tex_TokuShiSen_08 > Fname;
			print Tex_TokuShiSen_09 > Fname;
			print Tex_TokuShiSen_10 > Fname;
			print Tex_TokuShiSen_11 > Fname;
			print Tex_TokuShiSen_12 > Fname;
		}
	} else {
		# 2桁の時点で、03以降の考慮は不要になる
		Tex_TokuShiSen_03 = "";
		Tex_TokuShiSen_04 = Tex_TokuShiSen_03;
		Tex_TokuShiSen_05 = Tex_TokuShiSen_03;
		Tex_TokuShiSen_06 = Tex_TokuShiSen_03;
		Tex_TokuShiSen_07 = Tex_TokuShiSen_03;
		Tex_TokuShiSen_08 = Tex_TokuShiSen_03;
		Tex_TokuShiSen_09 = Tex_TokuShiSen_03;
		Tex_TokuShiSen_10 = Tex_TokuShiSen_03;
		Tex_TokuShiSen_11 = Tex_TokuShiSen_03;
		Tex_TokuShiSen_12 = Tex_TokuShiSen_03;
		gsub("<COL_02>","平",Tex_TokuShiSen_01);
		gsub("<COL_02>","平成",Tex_TokuShiSen_02);
		gsub("<COL_03>",$3,Tex_TokuShiSen_01);
		gsub("<COL_03>",$3,Tex_TokuShiSen_02);
		gsub("<COL_06>",$6,Tex_TokuShiSen_01);
		gsub("<COL_06>",$6,Tex_TokuShiSen_02);
		print Tex_TokuShiSen_01 > Fname;
		print Tex_TokuShiSen_02 > Fname;
	}
}

# ------------------------------------------------------------------------------------------------------------------------

function GeneTokuShiSen_Reiwa(){
	len_TokuShiSen = length($3);
	if(len_TokuShiSen == 1){
		AddPadding_TokuShiSen = "0"$3;
		if($3 != 1){
			# 1以外の時点で、05以降の考慮は不要になる
			Tex_TokuShiSen_05 = "";
			Tex_TokuShiSen_06 = Tex_TokuShiSen_05;
			Tex_TokuShiSen_07 = Tex_TokuShiSen_05;
			Tex_TokuShiSen_08 = Tex_TokuShiSen_05;
			Tex_TokuShiSen_09 = Tex_TokuShiSen_05;
			Tex_TokuShiSen_10 = Tex_TokuShiSen_05;
			Tex_TokuShiSen_11 = Tex_TokuShiSen_05;
			Tex_TokuShiSen_12 = Tex_TokuShiSen_05;
			gsub("<COL_02>","令",Tex_TokuShiSen_01);
			gsub("<COL_02>","令和",Tex_TokuShiSen_02);
			Tex_TokuShiSen_03 = Tex_TokuShiSen_01;
			Tex_TokuShiSen_04 = Tex_TokuShiSen_02;
			gsub("<COL_03>",$3,Tex_TokuShiSen_01);
			gsub("<COL_03>",$3,Tex_TokuShiSen_02);
			gsub("<COL_03>",AddPadding_TokuShiSen,Tex_TokuShiSen_03);
			gsub("<COL_03>",AddPadding_TokuShiSen,Tex_TokuShiSen_04);
			gsub("<COL_06>",$6,Tex_TokuShiSen_01);
			gsub("<COL_06>",$6,Tex_TokuShiSen_02);
			gsub("<COL_06>",$6,Tex_TokuShiSen_03);
			gsub("<COL_06>",$6,Tex_TokuShiSen_04);
			print Tex_TokuShiSen_01 > Fname;
			print Tex_TokuShiSen_02 > Fname;
			print Tex_TokuShiSen_03 > Fname;
			print Tex_TokuShiSen_04 > Fname;
		} else {
			gsub("<COL_02>","令",Tex_TokuShiSen_01);
			Tex_TokuShiSen_03 = Tex_TokuShiSen_01;
			Tex_TokuShiSen_05 = Tex_TokuShiSen_01;
			Tex_TokuShiSen_07 = Tex_TokuShiSen_01;
			Tex_TokuShiSen_09 = Tex_TokuShiSen_01;
			gsub("<COL_03>",$3,Tex_TokuShiSen_01);
			gsub("<COL_06>",$6,Tex_TokuShiSen_01);
			gsub("<COL_02>","令和",Tex_TokuShiSen_02);
			Tex_TokuShiSen_04 = Tex_TokuShiSen_02;
			Tex_TokuShiSen_06 = Tex_TokuShiSen_02;
			Tex_TokuShiSen_08 = Tex_TokuShiSen_02;
			Tex_TokuShiSen_10 = Tex_TokuShiSen_02;
			gsub("<COL_03>",$3,Tex_TokuShiSen_02);
			gsub("<COL_06>",$6,Tex_TokuShiSen_02);
			gsub("<COL_03>",AddPadding_TokuShiSen,Tex_TokuShiSen_03);
			gsub("<COL_06>",$6,Tex_TokuShiSen_03);
			gsub("<COL_03>",AddPadding_TokuShiSen,Tex_TokuShiSen_04);
			gsub("<COL_06>",$6,Tex_TokuShiSen_04);
			gsub("<COL_03>",$3,Tex_TokuShiSen_05);
			gsub("<COL_06>",$6,Tex_TokuShiSen_05);
			gsub("<COL_03>",$3,Tex_TokuShiSen_06);
			gsub("<COL_06>",$6,Tex_TokuShiSen_06);
			gsub("<COL_03>",AddPadding_TokuShiSen,Tex_TokuShiSen_07);
			gsub("<COL_06>",$6,Tex_TokuShiSen_07);
			gsub("<COL_03>",AddPadding_TokuShiSen,Tex_TokuShiSen_08);
			gsub("<COL_06>",$6,Tex_TokuShiSen_08);
			gsub("<COL_03>","元",Tex_TokuShiSen_09);
			gsub("<COL_06>",$6,Tex_TokuShiSen_09);
			gsub("<COL_03>","元",Tex_TokuShiSen_10);
			gsub("<COL_06>",$6,Tex_TokuShiSen_10);
			gsub("<COL_02>","平",Tex_TokuShiSen_11);
			gsub("<COL_03>","31",Tex_TokuShiSen_11);
			gsub("<COL_06>",$6,Tex_TokuShiSen_11);
			gsub("<COL_02>","平成",Tex_TokuShiSen_12);
			gsub("<COL_03>","31",Tex_TokuShiSen_12);
			gsub("<COL_06>",$6,Tex_TokuShiSen_12);
			print Tex_TokuShiSen_01 > Fname;
			print Tex_TokuShiSen_02 > Fname;
			print Tex_TokuShiSen_03 > Fname;
			print Tex_TokuShiSen_04 > Fname;
			print Tex_TokuShiSen_05 > Fname;
			print Tex_TokuShiSen_06 > Fname;
			print Tex_TokuShiSen_07 > Fname;
			print Tex_TokuShiSen_08 > Fname;
			print Tex_TokuShiSen_09 > Fname;
			print Tex_TokuShiSen_10 > Fname;
			print Tex_TokuShiSen_11 > Fname;
			print Tex_TokuShiSen_12 > Fname;
		}
	} else {
		# 2桁の時点で、03以降の考慮は不要になる
		Tex_TokuShiSen_03 = "";
		Tex_TokuShiSen_04 = Tex_TokuShiSen_03;
		Tex_TokuShiSen_05 = Tex_TokuShiSen_03;
		Tex_TokuShiSen_06 = Tex_TokuShiSen_03;
		Tex_TokuShiSen_07 = Tex_TokuShiSen_03;
		Tex_TokuShiSen_08 = Tex_TokuShiSen_03;
		Tex_TokuShiSen_09 = Tex_TokuShiSen_03;
		Tex_TokuShiSen_10 = Tex_TokuShiSen_03;
		Tex_TokuShiSen_11 = Tex_TokuShiSen_03;
		Tex_TokuShiSen_12 = Tex_TokuShiSen_03;
		gsub("<COL_02>","令",Tex_TokuShiSen_01);
		gsub("<COL_02>","令和",Tex_TokuShiSen_02);
		gsub("<COL_03>",$3,Tex_TokuShiSen_01);
		gsub("<COL_03>",$3,Tex_TokuShiSen_02);
		gsub("<COL_06>",$6,Tex_TokuShiSen_01);
		gsub("<COL_06>",$6,Tex_TokuShiSen_02);
		print Tex_TokuShiSen_01 > Fname;
		print Tex_TokuShiSen_02 > Fname;
	}
}

# ------------------------------------------------------------------------------------------------------------------------

