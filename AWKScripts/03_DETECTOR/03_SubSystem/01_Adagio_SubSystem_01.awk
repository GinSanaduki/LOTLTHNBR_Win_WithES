#! /usr/bin/gawk
# 01_Adagio_SubSystem_01.awk
# gawk.exe -f AWKScripts/03_DETECTOR/03_SubSystem/01_Adagio_SubSystem_01.awk DETECTOR_WORKS/ExtractedWord.txt > DETECTOR_WORKS/Filter_01.txt

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
	Cnt = 0;
}

{

# 下記以外の文字がExtractedWord.txtの行に含まれていた場合、除外する。
mat = match($0,/(昭|平|令|元|和|成|0|1|2|3|4|5|6|7|8|9|０|１|２|３|４|５|６|７|８|９|〇|一|二|三|四|五|六|七|八|九|十|百|千|万|幼|小|中|高|特|支|学|養|教|自|栄|盲|聾|専|修|種|普|め|級|け|臨|特)/)

}

