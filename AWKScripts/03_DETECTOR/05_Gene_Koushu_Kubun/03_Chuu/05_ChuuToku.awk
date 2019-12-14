#! /usr/bin/gawk
# 05_ChuuToku.awk
# Import : AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/03_Chuu/05_ChuuToku.awk

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

# 中学校_特別
function GeneChuuToku(){
	for(j in ChuuToku){
		# 通常のケース（元号が1文字かつ年度にゼロパディングがない）
		Tex_ChuuToku_01 = "";
		# 元号が2文字のケース
		Tex_ChuuToku_02 = "";
		# 元号が1文字かつ年度にゼロパディングがあるケース
		Tex_ChuuToku_03 = "";
		# 元号が2文字かつ年度にゼロパディングがあるケース
		Tex_ChuuToku_04 = "";
		# 2カラム目、3カラム目のペアが「平」、「1」または「令」、「1」で、「平1」または「令1」を表現する
		Tex_ChuuToku_05 = "";
		# 2カラム目、3カラム目のペアが「平」、「1」または「令」、「1」で、「平成1」または「令和1」を表現する
		Tex_ChuuToku_06 = "";
		# 2カラム目、3カラム目のペアが「平」、「1」または「令」、「1」で、「平01」または「令01」を表現する
		Tex_ChuuToku_07 = "";
		# 2カラム目、3カラム目のペアが「平」、「1」または「令」、「1」で、「平成01」または「令和01」を表現する
		Tex_ChuuToku_08 = "";
		# 2カラム目、3カラム目のペアが「平」、「1」または「令」、「1」で、「平元」または「令元」を表現する
		Tex_ChuuToku_09 = "";
		# 2カラム目、3カラム目のペアが「平」、「1」または「令」、「1」で、「平成元」または「令和元」を表現する
		Tex_ChuuToku_10 = "";
		# 2カラム目、3カラム目のペアが「平」、「1」または「令」、「1」で、「昭64」または「平31」を表現する
		Tex_ChuuToku_11 = "";
		# 2カラム目、3カラム目のペアが「平」、「1」または「令」、「1」で、「昭和64」または「平成31」を表現する
		Tex_ChuuToku_12 = "";
		Tex_ChuuToku_01 = ChuuToku[j];
		Tex_ChuuToku_02 = Tex_ChuuToku_01;
		Tex_ChuuToku_03 = Tex_ChuuToku_01;
		Tex_ChuuToku_04 = Tex_ChuuToku_01;
		Tex_ChuuToku_05 = Tex_ChuuToku_01;
		Tex_ChuuToku_06 = Tex_ChuuToku_01;
		Tex_ChuuToku_07 = Tex_ChuuToku_01;
		Tex_ChuuToku_08 = Tex_ChuuToku_01;
		Tex_ChuuToku_09 = Tex_ChuuToku_01;
		Tex_ChuuToku_10 = Tex_ChuuToku_01;
		Tex_ChuuToku_11 = Tex_ChuuToku_01;
		Tex_ChuuToku_12 = Tex_ChuuToku_01;
		if($2 == "昭"){
			# 昭和の時点で、03以降の考慮は不要になる
			GeneChuuToku_Showa();
		} else if($2 == "平"){
			GeneChuuToku_Heisei();
		} else if($2 == "令"){
			GeneChuuToku_Reiwa();
		}
	}
}

# ------------------------------------------------------------------------------------------------------------------------

function GeneChuuToku_Showa(){
	# 昭和の時点で、03以降の考慮は不要になる
	Tex_ChuuToku_03 = "";
	Tex_ChuuToku_04 = Tex_ChuuToku_03;
	Tex_ChuuToku_05 = Tex_ChuuToku_03;
	Tex_ChuuToku_06 = Tex_ChuuToku_03;
	Tex_ChuuToku_07 = Tex_ChuuToku_03;
	Tex_ChuuToku_08 = Tex_ChuuToku_03;
	Tex_ChuuToku_09 = Tex_ChuuToku_03;
	Tex_ChuuToku_10 = Tex_ChuuToku_03;
	Tex_ChuuToku_11 = Tex_ChuuToku_03;
	Tex_ChuuToku_12 = Tex_ChuuToku_03;
	gsub("<COL_02>","昭",Tex_ChuuToku_01);
	gsub("<COL_02>","昭和",Tex_ChuuToku_02);
	gsub("<COL_03>",$3,Tex_ChuuToku_01);
	gsub("<COL_03>",$3,Tex_ChuuToku_02);
	gsub("<COL_06>",$6,Tex_ChuuToku_01);
	gsub("<COL_06>",$6,Tex_ChuuToku_02);
	print Tex_ChuuToku_01 > Fname;
	print Tex_ChuuToku_02 > Fname;
}

