#! /usr/bin/gawk
# 02_Konzert_fur_Klavier_und_Orchester_Nr27_B_Dur_K595_DEUX.awk

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
@include "AWKScripts/01_UPDATE/02_CommonParts/01_Konzertouverture.awk";
@include "AWKScripts/01_UPDATE/02_CommonParts/04_FileUtils.awk";

@include "AWKScripts/02_INTEGRITY_MONITORING/02_CommonParts/01_Konzertouverture.awk";
@include "AWKScripts/02_INTEGRITY_MONITORING/02_CommonParts/02_Allegro.awk";
@include "AWKScripts/02_INTEGRITY_MONITORING/02_CommonParts/15_Larghetto.awk";
@include "AWKScripts/02_INTEGRITY_MONITORING/02_CommonParts/16_Allegro_Rondo.awk";

# ------------------------------------------------------------------------------------------------------------------------

BEGIN{
	print "START Konzertouverture_02...";
	Konzertouverture_02();
	print "END Konzertouverture_02.";
	print "START Allegro_Rondo...";
	Allegro_Rondo();
	print "END Allegro_Rondo.";
	print "That's all, folks...";
}

# 16_Allegro_Rondo.awk
# ①catでハッシュ表を全て吸い上げ、deleteマーカー行を除外し、sortで名前の逆順にソートを行い、各ジャンル毎に配列に格納する。
# ②本日日付の各要素のハッシュ値を基準として、過去日付のハッシュを比較する。同一なら比較した過去日付のファイルを削除し、配列から削除する。不一致の場合、基準ハッシュ値を変更し、続行する。
# ③ハッシュ表を全部削除し、各日付毎にハッシュ表を作り直す。