#! /bin/sh
# 01_CALL_DETECTOR_Vivace_01.sh
# busybox sh ShellScripts/03_DETECTOR/06_Vivace/01_CALL_DETECTOR_Vivace_01.sh

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

PH1_RES_FLIST="DETECTOR_WORKS_DOUZE/Phase1_GrepRes_FileList.csv"
PH2_DEFINE_LIST="DETECTOR_WORKS_HUIT/GrepDefine_Phase2.tsv"
PH2_RES_FLIST="DETECTOR_WORKS_TREIZE/Phase2_GrepRes_FileList.csv"

rm -r DETECTOR_WORKS_TREIZE > nul 2>&1
mkdir -p DETECTOR_WORKS_TREIZE > nul 2>&1
: > $PH2_RES_FLIST

fgrep 'FALSE' $PH1_RES_FLIST | \
sed -e 's/ONZE/QUATORZE/g' | \
awk 'BEGIN{FS = ","}{print NR","$1","$2","$3}' | \
unix2dos > $PH2_RES_FLIST

LineCnt=`awk 'END{print NR;}' $PH2_RES_FLIST`

Ret_EstimateTime=`LinuxTools/gawk.exe -f AWKScripts/03_DETECTOR/03_SubSystem/03_Cadenza/01_Cadenza_SubSystem_01.awk -v Number=$LineCnt`
RETCODE=$?
if [ $RETCODE -eq 99 ]; then
	echo "invalid argument : 01_Cadenza_SubSystem_01.awk"
	exit 99
elif [ $RETCODE -eq 0 ]; then
	echo "照会に要する時間はおよそ"$Ret_EstimateTime"です。"
fi

echo "同PC上で他の作業を行っている場合、多少照会処理の完了が遅れる場合があります。"
echo "また、同PCのCPUリソースを大量に使用するため、一時的に他の作業を行う際に、動作が重くなります。"
echo "例えば、Google Chromeなどでウェブブラウジング中に実行すると、1,000件あたり1分程度遅くなります。"

PH2_EXEC_SHELL="DETECTOR_WORKS_QUINZE/Phase2Grep_ParallelExecShell.sh"

rm -r DETECTOR_WORKS_QUINZE > nul 2>&1
mkdir -p DETECTOR_WORKS_QUINZE > nul 2>&1
: > $PH2_EXEC_SHELL
# xargsの入力用コマンドを生成
LinuxTools/gawk.exe -f AWKScripts/03_DETECTOR/03_SubSystem/04_Vivace/01_Vivace_SubSystem_01.awk -v LineCnt=$LineCnt $PH2_RES_FLIST | \
unix2dos > $PH2_EXEC_SHELL

rm -r DETECTOR_WORKS_QUATORZE > nul 2>&1
mkdir -p DETECTOR_WORKS_QUATORZE > nul 2>&1

# Grep処理開始時刻を出力
LinuxTools/gawk.exe -f AWKScripts/03_DETECTOR/03_SubSystem/03_Cadenza/03_Cadenza_SubSystem_03.awk -v Mode=START
RETCODE=$?
if [ $RETCODE -ne 0 ]; then
	echo "invalid argument : 03_Cadenza_SubSystem_03.awk"
	exit 99
fi
if [ ! -s $PH2_EXEC_SHELL ]; then
	echo $PH2_EXEC_SHELL" is an empty file."
	exit 99
fi

xargs -P 200 -n 5 -a $PH2_EXEC_SHELL -r -I{} sh -c '{}'

# Grep処理完了時刻を出力
LinuxTools/gawk.exe -f AWKScripts/03_DETECTOR/03_SubSystem/03_Cadenza/03_Cadenza_SubSystem_03.awk -v Mode=END
RETCODE=$?
if [ $RETCODE -ne 0 ]; then
	echo "invalid argument : 03_Cadenza_SubSystem_03.awk"
	exit 99
fi

rm -r DETECTOR_WORKS_QUINZE

exit 0

