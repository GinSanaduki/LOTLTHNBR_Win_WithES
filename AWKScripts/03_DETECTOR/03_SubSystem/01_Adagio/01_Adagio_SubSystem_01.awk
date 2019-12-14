#! /usr/bin/gawk
# 01_Adagio_SubSystem_01.awk
# gawk.exe -f AWKScripts/03_DETECTOR/03_SubSystem/01_Adagio/01_Adagio_SubSystem_01.awk DETECTOR_WORKS/ExtractedWord.txt

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
	Declaration_03();
	Cnt = 0;
}

{
	# 下記以外の文字がExtractedWord.txtの行に含まれていた場合、除外する。
	# 元号と年号部の「年」、半角スペース、全角スペースは通過させ、後に削除する。
	mat = match($0,/[^昭和平成令元0123456789０１２３４５６７８９〇一二三四五六七八九十百千万幼小中高特支学養教自栄盲聾専修種普め級け臨第号 　]/);
	# 期待する文字以外が読み込んでいる行の文字列に含まれていない場合は0
	if(mat == 0){
		Cnt++;
		print > FILTER_01;
	}
}

END{
	if(Cnt == 0){
		exit 1;
	} else {
		exit 0;
	}
}

