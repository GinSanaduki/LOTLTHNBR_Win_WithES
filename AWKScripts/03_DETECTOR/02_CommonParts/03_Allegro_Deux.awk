#! /usr/bin/gawk
# 03_Allegro_Deux.awk

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

function Allegro_Sub08(){
	print "#! /bin/sh" > EXTRACTOR_EXT_TXT;
	print "" > EXTRACTOR_EXT_TXT;
	# 拡張子がtxtかつ文字コードがUTF-8のファイルを、結合しShift-JISに変換し中間ファイルに書き出す。
	if(Allegro_Sub05_TXT_UTF8ArraysCnt > 1){
		Allegro_Sub15("txt");
		print "" > EXTRACTOR_EXT_TXT;
	}
	# 拡張子がtxtかつ文字コードがShift-JISのファイルを、結合し中間ファイルに書き出す。
	if(Allegro_Sub05_TXT_SJISArraysCnt > 1){
		Allegro_Sub16("txt");
		print "" > EXTRACTOR_EXT_TXT;
	}
	# 拡張子がtxtかつ文字コードがUTF-8の結合中間ファイルと
	# 拡張子がtxtかつ文字コードがShift-JISの結合中間ファイルを結合する。
	if(Allegro_Sub05_TXT_UTF8ArraysCnt > 1 || 
	Allegro_Sub05_TXT_SJISArraysCnt > 1){
		Allegro_Sub17("txt");
		print "" > EXTRACTOR_EXT_TXT;
	}
	# 拡張子がtxtかつ文字コードがUTF-8の結合中間ファイル、
	# 拡張子がtxtかつ文字コードがShift-JISの結合中間ファイルを削除する。
	print "rm \""TMP_EXT_TXT_UTF8"\" > "OUT_DEVNULL > EXTRACTOR_EXT_TXT;
	print "" > EXTRACTOR_EXT_TXT;
	print "rm \""TMP_EXT_TXT_SJIS"\" > "OUT_DEVNULL > EXTRACTOR_EXT_TXT;
	print "" > EXTRACTOR_EXT_TXT;
	if(Allegro_Sub05_TXT_UTF8ArraysCnt > 1 || 
	Allegro_Sub05_TXT_SJISArraysCnt > 1){
		print "exit 0" > EXTRACTOR_EXT_TXT;
		print "" > EXTRACTOR_EXT_TXT;
		close(EXTRACTOR_EXT_TXT);
		return 1;
	}
	print "rm \""TMP_EXT_TXT"\" > "OUT_DEVNULL > EXTRACTOR_EXT_TXT;
	print "" > EXTRACTOR_EXT_TXT;
	print "exit 0" > EXTRACTOR_EXT_TXT;
	print "" > EXTRACTOR_EXT_TXT;
	close(EXTRACTOR_EXT_TXT);
	return 0;
}

# ------------------------------------------------------------------------------------------------------------------------

function Allegro_Sub09(){
	print "#! /bin/sh" > EXTRACTOR_EXT_DAT;
	print "" > EXTRACTOR_EXT_DAT;
	# 拡張子がdatかつ文字コードがUTF-8のファイルを、結合しShift-JISに変換し中間ファイルに書き出す。
	if(Allegro_Sub05_DAT_UTF8ArraysCnt > 1){
		Allegro_Sub15("dat");
		print "" > EXTRACTOR_EXT_DAT;
	}
	# 拡張子がdatかつ文字コードがShift-JISのファイルを、結合し中間ファイルに書き出す。
	if(Allegro_Sub05_DAT_SJISArraysCnt > 1){
		Allegro_Sub16("dat");
		print "" > EXTRACTOR_EXT_DAT;
	}
	# 拡張子がdatかつ文字コードがUTF-8の結合中間ファイルと
	# 拡張子がdatかつ文字コードがShift-JISの結合中間ファイルを結合する。
	if(Allegro_Sub05_DAT_UTF8ArraysCnt > 1 || 
	Allegro_Sub05_DAT_SJISArraysCnt > 1){
		Allegro_Sub17("dat");
		print "" > EXTRACTOR_EXT_DAT;
	}
	# 拡張子がdatかつ文字コードがUTF-8の結合中間ファイル、
	# 拡張子がdatかつ文字コードがShift-JISの結合中間ファイルを削除する。
	print "rm \""TMP_EXT_DAT_UTF8"\" > "OUT_DEVNULL > EXTRACTOR_EXT_DAT;
	print "" > EXTRACTOR_EXT_DAT;
	print "rm \""TMP_EXT_DAT_SJIS"\" > "OUT_DEVNULL > EXTRACTOR_EXT_DAT;
	print "" > EXTRACTOR_EXT_DAT;
	if(Allegro_Sub05_DAT_UTF8ArraysCnt > 1 || 
	Allegro_Sub05_DAT_SJISArraysCnt > 1){
		print "exit 0" > EXTRACTOR_EXT_DAT;
		print "" > EXTRACTOR_EXT_DAT;
		close(EXTRACTOR_EXT_DAT);
		return 1;
	}
	print "rm \""TMP_EXT_DAT"\" > "OUT_DEVNULL > EXTRACTOR_EXT_DAT;
	print "" > EXTRACTOR_EXT_DAT;
	print "exit 0" > EXTRACTOR_EXT_DAT;
	print "" > EXTRACTOR_EXT_DAT;
	close(EXTRACTOR_EXT_DAT);
	return 0;
}

