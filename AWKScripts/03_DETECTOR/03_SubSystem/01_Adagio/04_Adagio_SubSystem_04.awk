#! /usr/bin/gawk
# 04_Adagio_SubSystem_04.awk
# gawk.exe -f AWKScripts/03_DETECTOR/03_SubSystem/01_Adagio/04_Adagio_SubSystem_04.awk

# GinSanaduki/kn2anInGAWK
# https://github.com/GinSanaduki/kn2anInGAWK

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

BEGIN{
	FS = "\t";
}

{

	# ゼロパディング解除
	# 数字以外が含まれていた場合、ゼロとなる
	Tex = $5;
	Tex = $5 + 0;
	if(Tex > 0){
		print $1"\t"$2"\t"$3"\t"$4"\t"Tex"\t"$6;
		next;
	}
	# 漢数字の可能性があるため、変換する
	ConvTo01 = HanZen(Tex);
	ConvTo02 = BaseConv(ConvTo01);
	MainConv();
	ConvTo32 = ZenHan(ConvTo31);
	if(ConvTo32 > 0){
		ConvTo32 = ConvTo32 + 0;
		print $1"\t"$2"\t"$3"\t"$4"\t"ConvTo32"\t"$6;
		next;
	}
}

# ------------------------------------------------------------------------------------------------------------------------

function BaseConv(BaseConv_ConvFrom){
	gsub("一","１",BaseConv_ConvFrom);
	gsub("二","２",BaseConv_ConvFrom);
	gsub("三","３",BaseConv_ConvFrom);
	gsub("四","４",BaseConv_ConvFrom);
	gsub("五","５",BaseConv_ConvFrom);
	gsub("六","６",BaseConv_ConvFrom);
	gsub("七","７",BaseConv_ConvFrom);
	gsub("八","８",BaseConv_ConvFrom);
	gsub("九","９",BaseConv_ConvFrom);
	return BaseConv_ConvFrom;
}

function HanZen(HanZen_ConvFrom){
	gsub("0","０",HanZen_ConvFrom);
	gsub("1","１",HanZen_ConvFrom);
	gsub("2","２",HanZen_ConvFrom);
	gsub("3","３",HanZen_ConvFrom);
	gsub("4","４",HanZen_ConvFrom);
	gsub("5","５",HanZen_ConvFrom);
	gsub("6","６",HanZen_ConvFrom);
	gsub("7","７",HanZen_ConvFrom);
	gsub("8","８",HanZen_ConvFrom);
	gsub("9","９",HanZen_ConvFrom);
	return HanZen_ConvFrom;
}

function ZenHan(ZenHan_ConvFrom){
	gsub("０","0",ZenHan_ConvFrom);
	gsub("１","1",ZenHan_ConvFrom);
	gsub("２","2",ZenHan_ConvFrom);
	gsub("３","3",ZenHan_ConvFrom);
	gsub("４","4",ZenHan_ConvFrom);
	gsub("５","5",ZenHan_ConvFrom);
	gsub("６","6",ZenHan_ConvFrom);
	gsub("７","7",ZenHan_ConvFrom);
	gsub("８","8",ZenHan_ConvFrom);
	gsub("９","9",ZenHan_ConvFrom);
	return ZenHan_ConvFrom;
}

function MainConv(){
	ConvTo03 = gensub(/([１-９])十([１-９])/,"\\1\\2","g",ConvTo02);
	ConvTo04 = gensub(/([１-９])十/,"\\1０","g",ConvTo03);
	ConvTo05 = gensub(/１*十([１-９])/,"１\\1","g",ConvTo04);
	ConvTo06 = gensub(/１*十/,"１０","g",ConvTo05);
	ConvTo07 = gensub(/〇/,"０","g",ConvTo06);
	ConvTo08 = gensub(/([１-９])百([０-９][０-９])/,"\\1\\2","g",ConvTo07);
	ConvTo09 = gensub(/([１-９])百([０-９])/,"\\1０\\2","g",ConvTo08);
	ConvTo10 = gensub(/([１-９])百/,"\\1００","g",ConvTo09);
	ConvTo11 = gensub(/百([０-９][０-９])/,"１\\1","g",ConvTo10);
	ConvTo12 = gensub(/百([０-９])/,"１０\\1","g",ConvTo11);
	ConvTo13 = gensub(/百/,"１００","g",ConvTo12);
	ConvTo14 = gensub(/([１-９])千([０-９][０-９][０-９])/,"\\1\\2","g",ConvTo13);
	ConvTo15 = gensub(/([１-９])千([０-９][０-９])/,"\\1０\\2","g",ConvTo14);
	ConvTo16 = gensub(/([１-９])千([０-９])/,"\\1００\\2","g",ConvTo15);
	ConvTo17 = gensub(/([１-９])千/,"\\1０００\\2","g",ConvTo16);
	ConvTo18 = gensub(/千([０-９][０-９][０-９])/,"１\\1","g",ConvTo17);
	ConvTo19 = gensub(/千([０-９][０-９])/,"１０\\1","g",ConvTo18);
	ConvTo20 = gensub(/千([０-９])/,"１００\\1","g",ConvTo19);
	ConvTo21 = gensub(/千/,"１０００","g",ConvTo20);
	ConvTo22 = gensub(/([０-９])万([０-９][０-９][０-９][０-９])/,"\\1\\2","g",ConvTo21);
	ConvTo23 = gensub(/([０-９])万([０-９][０-９][０-９])/,"\\1０\\2","g",ConvTo22);
	ConvTo24 = gensub(/([０-９])万([０-９][０-９])/,"\\1００\\2","g",ConvTo23);
	ConvTo25 = gensub(/([０-９])万([０-９])/,"\\1０００\\2","g",ConvTo24);
	ConvTo26 = gensub(/([０-９])万/,"\\1００００\\2","g",ConvTo25);
	ConvTo27 = gensub(/万([０-９][０-９][０-９][０-９])/,"１\\1","g",ConvTo26);
	ConvTo28 = gensub(/万([０-９][０-９][０-９])/,"１０\\1","g",ConvTo27);
	ConvTo29 = gensub(/万([０-９][０-９])/,"１００\\1","g",ConvTo28);
	ConvTo30 = gensub(/万([０-９])/,"１０００\\1","g",ConvTo29);
	ConvTo31 = gensub(/万/,"１００００","g",ConvTo30);
}

