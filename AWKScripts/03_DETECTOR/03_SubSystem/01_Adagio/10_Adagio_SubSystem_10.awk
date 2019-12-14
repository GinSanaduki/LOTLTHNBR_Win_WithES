#! /usr/bin/gawk
# 10_Adagio_SubSystem_10.awk
# gawk.exe -f AWKScripts/03_DETECTOR/03_SubSystem/01_Adagio/10_Adagio_SubSystem_10.awk

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

@include "AWKScripts/03_DETECTOR/04_SetArrays/01_YouArrays.awk";
@include "AWKScripts/03_DETECTOR/04_SetArrays/02_ShouArrays.awk";
@include "AWKScripts/03_DETECTOR/04_SetArrays/03_ChuuArrays.awk";
@include "AWKScripts/03_DETECTOR/04_SetArrays/04_KouArrays.awk";
@include "AWKScripts/03_DETECTOR/04_SetArrays/05_TokuShiArrays.awk";
@include "AWKScripts/03_DETECTOR/04_SetArrays/06_YouKyouArrays.awk";
@include "AWKScripts/03_DETECTOR/04_SetArrays/07_EiArrays.awk";
@include "AWKScripts/03_DETECTOR/04_SetArrays/08_MouArrays.awk";
@include "AWKScripts/03_DETECTOR/04_SetArrays/09_RouArrays.awk";
@include "AWKScripts/03_DETECTOR/04_SetArrays/10_YouGakuArrays.awk";

# ------------------------------------------------------------------------------------------------------------------------

function setDefineWordTextArray(){
	setYouArray();
	setShouArray();
	setChuuArray();
	setKouArray();
	setTokuShiArray();
	setYouKyouArray();
	setEiArray();
	setMouArray();
	setRouArray();
	setYouGakuArray();
}

# ------------------------------------------------------------------------------------------------------------------------

# 幼稚園
function setYouArray(){
	setYouSenArray();
	setYou1Array();
	setYou2Array();
	setYouRinArray();
	setYouTokuArray();
}

# ------------------------------------------------------------------------------------------------------------------------

# 小学校
function setShouArray(){
	setShouSenArray();
	setShou1Array();
	setShou2Array();
	setShouRinArray();
	setShouTokuArray();
}

# ------------------------------------------------------------------------------------------------------------------------

# 中学校
function setChuuArray(){
	setChuuSenArray();
	setChuu1Array();
	setChuu2Array();
	setChuuRinArray();
	setChuuTokuArray();
}

# ------------------------------------------------------------------------------------------------------------------------

# 高等学校
function setKouArray(){
	setKouSenArray();
	setKou1Array();
	setKou2Array();
	setKouRinArray();
	setKouTokuArray();
}

# ------------------------------------------------------------------------------------------------------------------------

# 特別支援学校
function setTokuShiArray(){
	setTokuShiSenArray();
	setTokuShi1Array();
	setTokuShi2Array();
	setTokuShiRinArray();
	setTokuShiTokuArray();
}

# ------------------------------------------------------------------------------------------------------------------------

# 養護教諭
function setYouKyouArray(){
	setYouKyouSenArray();
	setYouKyou1Array();
	setYouKyou2Array();
	setYouKyouRinArray();
	setYouKyouTokuArray();
}

# ------------------------------------------------------------------------------------------------------------------------

# 栄養教諭
function setEiArray(){
	setEiSenArray();
	setEi1Array();
	setEi2Array();
	setEiRinArray();
	setEiTokuArray();
}

# ------------------------------------------------------------------------------------------------------------------------

# 盲学校
function setMouArray(){
	setMouSenArray();
	setMou1Array();
	setMou2Array();
	setMouRinArray();
	setMouTokuArray();
}

# ------------------------------------------------------------------------------------------------------------------------

# 聾学校
function setRouArray(){
	setRouSenArray();
	setRou1Array();
	setRou2Array();
	setRouRinArray();
	setRouTokuArray();
}

# ------------------------------------------------------------------------------------------------------------------------

# 養護学校
function setYouGakuArray(){
	setYouGakuSenArray();
	setYouGaku1Array();
	setYouGaku2Array();
	setYouGakuRinArray();
	setYouGakuTokuArray();
}

# ------------------------------------------------------------------------------------------------------------------------