# ------------------------------------------------------------------------------------------------------------------------

function Allegro_Sub10(){
	print "#! /bin/sh" > EXTRACTOR_EXT_LOG;
	print "" > EXTRACTOR_EXT_LOG;
	# 拡張子がlogかつ文字コードがUTF-8のファイルを、結合しShift-JISに変換し中間ファイルに書き出す。
	if(Allegro_Sub05_LOG_UTF8ArraysCnt > 1){
		Allegro_Sub15("log");
		print "" > EXTRACTOR_EXT_LOG;
	}
	# 拡張子がlogかつ文字コードがShift-JISのファイルを、結合し中間ファイルに書き出す。
	if(Allegro_Sub05_LOG_SJISArraysCnt > 1){
		Allegro_Sub16("log");
		print "" > EXTRACTOR_EXT_LOG;
	}
	# 拡張子がlogかつ文字コードがUTF-8の結合中間ファイルと
	# 拡張子がlogかつ文字コードがShift-JISの結合中間ファイルを結合する。
	if(Allegro_Sub05_LOG_UTF8ArraysCnt > 1 || 
	Allegro_Sub05_LOG_SJISArraysCnt > 1){
		Allegro_Sub17("log");
		print "" > EXTRACTOR_EXT_LOG;
	}
	# 拡張子がlogかつ文字コードがUTF-8の結合中間ファイル、
	# 拡張子がlogかつ文字コードがShift-JISの結合中間ファイルを削除する。
	print "rm \""TMP_EXT_LOG_UTF8"\" > "OUT_DEVNULL > EXTRACTOR_EXT_LOG;
	print "" > EXTRACTOR_EXT_LOG;
	print "rm \""TMP_EXT_LOG_SJIS"\" > "OUT_DEVNULL > EXTRACTOR_EXT_LOG;
	print "" > EXTRACTOR_EXT_LOG;
	if(Allegro_Sub05_LOG_UTF8ArraysCnt > 1 || 
	Allegro_Sub05_LOG_SJISArraysCnt > 1){
		print "exit 0" > EXTRACTOR_EXT_LOG;
		print "" > EXTRACTOR_EXT_LOG;
		close(EXTRACTOR_EXT_LOG);
		return 1;
	}
	print "rm \""TMP_EXT_LOG"\" > "OUT_DEVNULL > EXTRACTOR_EXT_LOG;
	print "" > EXTRACTOR_EXT_LOG;
	print "exit 0" > EXTRACTOR_EXT_LOG;
	print "" > EXTRACTOR_EXT_LOG;
	close(EXTRACTOR_EXT_LOG);
	return 0;
}

# ------------------------------------------------------------------------------------------------------------------------

