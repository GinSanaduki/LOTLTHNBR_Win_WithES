#! /bin/sh
# 03_CALL_DETECTOR_Cadenza_03.sh
# busybox sh ShellScripts/03_DETECTOR/05_Cadenza/03_CALL_DETECTOR_Cadenza_03.sh

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

# DETECTOR_WORKS_ONZE/GrepRes_No_[0-9].*?\\.txtのファイル名とファイルサイズのリストを取得する

PH1_RES_FLIST="DETECTOR_WORKS_DOUZE/Phase1_GrepRes_FileList.csv"
PH2_DEFINE_LIST="DETECTOR_WORKS_HUIT/GrepDefine_Phase2.tsv"

rm -r DETECTOR_WORKS_DOUZE > nul 2>&1
mkdir -p DETECTOR_WORKS_DOUZE > nul 2>&1
: > $PH1_RES_FLIST

ls -1 DETECTOR_WORKS_ONZE/*.txt | \
egrep GrepRes_No_[0-9]+\.txt | \
xargs wc -c | \
fgrep -v 'total' | \
awk '{print $1","$2}' | \
awk -f AWKScripts/03_DETECTOR/03_SubSystem/03_Cadenza/06_Cadenza_SubSystem_06.awk | \
sort -t ',' -k 1n,1 | \
unix2dos > $PH1_RES_FLIST

rm -r DETECTOR_WORKS_NEUF > nul 2>&1

# 1. TRUECNTが1以上、FALSECNTが1以上：phase1で検出されたのもあるし、されていないのもある。
#                                                                                5カラム目がFALSEのものだけphase2を実施。
# 2. TRUECNTが1以上、FALSECNTが0：phase1ですべて検出された。
#                                                                                phase2はやる必要なし。
# 3. TRUECNTが0、FALSECNTが1以上：phase1ですべて非検出。
#                                                                               すべてphase2を実施。
# 4. TRUECNTが1、FALSECNTが1：基本的に有り得ない。
#                                                                                06_Cadenza_SubSystem_06.awkが書き換わっているため、異常終了。

TRUECNT=`cut -f 5 -d "," $PH1_RES_FLIST | fgrep -c 'TRUE'`
FALSECNT=`cut -f 5 -d "," $PH1_RES_FLIST | fgrep -c 'FALSE'`
ls $PH2_DEFINE_LIST > nul 2>&1
RET_EXIST_PH2_DEFINE=$?

if [ $TRUECNT -ge 1 -a $FALSECNT -ge 1 ]; then
	echo "警告　：　最新分の未返納教員免許一覧を照会した結果、"$TRUECNT"件検出されました。"
	if [ $RET_EXIST_PH2_DEFINE -eq 0 ]; then
		echo "以降は、過去分の未返納教員免許一覧から、"$FALSECNT"件の照会を行います。"
		exit 0
	else
		echo "過去分の未返納教員免許一覧が存在しないため、検出結果をログに出力し、照会処理を終了します。"
		exit 1
	fi
elif [ $TRUECNT -ge 1 -a $FALSECNT -eq 0 ]; then
	echo "警告　：　最新分の未返納教員免許一覧を照会した結果、"$TRUECNT"件検出されました。"
	echo "最新分の未返納教員免許一覧から照会対象の免許番号が全件検出されたため、検出結果をログに出力し、照会処理を終了します。"
	exit 2
elif [ $TRUECNT -eq 0 -a $FALSECNT -ge 1 ]; then
	echo "報告　：　最新分の未返納教員免許一覧を照会した結果、照会対象の免許番号では検出されませんでした。"
	if [ $RET_EXIST_PH2_DEFINE -eq 0 ]; then
		echo "以降は、過去分の未返納教員免許一覧から、"$FALSECNT"件の照会を行います。"
		exit 3
	else
		echo "過去分の未返納教員免許一覧が存在しないため、検出結果をログに出力し、照会処理を終了します。"
		exit 4
	fi
else
	echo "AWKScripts/03_DETECTOR/03_SubSystem/03_Cadenza/06_Cadenza_SubSystem_06.awkの改竄が疑われます。"
	echo "同スクリプトファイルを確認してください。"
	exit 99
fi

