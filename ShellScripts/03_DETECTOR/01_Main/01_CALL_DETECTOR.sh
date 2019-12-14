#! /bin/sh
# 01_CALL_DETECTOR.sh
# busybox sh ShellScripts/03_DETECTOR/01_Main/01_CALL_DETECTOR.sh

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

# sh ShellScripts/02_INTEGRITY_MONITORING/01_CALL_INTEGRITY_MONITORING.sh

LinuxTools/gawk.exe -f AWKScripts/03_DETECTOR/01_Controller/01_String_Quartet_No44_in_Bb_major_Op50_1_Hob_III_44.awk
RETCODE=$?
test $RETCODE -eq 99 && exit 99

echo "START Cadenza..."
sh ShellScripts/03_DETECTOR/05_Cadenza/01_CALL_DETECTOR_Cadenza_01.sh
RETCODE=$?
test $RETCODE -eq 99 && exit 99

sh ShellScripts/03_DETECTOR/05_Cadenza/03_CALL_DETECTOR_Cadenza_03.sh
RETCODE=$?
case $RETCODE in
	0 | 1 | 2 | 3 | 4)
		:
		;;
	*)
		exit 99
		;;
esac

echo "END Cadenza."
echo "START Vivace..."

case $RETCODE in
	0)
		# TRUECNT >= 1
		# FALSECNT >= 1
		# RET_EXIST_PH2_DEFINE = 0
		sh ShellScripts/03_DETECTOR/06_Vivace/01_CALL_DETECTOR_Vivace_01.sh
		RETCODE=$?
		test $RETCODE -eq 99 && exit 99
		sh ShellScripts/03_DETECTOR/06_Vivace/03_CALL_DETECTOR_Vivace_03.sh
		RETCODE=$?
		if [ $RETCODE -eq 0 ]; then
			# phase1に検出箇所が存在
			# phase2に検出箇所が存在
			sh ShellScripts/03_DETECTOR/06_Vivace/04_CALL_DETECTOR_Vivace_04.sh
		elif [ $RETCODE -eq 1 ]; then
			# phase1に検出箇所が存在
			# phase2に検出箇所が不存在
			sh ShellScripts/03_DETECTOR/06_Vivace/06_CALL_DETECTOR_Vivace_06.sh NotDetect
		else
			exit 99
		fi
		;;
	1)
		# TRUECNT >= 1
		# FALSECNT >= 1
		# RET_EXIST_PH2_DEFINE = 1
		sh ShellScripts/03_DETECTOR/06_Vivace/06_CALL_DETECTOR_Vivace_06.sh NotExist
		;;
	2)
		# TRUECNT > 0
		# FALSECNT = 0
		sh ShellScripts/03_DETECTOR/06_Vivace/06_CALL_DETECTOR_Vivace_06.sh Existed
		;;
	3)
		# TRUECNT = 0
		# FALSECNT >= 1
		# RET_EXIST_PH2_DEFINE = 0
		sh ShellScripts/03_DETECTOR/06_Vivace/01_CALL_DETECTOR_Vivace_01.sh
		RETCODE=$?
		test $RETCODE -eq 99 && exit 99
		sh ShellScripts/03_DETECTOR/06_Vivace/03_CALL_DETECTOR_Vivace_03.sh
		RETCODE=$?
		if [ $RETCODE -eq 0 ]; then
			# phase1に検出箇所が不存在
			# phase2に検出箇所が存在
			sh ShellScripts/03_DETECTOR/06_Vivace/07_CALL_DETECTOR_Vivace_07.sh
		elif [ $RETCODE -eq 1 ]; then
			# phase1に検出箇所が不存在
			# phase2に検出箇所が不存在
			sh ShellScripts/03_DETECTOR/06_Vivace/08_CALL_DETECTOR_Vivace_08.sh NotDetect
		else
			exit 99
		fi
		;;
	4)
		# TRUECNT = 0
		# FALSECNT >= 1
		# RET_EXIST_PH2_DEFINE = 1
		sh ShellScripts/03_DETECTOR/06_Vivace/08_CALL_DETECTOR_Vivace_08.sh NotExist
		;;
esac

echo "END Vivace."
echo "That's all, folks..."

exit 0