function Allegro_Sub11(){
	print "#! /bin/sh" > EXTRACTOR_EXT_DEF;
	print "" > EXTRACTOR_EXT_DEF;
	# 拡張子がdefかつ文字コードがUTF-8のファイルを、結合しShift-JISに変換し中間ファイルに書き出す。
	if(Allegro_Sub05_DEF_UTF8ArraysCnt > 1){
		Allegro_Sub15("def");
		print "" > EXTRACTOR_EXT_DEF;
	}
	# 拡張子がdefかつ文字コードがShift-JISのファイルを、結合し中間ファイルに書き出す。
	if(Allegro_Sub05_DEF_SJISArraysCnt > 1){
		Allegro_Sub16("def");
		print "" > EXTRACTOR_EXT_DEF;
	}
	# 拡張子がdefかつ文字コードがUTF-8の結合中間ファイルと
	# 拡張子がdefかつ文字コードがShift-JISの結合中間ファイルを結合する。
	if(Allegro_Sub05_DEF_UTF8ArraysCnt > 1 || 
	Allegro_Sub05_DEF_SJISArraysCnt > 1){
		Allegro_Sub17("def");
		print "" > EXTRACTOR_EXT_DEF;
	}
	# 拡張子がdefかつ文字コードがUTF-8の結合中間ファイル、
	# 拡張子がdefかつ文字コードがShift-JISの結合中間ファイルを削除する。
	print "rm \""TMP_EXT_DEF_UTF8"\" > "OUT_DEVNULL > EXTRACTOR_EXT_DEF;
	print "" > EXTRACTOR_EXT_DEF;
	print "rm \""TMP_EXT_DEF_SJIS"\" > "OUT_DEVNULL > EXTRACTOR_EXT_DEF;
	print "" > EXTRACTOR_EXT_DEF;
	if(Allegro_Sub05_DEF_UTF8ArraysCnt > 1 || 
	Allegro_Sub05_DEF_SJISArraysCnt > 1){
		print "exit 0" > EXTRACTOR_EXT_DEF;
		print "" > EXTRACTOR_EXT_DEF;
		close(EXTRACTOR_EXT_DEF);
		return 1;
	}
	print "rm \""TMP_EXT_DEF"\" > "OUT_DEVNULL > EXTRACTOR_EXT_DEF;
	print "" > EXTRACTOR_EXT_DEF;
	print "exit 0" > EXTRACTOR_EXT_DEF;
	print "" > EXTRACTOR_EXT_DEF;
	close(EXTRACTOR_EXT_DEF);
	return 0;
}

# ------------------------------------------------------------------------------------------------------------------------

function Allegro_Sub12(){
	print "#! /bin/sh" > EXTRACTOR_EXT_CONF;
	print "" > EXTRACTOR_EXT_CONF;
	# 拡張子がconfかつ文字コードがUTF-8のファイルを、結合しShift-JISに変換し中間ファイルに書き出す。
	if(Allegro_Sub05_CONF_UTF8ArraysCnt > 1){
		Allegro_Sub15("conf");
		print "" > EXTRACTOR_EXT_CONF;
	}
	# 拡張子がconfかつ文字コードがShift-JISのファイルを、結合し中間ファイルに書き出す。
	if(Allegro_Sub05_CONF_SJISArraysCnt > 1){
		Allegro_Sub16("conf");
		print "" > EXTRACTOR_EXT_CONF;
	}
	# 拡張子がconfかつ文字コードがUTF-8の結合中間ファイルと
	# 拡張子がconfかつ文字コードがShift-JISの結合中間ファイルを結合する。
	if(Allegro_Sub05_CONF_UTF8ArraysCnt > 1 || 
	Allegro_Sub05_CONF_SJISArraysCnt > 1){
		Allegro_Sub17("conf");
		print "" > EXTRACTOR_EXT_CONF;
	}
	# 拡張子がconfかつ文字コードがUTF-8の結合中間ファイル、
	# 拡張子がconfかつ文字コードがShift-JISの結合中間ファイルを削除する。
	print "rm \""TMP_EXT_CONF_UTF8"\" > "OUT_DEVNULL > EXTRACTOR_EXT_CONF;
	print "" > EXTRACTOR_EXT_CONF;
	print "rm \""TMP_EXT_CONF_SJIS"\" > "OUT_DEVNULL > EXTRACTOR_EXT_CONF;
	print "" > EXTRACTOR_EXT_CONF;
	if(Allegro_Sub05_CONF_UTF8ArraysCnt > 1 || 
	Allegro_Sub05_CONF_SJISArraysCnt > 1){
		print "exit 0" > EXTRACTOR_EXT_CONF;
		print "" > EXTRACTOR_EXT_CONF;
		close(EXTRACTOR_EXT_CONF);
		return 1;
	}
	print "rm \""TMP_EXT_CONF"\" > "OUT_DEVNULL > EXTRACTOR_EXT_CONF;
	print "" > EXTRACTOR_EXT_CONF;
	print "exit 0" > EXTRACTOR_EXT_CONF;
	print "" > EXTRACTOR_EXT_CONF;
	close(EXTRACTOR_EXT_CONF);
	return 0;
}

# ------------------------------------------------------------------------------------------------------------------------

