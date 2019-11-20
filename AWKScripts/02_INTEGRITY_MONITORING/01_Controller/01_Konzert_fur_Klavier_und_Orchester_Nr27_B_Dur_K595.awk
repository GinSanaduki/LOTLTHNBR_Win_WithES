#! /usr/bin/gawk
# 01_Konzert_fur_Klavier_und_Orchester_Nr27_B_Dur_K595.awk

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

@include "AWKScripts/01_UPDATE/02_CommonParts/04_FileUtils.awk";

@include "AWKScripts/02_INTEGRITY_MONITORING/02_CommonParts/01_Konzertouverture.awk";
@include "AWKScripts/02_INTEGRITY_MONITORING/02_CommonParts/02_Allegro.awk";
@include "AWKScripts/02_INTEGRITY_MONITORING/02_CommonParts/15_Larghetto.awk";

# ------------------------------------------------------------------------------------------------------------------------

BEGIN{
	print "Konzert fur Klavier und Orchester Nr.27 B-Dur K.595 will commence shortly.";
	print "START Konzertouverture...";
	Konzertouverture();
	print "END Konzertouverture.";
	print "START Allegro...";
	# Klavier_RetCode_01 = Allegro();
	print "END Allegro.";
	#if(Klavier_RetCode_01 != 0){
	#	exit 0;
	#}
	print "START Larghetto...";
	Larghetto();
	print "END Larghetto.";
	print "That's all, folks...";
}

