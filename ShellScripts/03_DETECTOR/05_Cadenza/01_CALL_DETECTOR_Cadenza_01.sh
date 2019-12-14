#! /bin/sh
# 01_CALL_DETECTOR_Cadenza_01.sh
# busybox sh ShellScripts/03_DETECTOR/05_Cadenza/01_CALL_DETECTOR_Cadenza_01.sh

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

rm -r DETECTOR_WORKS_SIX > nul 2>&1

Det_FList="DETECTOR_WORKS_NEUF/Detector_WORD_FileList.csv"

rm -r DETECTOR_WORKS_NEUF > nul 2>&1
mkdir -p DETECTOR_WORKS_NEUF > nul 2>&1
: > $Det_FList

ls -1 DETECTOR_WORKS_CINQ/*.txt | \
egrep DETECTOR_WORKS_CINQ/Detector_WORD_No_[0-9].*?\\.txt | \
LinuxTools/gawk.exe -f AWKScripts/03_DETECTOR/03_SubSystem/03_Cadenza/02_Cadenza_SubSystem_02.awk | \
sort -t ',' -k 1n,1 | \
unix2dos > $Det_FList

LineCnt=`awk 'END{print NR;}' $Det_FList`

CntMsg=`echo $LineCnt | LinuxTools/gawk.exe '{printf("%s%\047d%s\r\n","照会対象件数は",$0,"件です。");}'`

echo $CntMsg

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

PH1_EXEC_SHELL="DETECTOR_WORKS_DIX/Phase1Grep_ParallelExecShell.sh"

rm -r DETECTOR_WORKS_DIX > nul 2>&1
mkdir -p DETECTOR_WORKS_DIX > nul 2>&1
: > $PH1_EXEC_SHELL
# xargsの入力用コマンドを生成
LinuxTools/gawk.exe -f AWKScripts/03_DETECTOR/03_SubSystem/03_Cadenza/05_Cadenza_SubSystem_05.awk -v LineCnt=$LineCnt $Det_FList | \
unix2dos > $PH1_EXEC_SHELL

rm -r DETECTOR_WORKS_ONZE > nul 2>&1
mkdir -p DETECTOR_WORKS_ONZE > nul 2>&1

# Grep処理開始時刻を出力
LinuxTools/gawk.exe -f AWKScripts/03_DETECTOR/03_SubSystem/03_Cadenza/03_Cadenza_SubSystem_03.awk -v Mode=START
RETCODE=$?
if [ $RETCODE -ne 0 ]; then
	echo "invalid argument : 03_Cadenza_SubSystem_03.awk"
	exit 99
fi
if [ ! -s $PH1_EXEC_SHELL ]; then
	echo $PH1_EXEC_SHELL" is an empty file."
	exit 99
fi

xargs -P 200 -n 5 -a $PH1_EXEC_SHELL -r -I{} sh -c '{}'

# Grep処理完了時刻を出力
LinuxTools/gawk.exe -f AWKScripts/03_DETECTOR/03_SubSystem/03_Cadenza/03_Cadenza_SubSystem_03.awk -v Mode=END
RETCODE=$?
if [ $RETCODE -ne 0 ]; then
	echo "invalid argument : 03_Cadenza_SubSystem_03.awk"
	exit 99
fi

rm -r DETECTOR_WORKS_DIX

exit 0