function Allegro_Sub13(){
	print "#! /bin/sh" > EXTRACTOR_EXT_CSV;
	print "" > EXTRACTOR_EXT_CSV;
	# 拡張子がcsvかつ文字コードがUTF-8のファイルを、結合しShift-JISに変換し中間ファイルに書き出す。
	if(Allegro_Sub05_CSV_UTF8ArraysCnt > 1){
		Allegro_Sub15("csv");
		print "" > EXTRACTOR_EXT_CSV;
	}
	# 拡張子がcsvかつ文字コードがShift-JISのファイルを、結合し中間ファイルに書き出す。
	if(Allegro_Sub05_CSV_SJISArraysCnt > 1){
		Allegro_Sub16("csv");
		print "" > EXTRACTOR_EXT_CSV;
	}
	# 拡張子がcsvかつ文字コードがUTF-8の結合中間ファイルと
	# 拡張子がcsvかつ文字コードがShift-JISの結合中間ファイルを結合する。
	if(Allegro_Sub05_CSV_UTF8ArraysCnt > 1 || 
	Allegro_Sub05_CSV_SJISArraysCnt > 1){
		Allegro_Sub17("csv");
		print "" > EXTRACTOR_EXT_CSV;
	}
	# 拡張子がcsvかつ文字コードがUTF-8の結合中間ファイル、
	# 拡張子がcsvかつ文字コードがShift-JISの結合中間ファイルを削除する。
	print "rm \""TMP_EXT_CSV_UTF8"\" > "OUT_DEVNULL > EXTRACTOR_EXT_CSV;
	print "" > EXTRACTOR_EXT_CSV;
	print "rm \""TMP_EXT_CSV_SJIS"\" > "OUT_DEVNULL > EXTRACTOR_EXT_CSV;
	print "" > EXTRACTOR_EXT_CSV;
	if(Allegro_Sub05_CSV_UTF8ArraysCnt > 1 || 
	Allegro_Sub05_CSV_SJISArraysCnt > 1){
		print "exit 0" > EXTRACTOR_EXT_CSV;
		print "" > EXTRACTOR_EXT_CSV;
		close(EXTRACTOR_EXT_CSV);
		return 1;
	}
	print "rm \""TMP_EXT_CSV"\" > "OUT_DEVNULL > EXTRACTOR_EXT_CSV;
	print "" > EXTRACTOR_EXT_CSV;
	print "exit 0" > EXTRACTOR_EXT_CSV;
	print "" > EXTRACTOR_EXT_CSV;
	close(EXTRACTOR_EXT_CSV);
	return 0;
}

# ------------------------------------------------------------------------------------------------------------------------

function Allegro_Sub14(){
	print "#! /bin/sh" > EXTRACTOR_EXT_TSV;
	print "" > EXTRACTOR_EXT_TSV;
	# 拡張子がtsvかつ文字コードがUTF-8のファイルを、結合しShift-JISに変換し中間ファイルに書き出す。
	if(Allegro_Sub05_TSV_UTF8ArraysCnt > 1){
		Allegro_Sub15("tsv");
		print "" > EXTRACTOR_EXT_TSV;
	}
	# 拡張子がtsvかつ文字コードがShift-JISのファイルを、結合し中間ファイルに書き出す。
	if(Allegro_Sub05_TSV_SJISArraysCnt > 1){
		Allegro_Sub16("tsv");
		print "" > EXTRACTOR_EXT_TSV;
	}
	# 拡張子がtsvかつ文字コードがUTF-8の結合中間ファイルと
	# 拡張子がtsvかつ文字コードがShift-JISの結合中間ファイルを結合する。
	if(Allegro_Sub05_TSV_UTF8ArraysCnt > 1 || 
	Allegro_Sub05_TSV_SJISArraysCnt > 1){
		Allegro_Sub17("tsv");
		print "" > EXTRACTOR_EXT_TSV;
	}
	# 拡張子がtsvかつ文字コードがUTF-8の結合中間ファイル、
	# 拡張子がtsvかつ文字コードがShift-JISの結合中間ファイルを削除する。
	print "rm \""TMP_EXT_TSV_UTF8"\" > "OUT_DEVNULL > EXTRACTOR_EXT_TSV;
	print "" > EXTRACTOR_EXT_TSV;
	print "rm \""TMP_EXT_TSV_SJIS"\" > "OUT_DEVNULL > EXTRACTOR_EXT_TSV;
	print "" > EXTRACTOR_EXT_TSV;
	if(Allegro_Sub05_TSV_UTF8ArraysCnt > 1 || 
	Allegro_Sub05_TSV_SJISArraysCnt > 1){
		print "exit 0" > EXTRACTOR_EXT_TSV;
		print "" > EXTRACTOR_EXT_TSV;
		close(EXTRACTOR_EXT_TSV);
		return 1;
	}
	print "rm \""TMP_EXT_TSV"\" > "OUT_DEVNULL > EXTRACTOR_EXT_TSV;
	print "" > EXTRACTOR_EXT_TSV;
	print "exit 0" > EXTRACTOR_EXT_TSV;
	print "" > EXTRACTOR_EXT_TSV;
	close(EXTRACTOR_EXT_TSV);
	return 0;
}

# ------------------------------------------------------------------------------------------------------------------------

