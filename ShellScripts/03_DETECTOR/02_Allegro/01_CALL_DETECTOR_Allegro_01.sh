#! /bin/sh
# 01_CALL_DETECTOR_Allegro_01.sh
# busybox sh ShellScripts/03_DETECTOR/02_Allegro/01_CALL_DETECTOR_Allegro_01.sh

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

# 作業ディレクトリの生成
rm -r DETECTOR_WORKS > nul 2>&1
rm -r DETECTOR_WORKS_DEUX > nul 2>&1
rm -r DETECTOR_WORKS_TROIS > nul 2>&1

mkdir -p DETECTOR_WORKS > nul 2>&1
mkdir -p DETECTOR_WORKS_DEUX > nul 2>&1
mkdir -p DETECTOR_WORKS_TROIS > nul 2>&1

# 各拡張子の抽出ファイルの初期化
: > DETECTOR_WORKS/Tmp_Ext_TXT_UTF8.txt
: > DETECTOR_WORKS/Tmp_Ext_TXT_SJIS.txt
: > DETECTOR_WORKS/Tmp_Ext_TXT.txt
: > DETECTOR_WORKS/Tmp_Ext_DAT_UTF8.txt
: > DETECTOR_WORKS/Tmp_Ext_DAT_SJIS.txt
: > DETECTOR_WORKS/Tmp_Ext_DAT.txt
: > DETECTOR_WORKS/Tmp_Ext_LOG_UTF8.txt
: > DETECTOR_WORKS/Tmp_Ext_LOG_SJIS.txt
: > DETECTOR_WORKS/Tmp_Ext_LOG.txt
: > DETECTOR_WORKS/Tmp_Ext_DEF_UTF8.txt
: > DETECTOR_WORKS/Tmp_Ext_DEF_SJIS.txt
: > DETECTOR_WORKS/Tmp_Ext_DEF.txt
: > DETECTOR_WORKS/Tmp_Ext_CONF_UTF8.txt
: > DETECTOR_WORKS/Tmp_Ext_CONF_SJIS.txt
: > DETECTOR_WORKS/Tmp_Ext_CONF.txt
: > DETECTOR_WORKS/Tmp_Ext_CSV_UTF8.txt
: > DETECTOR_WORKS/Tmp_Ext_CSV_SJIS.txt
: > DETECTOR_WORKS/Tmp_Ext_CSV.txt
: > DETECTOR_WORKS/Tmp_Ext_TSV_UTF8.txt
: > DETECTOR_WORKS/Tmp_Ext_TSV_SJIS.txt
: > DETECTOR_WORKS/Tmp_Ext_TSV.txt

exit 0

