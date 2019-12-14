#! /bin/sh
# 05_CALL_DETECTOR_Allegro_05.sh
# busybox sh ShellScripts/03_DETECTOR/02_Allegro/05_CALL_DETECTOR_Allegro_05.sh

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

# 収集したファイルを結合、ソート、重複除去
# 2019年12月06日時点で、2009行のDETECTOR_WORKS/Tmp_Ext_*.txtは
# 2001行のDETECTOR_WORKS_TROIS/ExtractedWord.txtに変換される
cat DETECTOR_WORKS/Tmp_Ext_*.txt | sort | uniq | unix2dos > DETECTOR_WORKS_TROIS/ExtractedWord.txt

# 後処理
rm -r DETECTOR_WORKS > nul 2>&1

exit 0

