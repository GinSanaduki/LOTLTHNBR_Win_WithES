#! /usr/bin/gawk
# 05_Allegro_Quatre.awk

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

function Allegro_Sub18(Allegro_Sub18_CMD01){
	Allegro_Sub18_CMD01 = CALL_BUSYBOX" sh ShellScripts/03_DETECTOR/02_Allegro/02_CALL_DETECTOR_Allegro_02.sh";
	ExecCmd(Allegro_Sub18_CMD01);
}

# ------------------------------------------------------------------------------------------------------------------------

function Allegro_Sub19(Allegro_Sub19_CMD01,Allegro_Sub19_CMD02){
	if(Allegro_Sub07_BitField_CSV == 1){
		Allegro_Sub19_CMD01 = CALL_BUSYBOX" sh ShellScripts/03_DETECTOR/02_Allegro/03_CALL_DETECTOR_Allegro_03.sh";
		ExecCmd(Allegro_Sub19_CMD01);
	}
	if(Allegro_Sub07_BitField_TSV == 1){
		Allegro_Sub19_CMD02 = CALL_BUSYBOX" sh ShellScripts/03_DETECTOR/02_Allegro/04_CALL_DETECTOR_Allegro_04.sh";
		ExecCmd(Allegro_Sub19_CMD02);
	}
}

# ------------------------------------------------------------------------------------------------------------------------

function Allegro_Sub20(Allegro_Sub20_CMD01){
	Allegro_Sub20_CMD01 = CALL_BUSYBOX" sh ShellScripts/03_DETECTOR/02_Allegro/05_CALL_DETECTOR_Allegro_05.sh";
	ExecCmd(Allegro_Sub20_CMD01);
}

# ------------------------------------------------------------------------------------------------------------------------

