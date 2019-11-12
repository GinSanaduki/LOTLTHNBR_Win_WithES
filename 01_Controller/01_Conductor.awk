#! /usr/bin/gawk
# 01_Conductor.awk

# ------------------------------------------------------------------------------------------------------------------------

# Copyright 2019 The LOTLTHNBR Project Authors, GinSanaduki.
# All rights reserved.
# Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
# LOTLTHNBR Scripts provides a function to obtain a list of non-returned license numbers of teacher licenses from the Ministry of Education, Culture, Sports, Science and Technology from the website of the Ministry of Education, Culture, Sports, Science and Technology, and to inquire by license number.
# This Scripts needs GAWK(the GNU implementation of the AWK programming language) version 4.0 or later and BusyBox developed by Erik Andersen, Rob Landley, Denys Vlasenko and others.
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

@include "AWKScripts/01_UPDATE/02_CommonParts/01_Konzertouverture.awk";
@include "AWKScripts/01_UPDATE/02_CommonParts/02_Allegro.awk";
@include "AWKScripts/01_UPDATE/02_CommonParts/03_TelecommunicationControl.awk";
@include "AWKScripts/01_UPDATE/02_CommonParts/04_FileUtils.awk";
@include "AWKScripts/01_UPDATE/02_CommonParts/05_AssaiVivace.awk";

# ------------------------------------------------------------------------------------------------------------------------

BEGIN{
	print "START Hammerklavier_Initialize...";
	Hammerklavier_Initialize();
	print "END Hammerklavier_Initialize.";
	print "START Allegro...";
	Allegro();
	print "END Allegro.";
	print "START AssaiVivace...";
	AssaiVivace();
	print "END AssaiVivace.";
}

