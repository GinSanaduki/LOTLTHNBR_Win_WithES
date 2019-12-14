#! /bin/sh
# 01_CALL_DETECTOR_Adagio_01.sh
# busybox sh ShellScripts/03_DETECTOR/03_Adagio/01_CALL_DETECTOR_Adagio_01.sh

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

# 01_Adagio_SubSystem_01.awkの後処理
rm DETECTOR_WORKS_TROIS/ExtractedWord.txt > nul 2>&1

# 1. ExtractedWordの表記ゆれの調整
# 2. 校種+区分と通し番号との間にタブ文字を挿入
# 3. 元号と校種+区分との間にタブ文字を挿入
# 4. 通し番号のゼロパディング解除と漢数字のアラビア数字変換
# 5. sortの区切り文字指定のため、カンマに変換
# 6. sort
# 7. 重複行排除
# 8. カンマをタブ文字に変換
# 9. 改行コードをCR+LFに変換
# 2019年12月06日時点で、 2001行のDETECTOR_WORKS_TROIS/Filter_01.txtは、
# 1996行のDETECTOR_WORKS_TROIS/Filter_02.tsvに変換される
cat DETECTOR_WORKS_TROIS/Filter_01.txt | \
LinuxTools/gawk.exe -f AWKScripts/03_DETECTOR/03_SubSystem/01_Adagio/02_Adagio_SubSystem_02.awk | \
LinuxTools/gawk.exe -f AWKScripts/03_DETECTOR/03_SubSystem/01_Adagio/03_Adagio_SubSystem_03.awk | \
sed -e 's/第/第\t/g' -e 's/号/\t号/g' -e 's/昭/昭\t/g' -e 's/平/平\t/g' -e 's/令/令\t/g' | \
LinuxTools/gawk.exe -f AWKScripts/03_DETECTOR/03_SubSystem/01_Adagio/04_Adagio_SubSystem_04.awk | \
sed -e 's/\t/,/g' | \
sort -t ',' -k 1,1 -k 2n,2 -k 3,3 -k 5n,5 | \
uniq | \
sed -e 's/,/\t/g' | \
unix2dos > DETECTOR_WORKS_TROIS/Filter_02.tsv

exit 0

# 後処理
rm DETECTOR_WORKS_TROIS/Filter_01.txt > nul 2>&1

exit 0