# ------------------------------------------------------------------------------------------------------------------------

function GeneChuuToku_Heisei(){
	len_ChuuToku = length($3);
	if(len_ChuuToku == 1){
		AddPadding_ChuuToku = "0"$3;
		if($3 != 1){
			# 1以外の時点で、05以降の考慮は不要になる
			Tex_ChuuToku_05 = "";
			Tex_ChuuToku_06 = Tex_ChuuToku_05;
			Tex_ChuuToku_07 = Tex_ChuuToku_05;
			Tex_ChuuToku_08 = Tex_ChuuToku_05;
			Tex_ChuuToku_09 = Tex_ChuuToku_05;
			Tex_ChuuToku_10 = Tex_ChuuToku_05;
			Tex_ChuuToku_11 = Tex_ChuuToku_05;
			Tex_ChuuToku_12 = Tex_ChuuToku_05;
			gsub("<COL_02>","平",Tex_ChuuToku_01);
			gsub("<COL_02>","平成",Tex_ChuuToku_02);
			Tex_ChuuToku_03 = Tex_ChuuToku_01;
			Tex_ChuuToku_04 = Tex_ChuuToku_02;
			gsub("<COL_03>",$3,Tex_ChuuToku_01);
			gsub("<COL_03>",$3,Tex_ChuuToku_02);
			gsub("<COL_03>",AddPadding_ChuuToku,Tex_ChuuToku_03);
			gsub("<COL_03>",AddPadding_ChuuToku,Tex_ChuuToku_04);
			gsub("<COL_06>",$6,Tex_ChuuToku_01);
			gsub("<COL_06>",$6,Tex_ChuuToku_02);
			gsub("<COL_06>",$6,Tex_ChuuToku_03);
			gsub("<COL_06>",$6,Tex_ChuuToku_04);
			print Tex_ChuuToku_01 > Fname;
			print Tex_ChuuToku_02 > Fname;
			print Tex_ChuuToku_03 > Fname;
			print Tex_ChuuToku_04 > Fname;
		} else {
			gsub("<COL_02>","平",Tex_ChuuToku_01);
			Tex_ChuuToku_03 = Tex_ChuuToku_01;
			Tex_ChuuToku_05 = Tex_ChuuToku_01;
			Tex_ChuuToku_07 = Tex_ChuuToku_01;
			Tex_ChuuToku_09 = Tex_ChuuToku_01;
			gsub("<COL_03>",$3,Tex_ChuuToku_01);
			gsub("<COL_06>",$6,Tex_ChuuToku_01);
			gsub("<COL_02>","平成",Tex_ChuuToku_02);
			Tex_ChuuToku_04 = Tex_ChuuToku_02;
			Tex_ChuuToku_06 = Tex_ChuuToku_02;
			Tex_ChuuToku_08 = Tex_ChuuToku_02;
			Tex_ChuuToku_10 = Tex_ChuuToku_02;
			gsub("<COL_03>",$3,Tex_ChuuToku_02);
			gsub("<COL_06>",$6,Tex_ChuuToku_02);
			gsub("<COL_03>",AddPadding_ChuuToku,Tex_ChuuToku_03);
			gsub("<COL_06>",$6,Tex_ChuuToku_03);
			gsub("<COL_03>",AddPadding_ChuuToku,Tex_ChuuToku_04);
			gsub("<COL_06>",$6,Tex_ChuuToku_04);
			gsub("<COL_03>",$3,Tex_ChuuToku_05);
			gsub("<COL_06>",$6,Tex_ChuuToku_05);
			gsub("<COL_03>",$3,Tex_ChuuToku_06);
			gsub("<COL_06>",$6,Tex_ChuuToku_06);
			gsub("<COL_03>",AddPadding_ChuuToku,Tex_ChuuToku_07);
			gsub("<COL_06>",$6,Tex_ChuuToku_07);
			gsub("<COL_03>",AddPadding_ChuuToku,Tex_ChuuToku_08);
			gsub("<COL_06>",$6,Tex_ChuuToku_08);
			gsub("<COL_03>","元",Tex_ChuuToku_09);
			gsub("<COL_06>",$6,Tex_ChuuToku_09);
			gsub("<COL_03>","元",Tex_ChuuToku_10);
			gsub("<COL_06>",$6,Tex_ChuuToku_10);
			gsub("<COL_02>","昭",Tex_ChuuToku_11);
			gsub("<COL_03>","64",Tex_ChuuToku_11);
			gsub("<COL_06>",$6,Tex_ChuuToku_11);
			gsub("<COL_02>","昭和",Tex_ChuuToku_12);
			gsub("<COL_03>","64",Tex_ChuuToku_12);
			gsub("<COL_06>",$6,Tex_ChuuToku_12);
			print Tex_ChuuToku_01 > Fname;
			print Tex_ChuuToku_02 > Fname;
			print Tex_ChuuToku_03 > Fname;
			print Tex_ChuuToku_04 > Fname;
			print Tex_ChuuToku_05 > Fname;
			print Tex_ChuuToku_06 > Fname;
			print Tex_ChuuToku_07 > Fname;
			print Tex_ChuuToku_08 > Fname;
			print Tex_ChuuToku_09 > Fname;
			print Tex_ChuuToku_10 > Fname;
			print Tex_ChuuToku_11 > Fname;
			print Tex_ChuuToku_12 > Fname;
		}
	} else {
		# 2桁の時点で、03以降の考慮は不要になる
		Tex_ChuuToku_03 = "";
		Tex_ChuuToku_04 = Tex_ChuuToku_03;
		Tex_ChuuToku_05 = Tex_ChuuToku_03;
		Tex_ChuuToku_06 = Tex_ChuuToku_03;
		Tex_ChuuToku_07 = Tex_ChuuToku_03;
		Tex_ChuuToku_08 = Tex_ChuuToku_03;
		Tex_ChuuToku_09 = Tex_ChuuToku_03;
		Tex_ChuuToku_10 = Tex_ChuuToku_03;
		Tex_ChuuToku_11 = Tex_ChuuToku_03;
		Tex_ChuuToku_12 = Tex_ChuuToku_03;
		gsub("<COL_02>","平",Tex_ChuuToku_01);
		gsub("<COL_02>","平成",Tex_ChuuToku_02);
		gsub("<COL_03>",$3,Tex_ChuuToku_01);
		gsub("<COL_03>",$3,Tex_ChuuToku_02);
		gsub("<COL_06>",$6,Tex_ChuuToku_01);
		gsub("<COL_06>",$6,Tex_ChuuToku_02);
		print Tex_ChuuToku_01 > Fname;
		print Tex_ChuuToku_02 > Fname;
	}
}

