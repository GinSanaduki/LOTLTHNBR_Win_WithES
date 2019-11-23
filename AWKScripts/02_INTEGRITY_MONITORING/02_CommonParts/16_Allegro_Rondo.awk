#! /usr/bin/gawk
# 16_Allegro_Rondo.awk

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

function Allegro_Rondo(){
	Allegro_Rondo_Sub01();
	Allegro_Rondo_Sub02();
# ①catでハッシュ表を全て吸い上げ、deleteマーカー行を除外し、sortで名前の逆順にソートを行い、各ジャンル毎に配列に格納する。
# ②本日日付の各要素のハッシュ値を基準として、過去日付のハッシュを比較する。同一なら比較した過去日付のファイルを削除し、配列から削除する。不一致の場合、基準ハッシュ値を変更し、続行する。
# ③ハッシュ表を全部削除し、各日付毎にハッシュ表を作り直す。
}

# ------------------------------------------------------------------------------------------------------------------------

function Allegro_Rondo_Sub01(){
	# UTF-8を回収
	Allegro_Rondo_Sub01_CMD01_01 = CALL_GAWK" -f AWKScripts/02_INTEGRITY_MONITORING/03_SubSystem/04_Allegro_Rondo_SubSystem_01.awk HashConf/HashInfo_2*.def | ";
	Allegro_Rondo_Sub01_CMD01_02 = CALL_BUSYBOX" fgrep -e \""CheckFile_UTF8"\" | ";
	Allegro_Rondo_Sub01_CMD01_03 = CALL_BUSYBOX" sort -t \",\" -k 2nr,2 > \""Tmp_RetCode_UTF8"\"";
	Allegro_Rondo_Sub01_CMD01 = Allegro_Rondo_Sub01_CMD01_01 Allegro_Rondo_Sub01_CMD01_02 Allegro_Rondo_Sub01_CMD01_03;
	# Shift-JISを回収
	Allegro_Rondo_Sub01_CMD02_01 = Allegro_Rondo_Sub01_CMD01_01;
	Allegro_Rondo_Sub01_CMD02_02 = CALL_BUSYBOX" fgrep -e \""CheckFile_SJIS"\" | ";
	Allegro_Rondo_Sub01_CMD02_03 = CALL_BUSYBOX" sort -t \",\" -k 2nr,2 > \""Tmp_RetCode_SJIS"\"";
	Allegro_Rondo_Sub01_CMD02 = Allegro_Rondo_Sub01_CMD02_01 Allegro_Rondo_Sub01_CMD02_02 Allegro_Rondo_Sub01_CMD02_03;
	# EDITHTMLを回収
	Allegro_Rondo_Sub01_CMD03_01 = Allegro_Rondo_Sub01_CMD01_01;
	Allegro_Rondo_Sub01_CMD03_02 = CALL_BUSYBOX" fgrep -e \""CheckFile_EDIT"\" | ";
	Allegro_Rondo_Sub01_CMD03_03 = CALL_BUSYBOX" sort -t \",\" -k 2nr,2 > \""Tmp_RetCode_EDIT"\"";
	Allegro_Rondo_Sub01_CMD03 = Allegro_Rondo_Sub01_CMD03_01 Allegro_Rondo_Sub01_CMD03_02 Allegro_Rondo_Sub01_CMD03_03;
	# XLSXを回収
	Allegro_Rondo_Sub01_CMD04_01 = Allegro_Rondo_Sub01_CMD01_01;
	Allegro_Rondo_Sub01_CMD04_02 = CALL_BUSYBOX" fgrep -e \""CheckFile_XLSX"\" | ";
	Allegro_Rondo_Sub01_CMD04_03 = CALL_BUSYBOX" sort -t \",\" -k 2nr,2 > \""Tmp_RetCode_XLSX"\"";
	Allegro_Rondo_Sub01_CMD04 = Allegro_Rondo_Sub01_CMD04_01 Allegro_Rondo_Sub01_CMD04_02 Allegro_Rondo_Sub01_CMD04_03;
	# CSVを回収
	Allegro_Rondo_Sub01_CMD05_01 = Allegro_Rondo_Sub01_CMD01_01;
	Allegro_Rondo_Sub01_CMD05_02 = CALL_BUSYBOX" fgrep -e \""CheckFile_CSV"\" | ";
	Allegro_Rondo_Sub01_CMD05_03 = CALL_BUSYBOX" sort -t \",\" -k 2nr,2 > \""Tmp_RetCode_CSV"\"";
	Allegro_Rondo_Sub01_CMD05 = Allegro_Rondo_Sub01_CMD05_01 Allegro_Rondo_Sub01_CMD05_02 Allegro_Rondo_Sub01_CMD05_03;
	ExecCmd(Allegro_Rondo_Sub01_CMD01);
	ExecCmd(Allegro_Rondo_Sub01_CMD02);
	ExecCmd(Allegro_Rondo_Sub01_CMD03);
	ExecCmd(Allegro_Rondo_Sub01_CMD04);
	ExecCmd(Allegro_Rondo_Sub01_CMD05);
}

# ------------------------------------------------------------------------------------------------------------------------

function Allegro_Rondo_Sub02(){
}

