#!/bin/sh
# 05_PWGen.sh

# GinSanaduki/PWGen_IMitation_forBusybox.sh
# https://github.com/GinSanaduki/PWGen_IMitation_forBusybox.sh

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

LF=$(printf '\\\n_')
LF=${LF%_}

genRand () {
	usleep 1000
	(ps -Ao user,group,comm,args,pid,ppid,etime,time;date) | \
	od -t d4 -A n -v | \
	sed 's/[^0-9]\{1,\}/'"$LF"'/g' | \
	grep '[0-9]' | \
	tail -n 42 | \
	sed 's/.*\(.\{8\}\)$/\1/g' | \
	awk 'BEGIN{a=-2147483648;}{a+=$1;}END{srand(a);print rand();}'
	
}

Rand1=`genRand`
Rand2=`genRand`
Rand3=`genRand`
Rand4=`genRand`
Rand5=`genRand`

printf "%s\n%s\n%s\n%s\n%s" $Rand1 $Rand2 $Rand3 $Rand4 $Rand5 | \
tr -dc 'a-zA-Z0-9' | \
shuf | \
tr -d '\n' | \
sha512sum | \
tr -dc 'a-zA-Z0-9' | \
awk '{for(i=1;i < length($0);i++){print substr($0,i,1)}}' | \
shuf | \
shuf | \
shuf | \
shuf | \
shuf | \
shuf | \
shuf | \
shuf | \
shuf | \
shuf | \
shuf | \
shuf | \
shuf | \
shuf | \
tr -d '\n' | \
cut -b 1-13