# ------------------------------------------------------------------------------------------------------------------------

function GeneChuuToku_Reiwa(){
	len_ChuuToku = length($3);
	if(len_ChuuToku == 1){
		AddPadding_ChuuToku = "0"$3;
		if($3 != 1){
			# 1以外の時点で、05以降の考慮は不要になる
			Tex_ChuuToku_05 = "";
			Tex_ChuuToku_06 = Tex_ChuuToku_05;
			Tex_ChuuToku_07 = Tex_ChuuToku_05;
			Tex_ChuuToku_08 = Tex_ChuuToku_05;
			Tex_ChuuToku_09 = Tex_ChuuToku_05;
			Tex_ChuuToku_10 = Tex_ChuuToku_05;
			Tex_ChuuToku_11 = Tex_ChuuToku_05;
			Tex_ChuuToku_12 = Tex_ChuuToku_05;
			gsub("<COL_02>","令",Tex_ChuuToku_01);
			gsub("<COL_02>","令和",Tex_ChuuToku_02);
			Tex_ChuuToku_03 = Tex_ChuuToku_01;
			Tex_ChuuToku_04 = Tex_ChuuToku_02;
			gsub("<COL_03>",$3,Tex_ChuuToku_01);
			gsub("<COL_03>",$3,Tex_ChuuToku_02);
			gsub("<COL_03>",AddPadding_ChuuToku,Tex_ChuuToku_03);
			gsub("<COL_03>",AddPadding_ChuuToku,Tex_ChuuToku_04);
			gsub("<COL_06>",$6,Tex_ChuuToku_01);
			gsub("<COL_06>",$6,Tex_ChuuToku_02);
			gsub("<COL_06>",$6,Tex_ChuuToku_03);
			gsub("<COL_06>",$6,Tex_ChuuToku_04);
			print Tex_ChuuToku_01 > Fname;
			print Tex_ChuuToku_02 > Fname;
			print Tex_ChuuToku_03 > Fname;
			print Tex_ChuuToku_04 > Fname;
		} else {
			gsub("<COL_02>","令",Tex_ChuuToku_01);
			Tex_ChuuToku_03 = Tex_ChuuToku_01;
			Tex_ChuuToku_05 = Tex_ChuuToku_01;
			Tex_ChuuToku_07 = Tex_ChuuToku_01;
			Tex_ChuuToku_09 = Tex_ChuuToku_01;
			gsub("<COL_03>",$3,Tex_ChuuToku_01);
			gsub("<COL_06>",$6,Tex_ChuuToku_01);
			gsub("<COL_02>","令和",Tex_ChuuToku_02);
			Tex_ChuuToku_04 = Tex_ChuuToku_02;
			Tex_ChuuToku_06 = Tex_ChuuToku_02;
			Tex_ChuuToku_08 = Tex_ChuuToku_02;
			Tex_ChuuToku_10 = Tex_ChuuToku_02;
			gsub("<COL_03>",$3,Tex_ChuuToku_02);
			gsub("<COL_06>",$6,Tex_ChuuToku_02);
			gsub("<COL_03>",AddPadding_ChuuToku,Tex_ChuuToku_03);
			gsub("<COL_06>",$6,Tex_ChuuToku_03);
			gsub("<COL_03>",AddPadding_ChuuToku,Tex_ChuuToku_04);
			gsub("<COL_06>",$6,Tex_ChuuToku_04);
			gsub("<COL_03>",$3,Tex_ChuuToku_05);
			gsub("<COL_06>",$6,Tex_ChuuToku_05);
			gsub("<COL_03>",$3,Tex_ChuuToku_06);
			gsub("<COL_06>",$6,Tex_ChuuToku_06);
			gsub("<COL_03>",AddPadding_ChuuToku,Tex_ChuuToku_07);
			gsub("<COL_06>",$6,Tex_ChuuToku_07);
			gsub("<COL_03>",AddPadding_ChuuToku,Tex_ChuuToku_08);
			gsub("<COL_06>",$6,Tex_ChuuToku_08);
			gsub("<COL_03>","元",Tex_ChuuToku_09);
			gsub("<COL_06>",$6,Tex_ChuuToku_09);
			gsub("<COL_03>","元",Tex_ChuuToku_10);
			gsub("<COL_06>",$6,Tex_ChuuToku_10);
			gsub("<COL_02>","平",Tex_ChuuToku_11);
			gsub("<COL_03>","31",Tex_ChuuToku_11);
			gsub("<COL_06>",$6,Tex_ChuuToku_11);
			gsub("<COL_02>","平成",Tex_ChuuToku_12);
			gsub("<COL_03>","31",Tex_ChuuToku_12);
			gsub("<COL_06>",$6,Tex_ChuuToku_12);
			print Tex_ChuuToku_01 > Fname;
			print Tex_ChuuToku_02 > Fname;
			print Tex_ChuuToku_03 > Fname;
			print Tex_ChuuToku_04 > Fname;
			print Tex_ChuuToku_05 > Fname;
			print Tex_ChuuToku_06 > Fname;
			print Tex_ChuuToku_07 > Fname;
			print Tex_ChuuToku_08 > Fname;
			print Tex_ChuuToku_09 > Fname;
			print Tex_ChuuToku_10 > Fname;
			print Tex_ChuuToku_11 > Fname;
			print Tex_ChuuToku_12 > Fname;
		}
	} else {
		# 2桁の時点で、03以降の考慮は不要になる
		Tex_ChuuToku_03 = "";
		Tex_ChuuToku_04 = Tex_ChuuToku_03;
		Tex_ChuuToku_05 = Tex_ChuuToku_03;
		Tex_ChuuToku_06 = Tex_ChuuToku_03;
		Tex_ChuuToku_07 = Tex_ChuuToku_03;
		Tex_ChuuToku_08 = Tex_ChuuToku_03;
		Tex_ChuuToku_09 = Tex_ChuuToku_03;
		Tex_ChuuToku_10 = Tex_ChuuToku_03;
		Tex_ChuuToku_11 = Tex_ChuuToku_03;
		Tex_ChuuToku_12 = Tex_ChuuToku_03;
		gsub("<COL_02>","令",Tex_ChuuToku_01);
		gsub("<COL_02>","令和",Tex_ChuuToku_02);
		gsub("<COL_03>",$3,Tex_ChuuToku_01);
		gsub("<COL_03>",$3,Tex_ChuuToku_02);
		gsub("<COL_06>",$6,Tex_ChuuToku_01);
		gsub("<COL_06>",$6,Tex_ChuuToku_02);
		print Tex_ChuuToku_01 > Fname;
		print Tex_ChuuToku_02 > Fname;
	}
}

# ------------------------------------------------------------------------------------------------------------------------

