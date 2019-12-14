#! /bin/sh
# 06_CALL_DETECTOR_Vivace_06.sh
# busybox sh ShellScripts/03_DETECTOR/06_Vivace/06_CALL_DETECTOR_Vivace_06.sh NotDetect
# busybox sh ShellScripts/03_DETECTOR/06_Vivace/06_CALL_DETECTOR_Vivace_06.sh NotExist
# busybox sh ShellScripts/03_DETECTOR/06_Vivace/06_CALL_DETECTOR_Vivace_06.sh Existed

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

case $1 in
	"NotDetect" | "NotExist" | "Existed")
		:
		;;
	*)
	echo "Invalid Argument. 06_CALL_DETECTOR_Vivace_06.sh"
	exit 99
	;;
esac

rm -r DETECTOR_WORKS_QUATORZE > nul 2>&1

PH1_RES_FLIST="DETECTOR_WORKS_DOUZE/Phase1_GrepRes_FileList.csv"

# 削除用リストを作成し、ファイルを削除
# RepBefore2はダミーのファイル名を設定している
fgrep 'FALSE' $PH1_RES_FLIST nul | \
awk -f AWKScripts/03_DETECTOR/03_SubSystem/04_Vivace/04_Vivace_SubSystem_04.awk -v RepBefore1=$PH1_RES_FLIST -v RepBefore2=$PH1_RES_FLIST | \
cut -f 3 -d ',' | \
xargs -P 0 rm > nul 2>&1

# 最新分の検出結果を格納
EXTRACT_GREPRESLIST_PH1_01="DETECTOR_WORKS_DIX_SEPT/Extract_GrepResList_Phase1_01.tsv"
EXTRACT_GREPRESLIST_PH1_02="DETECTOR_WORKS_DIX_SEPT/Extract_GrepResList_Phase1_02.tsv"
rm -r DETECTOR_WORKS_DIX_SEPT > nul 2>&1
mkdir -p DETECTOR_WORKS_DIX_SEPT > nul 2>&1
: > $EXTRACT_GREPRESLIST_PH1_01
awk '{print;}' DETECTOR_WORKS_ONZE/GrepRes_No_*.txt > $EXTRACT_GREPRESLIST_PH1_01
: > $EXTRACT_GREPRESLIST_PH1_02
sort -t $'\t' -k1,1 -k2,2 -k3,3 $EXTRACT_GREPRESLIST_PH1_01 | \
uniq | \
unix2dos > $EXTRACT_GREPRESLIST_PH1_02
rm $EXTRACT_GREPRESLIST_PH1_01 > nul 2>&1
rm -r DETECTOR_WORKS_ONZE > nul 2>&1

# 照会ログ出力準備
mkdir -p LogFile > nul 2>&1
LOG_FNAME=`LinuxTools/gawk.exe -f AWKScripts/03_DETECTOR/03_SubSystem/04_Vivace/05_Vivace_SubSystem_05.awk`
LOG_FNAME_TMP=`echo $LOG_FNAME".tmp" | awk '{sub("LogFile/","DETECTOR_WORKS_VINGT/");print;}'`
# debug
echo "LOG_FNAME : "$LOG_FNAME
rm -r DETECTOR_WORKS_VINGT > nul 2>&1
mkdir -p DETECTOR_WORKS_VINGT > nul 2>&1
: > $LOG_FNAME_TMP
echo "最新分の未返納教員免許一覧で検出された免許番号は以下の通りです。" | tee -a $LOG_FNAME_TMP
cat $EXTRACT_GREPRESLIST_PH1_02 |  tee -a $LOG_FNAME_TMP

rm -r DETECTOR_WORKS_DIX_SEPT > nul 2>&1
if [ $1 = "NotDetect" ]; then
	echo "過去分の未返納教員免許一覧で検出された免許番号は存在しませんでした。" | tee -a $LOG_FNAME_TMP
elif [ $1 = "NotExist" ]; then
	echo "過去分の未返納教員免許一覧は存在しない（最新分との差分が存在しない）ため、照会を行っていません。" | tee -a $LOG_FNAME_TMP
else
	echo "最新分の未返納教員免許一覧から全て照会対象の免許番号が検出されたため、過去分の未返納教員免許一覧の存在の有無（最新分との差分が存在する、しない）にかかわらず、過去分の未返納教員免許一覧は照会を行っていません。" | tee -a $LOG_FNAME_TMP
fi

sleep 3
: > $LOG_FNAME
cat $LOG_FNAME_TMP | \
unix2dos > $LOG_FNAME
rm -r DETECTOR_WORKS_VINGT > nul 2>&1

echo "今回の照会結果は、"$LOG_FNAME"に格納されています。"
sleep 3
echo "未返納教員免許一覧の免許番号照会を終了します。"

# 無条件で一時作業ディレクトリを削除
sh ShellScripts/03_DETECTOR/06_Vivace/05_CALL_DETECTOR_Vivace_05.sh

# Windows上のテキストファイルに関連付けされたテキストエディタ上で出力したログファイルを起動する
# Windows上のコマンドを起動するため、スラッシュをバックスラッシュに置換
# busyboxのawkからだとどうもうまく別プロセスが生成されないので、gawkから呼ぶ
LinuxTools/gawk.exe -f AWKScripts/03_DETECTOR/03_SubSystem/04_Vivace/06_Vivace_SubSystem_06.awk  -v LOG=$LOG_FNAME

exit 0

