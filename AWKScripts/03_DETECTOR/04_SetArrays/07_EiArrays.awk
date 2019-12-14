#! /usr/bin/gawk
# 07_EiArrays.awk
# Import : AWKScripts/03_DETECTOR/04_SetArrays/07_EiArrays.awk

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

# 栄養教諭_専修
function setEiSenArray(){
	EiSen[1] = "<COL_02><COL_03>栄<COL_06>号";
	EiSen[2] = "<COL_02><COL_03>栄専<COL_06>号";
	EiSen[3] = "<COL_02><COL_03>栄専修<COL_06>号";
	EiSen[4] = "<COL_02><COL_03>栄専修第<COL_06>号";
	EiSen[5] = "<COL_02><COL_03>栄専修第号<COL_06>号";
	EiSen[6] = "<COL_02><COL_03>栄専種<COL_06>号";
	EiSen[7] = "<COL_02><COL_03>栄専種第<COL_06>号";
	EiSen[8] = "<COL_02><COL_03>栄専種第号<COL_06>号";
	EiSen[9] = "<COL_02><COL_03>栄専第<COL_06>号";
	EiSen[10] = "<COL_02><COL_03>栄専第号<COL_06>号";
	EiSen[11] = "<COL_02><COL_03>栄第<COL_06>号";
	EiSen[12] = "<COL_02><COL_03>栄第号<COL_06>号";
	EiSen[13] = "け<COL_02><COL_03>栄<COL_06>号";
	EiSen[14] = "け<COL_02><COL_03>栄専<COL_06>号";
	EiSen[15] = "け<COL_02><COL_03>栄専修<COL_06>号";
	EiSen[16] = "け<COL_02><COL_03>栄専修第<COL_06>号";
	EiSen[17] = "け<COL_02><COL_03>栄専修第号<COL_06>号";
	EiSen[18] = "け<COL_02><COL_03>栄専種<COL_06>号";
	EiSen[19] = "け<COL_02><COL_03>栄専種第<COL_06>号";
	EiSen[20] = "け<COL_02><COL_03>栄専種第号<COL_06>号";
	EiSen[21] = "け<COL_02><COL_03>栄専第<COL_06>号";
	EiSen[22] = "け<COL_02><COL_03>栄専第号<COL_06>号";
	EiSen[23] = "け<COL_02><COL_03>栄第<COL_06>号";
	EiSen[24] = "け<COL_02><COL_03>栄第号<COL_06>号";
	EiSen[25] = "め<COL_02><COL_03>栄<COL_06>号";
	EiSen[26] = "め<COL_02><COL_03>栄専<COL_06>号";
	EiSen[27] = "め<COL_02><COL_03>栄専修<COL_06>号";
	EiSen[28] = "め<COL_02><COL_03>栄専修第<COL_06>号";
	EiSen[29] = "め<COL_02><COL_03>栄専修第号<COL_06>号";
	EiSen[30] = "め<COL_02><COL_03>栄専種<COL_06>号";
	EiSen[31] = "め<COL_02><COL_03>栄専種第<COL_06>号";
	EiSen[32] = "め<COL_02><COL_03>栄専種第号<COL_06>号";
	EiSen[33] = "め<COL_02><COL_03>栄専第<COL_06>号";
	EiSen[34] = "め<COL_02><COL_03>栄専第号<COL_06>号";
	EiSen[35] = "め<COL_02><COL_03>栄第<COL_06>号";
	EiSen[36] = "め<COL_02><COL_03>栄第号<COL_06>号";
}

# ------------------------------------------------------------------------------------------------------------------------

# 栄養教諭_1種
function setEi1Array(){
	Ei1[1] = "<COL_02><COL_03>栄1<COL_06>号";
	Ei1[2] = "<COL_02><COL_03>栄1け<COL_06>号";
	Ei1[3] = "<COL_02><COL_03>栄1け第<COL_06>号";
	Ei1[4] = "<COL_02><COL_03>栄1け第号<COL_06>号";
	Ei1[5] = "<COL_02><COL_03>栄1め<COL_06>号";
	Ei1[6] = "<COL_02><COL_03>栄1め第<COL_06>号";
	Ei1[7] = "<COL_02><COL_03>栄1め第号<COL_06>号";
	Ei1[8] = "<COL_02><COL_03>栄1普<COL_06>号";
	Ei1[9] = "<COL_02><COL_03>栄1普め<COL_06>号";
	Ei1[10] = "<COL_02><COL_03>栄1普め第<COL_06>号";
	Ei1[11] = "<COL_02><COL_03>栄1普め第号<COL_06>号";
	Ei1[12] = "<COL_02><COL_03>栄1普第<COL_06>号";
	Ei1[13] = "<COL_02><COL_03>栄1普第号<COL_06>号";
	Ei1[14] = "<COL_02><COL_03>栄1種<COL_06>号";
	Ei1[15] = "<COL_02><COL_03>栄1種め<COL_06>号";
	Ei1[16] = "<COL_02><COL_03>栄1種め第<COL_06>号";
	Ei1[17] = "<COL_02><COL_03>栄1種め第号<COL_06>号";
	Ei1[18] = "<COL_02><COL_03>栄1種第<COL_06>号";
	Ei1[19] = "<COL_02><COL_03>栄1種第号<COL_06>号";
	Ei1[20] = "<COL_02><COL_03>栄1第<COL_06>号";
	Ei1[21] = "<COL_02><COL_03>栄1第号<COL_06>号";
	Ei1[22] = "<COL_02><COL_03>栄1級<COL_06>号";
	Ei1[23] = "<COL_02><COL_03>栄1級第<COL_06>号";
	Ei1[24] = "<COL_02><COL_03>栄1級第号<COL_06>号";
	Ei1[25] = "<COL_02><COL_03>栄<COL_06>号";
	Ei1[26] = "<COL_02><COL_03>栄普<COL_06>号";
	Ei1[27] = "<COL_02><COL_03>栄普め<COL_06>号";
	Ei1[28] = "<COL_02><COL_03>栄普め第<COL_06>号";
	Ei1[29] = "<COL_02><COL_03>栄普め第号<COL_06>号";
	Ei1[30] = "<COL_02><COL_03>栄普第<COL_06>号";
	Ei1[31] = "<COL_02><COL_03>栄普第号<COL_06>号";
	Ei1[32] = "<COL_02><COL_03>栄種<COL_06>号";
	Ei1[33] = "<COL_02><COL_03>栄種め<COL_06>号";
	Ei1[34] = "<COL_02><COL_03>栄種め第<COL_06>号";
	Ei1[35] = "<COL_02><COL_03>栄種め第号<COL_06>号";
	Ei1[36] = "<COL_02><COL_03>栄種第<COL_06>号";
	Ei1[37] = "<COL_02><COL_03>栄種第号<COL_06>号";
	Ei1[38] = "<COL_02><COL_03>栄第<COL_06>号";
	Ei1[39] = "<COL_02><COL_03>栄第号<COL_06>号";
	Ei1[40] = "け<COL_02><COL_03>栄1<COL_06>号";
	Ei1[41] = "け<COL_02><COL_03>栄1け<COL_06>号";
	Ei1[42] = "け<COL_02><COL_03>栄1け第<COL_06>号";
	Ei1[43] = "け<COL_02><COL_03>栄1け第号<COL_06>号";
	Ei1[44] = "け<COL_02><COL_03>栄1め<COL_06>号";
	Ei1[45] = "け<COL_02><COL_03>栄1め第<COL_06>号";
	Ei1[46] = "け<COL_02><COL_03>栄1め第号<COL_06>号";
	Ei1[47] = "け<COL_02><COL_03>栄1普<COL_06>号";
	Ei1[48] = "け<COL_02><COL_03>栄1普め<COL_06>号";
	Ei1[49] = "け<COL_02><COL_03>栄1普め第<COL_06>号";
	Ei1[50] = "け<COL_02><COL_03>栄1普め第号<COL_06>号";
	Ei1[51] = "け<COL_02><COL_03>栄1普第<COL_06>号";
	Ei1[52] = "け<COL_02><COL_03>栄1普第号<COL_06>号";
	Ei1[53] = "け<COL_02><COL_03>栄1種<COL_06>号";
	Ei1[54] = "け<COL_02><COL_03>栄1種め<COL_06>号";
	Ei1[55] = "け<COL_02><COL_03>栄1種め第<COL_06>号";
	Ei1[56] = "け<COL_02><COL_03>栄1種め第号<COL_06>号";
	Ei1[57] = "け<COL_02><COL_03>栄1種第<COL_06>号";
	Ei1[58] = "け<COL_02><COL_03>栄1種第号<COL_06>号";
	Ei1[59] = "け<COL_02><COL_03>栄1第<COL_06>号";
	Ei1[60] = "け<COL_02><COL_03>栄1第号<COL_06>号";
	Ei1[61] = "け<COL_02><COL_03>栄1級<COL_06>号";
	Ei1[62] = "け<COL_02><COL_03>栄1級第<COL_06>号";
	Ei1[63] = "け<COL_02><COL_03>栄1級第号<COL_06>号";
	Ei1[64] = "け<COL_02><COL_03>栄<COL_06>号";
	Ei1[65] = "け<COL_02><COL_03>栄普<COL_06>号";
	Ei1[66] = "け<COL_02><COL_03>栄普め<COL_06>号";
	Ei1[67] = "け<COL_02><COL_03>栄普め第<COL_06>号";
	Ei1[68] = "け<COL_02><COL_03>栄普め第号<COL_06>号";
	Ei1[69] = "け<COL_02><COL_03>栄普第<COL_06>号";
	Ei1[70] = "け<COL_02><COL_03>栄普第号<COL_06>号";
	Ei1[71] = "け<COL_02><COL_03>栄種<COL_06>号";
	Ei1[72] = "け<COL_02><COL_03>栄種め<COL_06>号";
	Ei1[73] = "け<COL_02><COL_03>栄種め第<COL_06>号";
	Ei1[74] = "け<COL_02><COL_03>栄種め第号<COL_06>号";
	Ei1[75] = "け<COL_02><COL_03>栄種第<COL_06>号";
	Ei1[76] = "け<COL_02><COL_03>栄種第号<COL_06>号";
	Ei1[77] = "け<COL_02><COL_03>栄第<COL_06>号";
	Ei1[78] = "け<COL_02><COL_03>栄第号<COL_06>号";
	Ei1[79] = "め<COL_02><COL_03>栄1<COL_06>号";
	Ei1[80] = "め<COL_02><COL_03>栄1け<COL_06>号";
	Ei1[81] = "め<COL_02><COL_03>栄1け第<COL_06>号";
	Ei1[82] = "め<COL_02><COL_03>栄1け第号<COL_06>号";
	Ei1[83] = "め<COL_02><COL_03>栄1め<COL_06>号";
	Ei1[84] = "め<COL_02><COL_03>栄1め第<COL_06>号";
	Ei1[85] = "め<COL_02><COL_03>栄1め第号<COL_06>号";
	Ei1[86] = "め<COL_02><COL_03>栄1普<COL_06>号";
	Ei1[87] = "め<COL_02><COL_03>栄1普め<COL_06>号";
	Ei1[88] = "め<COL_02><COL_03>栄1普め第<COL_06>号";
	Ei1[89] = "め<COL_02><COL_03>栄1普め第号<COL_06>号";
	Ei1[90] = "め<COL_02><COL_03>栄1普第<COL_06>号";
	Ei1[91] = "め<COL_02><COL_03>栄1普第号<COL_06>号";
	Ei1[92] = "め<COL_02><COL_03>栄1種<COL_06>号";
	Ei1[93] = "め<COL_02><COL_03>栄1種め<COL_06>号";
	Ei1[94] = "め<COL_02><COL_03>栄1種め第<COL_06>号";
	Ei1[95] = "め<COL_02><COL_03>栄1種め第号<COL_06>号";
	Ei1[96] = "め<COL_02><COL_03>栄1種第<COL_06>号";
	Ei1[97] = "め<COL_02><COL_03>栄1種第号<COL_06>号";
	Ei1[98] = "め<COL_02><COL_03>栄1第<COL_06>号";
	Ei1[99] = "め<COL_02><COL_03>栄1第号<COL_06>号";
	Ei1[100] = "め<COL_02><COL_03>栄1級<COL_06>号";
	Ei1[101] = "め<COL_02><COL_03>栄1級第<COL_06>号";
	Ei1[102] = "め<COL_02><COL_03>栄1級第号<COL_06>号";
	Ei1[103] = "め<COL_02><COL_03>栄<COL_06>号";
	Ei1[104] = "め<COL_02><COL_03>栄普<COL_06>号";
	Ei1[105] = "め<COL_02><COL_03>栄普め<COL_06>号";
	Ei1[106] = "め<COL_02><COL_03>栄普め第<COL_06>号";
	Ei1[107] = "め<COL_02><COL_03>栄普め第号<COL_06>号";
	Ei1[108] = "め<COL_02><COL_03>栄普第<COL_06>号";
	Ei1[109] = "め<COL_02><COL_03>栄普第号<COL_06>号";
	Ei1[110] = "め<COL_02><COL_03>栄種<COL_06>号";
	Ei1[111] = "め<COL_02><COL_03>栄種め<COL_06>号";
	Ei1[112] = "め<COL_02><COL_03>栄種め第<COL_06>号";
	Ei1[113] = "め<COL_02><COL_03>栄種め第号<COL_06>号";
	Ei1[114] = "め<COL_02><COL_03>栄種第<COL_06>号";
	Ei1[115] = "め<COL_02><COL_03>栄種第号<COL_06>号";
	Ei1[116] = "め<COL_02><COL_03>栄第<COL_06>号";
	Ei1[117] = "め<COL_02><COL_03>栄第号<COL_06>号";
}

# ------------------------------------------------------------------------------------------------------------------------

# 栄養教諭_2種
function setEi2Array(){
	Ei2[1] = "<COL_02><COL_03>栄2<COL_06>号";
	Ei2[2] = "<COL_02><COL_03>栄2け<COL_06>号";
	Ei2[3] = "<COL_02><COL_03>栄2け第<COL_06>号";
	Ei2[4] = "<COL_02><COL_03>栄2け第号<COL_06>号";
	Ei2[5] = "<COL_02><COL_03>栄2め<COL_06>号";
	Ei2[6] = "<COL_02><COL_03>栄2め第<COL_06>号";
	Ei2[7] = "<COL_02><COL_03>栄2め第号<COL_06>号";
	Ei2[8] = "<COL_02><COL_03>栄2普<COL_06>号";
	Ei2[9] = "<COL_02><COL_03>栄2普め<COL_06>号";
	Ei2[10] = "<COL_02><COL_03>栄2普め第<COL_06>号";
	Ei2[11] = "<COL_02><COL_03>栄2普め第号<COL_06>号";
	Ei2[12] = "<COL_02><COL_03>栄2普第<COL_06>号";
	Ei2[13] = "<COL_02><COL_03>栄2普第号<COL_06>号";
	Ei2[14] = "<COL_02><COL_03>栄2種<COL_06>号";
	Ei2[15] = "<COL_02><COL_03>栄2種め<COL_06>号";
	Ei2[16] = "<COL_02><COL_03>栄2種め第<COL_06>号";
	Ei2[17] = "<COL_02><COL_03>栄2種め第号<COL_06>号";
	Ei2[18] = "<COL_02><COL_03>栄2種第<COL_06>号";
	Ei2[19] = "<COL_02><COL_03>栄2種第号<COL_06>号";
	Ei2[20] = "<COL_02><COL_03>栄2第<COL_06>号";
	Ei2[21] = "<COL_02><COL_03>栄2第号<COL_06>号";
	Ei2[22] = "<COL_02><COL_03>栄2級<COL_06>号";
	Ei2[23] = "<COL_02><COL_03>栄2級第<COL_06>号";
	Ei2[24] = "<COL_02><COL_03>栄2級第号<COL_06>号";
	Ei2[25] = "<COL_02><COL_03>栄<COL_06>号";
	Ei2[26] = "<COL_02><COL_03>栄普<COL_06>号";
	Ei2[27] = "<COL_02><COL_03>栄普め<COL_06>号";
	Ei2[28] = "<COL_02><COL_03>栄普め第<COL_06>号";
	Ei2[29] = "<COL_02><COL_03>栄普め第号<COL_06>号";
	Ei2[30] = "<COL_02><COL_03>栄普第<COL_06>号";
	Ei2[31] = "<COL_02><COL_03>栄普第号<COL_06>号";
	Ei2[32] = "<COL_02><COL_03>栄種<COL_06>号";
	Ei2[33] = "<COL_02><COL_03>栄種め<COL_06>号";
	Ei2[34] = "<COL_02><COL_03>栄種め第<COL_06>号";
	Ei2[35] = "<COL_02><COL_03>栄種め第号<COL_06>号";
	Ei2[36] = "<COL_02><COL_03>栄種第<COL_06>号";
	Ei2[37] = "<COL_02><COL_03>栄種第号<COL_06>号";
	Ei2[38] = "<COL_02><COL_03>栄第<COL_06>号";
	Ei2[39] = "<COL_02><COL_03>栄第号<COL_06>号";
	Ei2[40] = "け<COL_02><COL_03>栄2<COL_06>号";
	Ei2[41] = "け<COL_02><COL_03>栄2け<COL_06>号";
	Ei2[42] = "け<COL_02><COL_03>栄2け第<COL_06>号";
	Ei2[43] = "け<COL_02><COL_03>栄2け第号<COL_06>号";
	Ei2[44] = "け<COL_02><COL_03>栄2め<COL_06>号";
	Ei2[45] = "け<COL_02><COL_03>栄2め第<COL_06>号";
	Ei2[46] = "け<COL_02><COL_03>栄2め第号<COL_06>号";
	Ei2[47] = "け<COL_02><COL_03>栄2普<COL_06>号";
	Ei2[48] = "け<COL_02><COL_03>栄2普め<COL_06>号";
	Ei2[49] = "け<COL_02><COL_03>栄2普め第<COL_06>号";
	Ei2[50] = "け<COL_02><COL_03>栄2普め第号<COL_06>号";
	Ei2[51] = "け<COL_02><COL_03>栄2普第<COL_06>号";
	Ei2[52] = "け<COL_02><COL_03>栄2普第号<COL_06>号";
	Ei2[53] = "け<COL_02><COL_03>栄2種<COL_06>号";
	Ei2[54] = "け<COL_02><COL_03>栄2種め<COL_06>号";
	Ei2[55] = "け<COL_02><COL_03>栄2種め第<COL_06>号";
	Ei2[56] = "け<COL_02><COL_03>栄2種め第号<COL_06>号";
	Ei2[57] = "け<COL_02><COL_03>栄2種第<COL_06>号";
	Ei2[58] = "け<COL_02><COL_03>栄2種第号<COL_06>号";
	Ei2[59] = "け<COL_02><COL_03>栄2第<COL_06>号";
	Ei2[60] = "け<COL_02><COL_03>栄2第号<COL_06>号";
	Ei2[61] = "け<COL_02><COL_03>栄2級<COL_06>号";
	Ei2[62] = "け<COL_02><COL_03>栄2級第<COL_06>号";
	Ei2[63] = "け<COL_02><COL_03>栄2級第号<COL_06>号";
	Ei2[64] = "け<COL_02><COL_03>栄<COL_06>号";
	Ei2[65] = "け<COL_02><COL_03>栄普<COL_06>号";
	Ei2[66] = "け<COL_02><COL_03>栄普め<COL_06>号";
	Ei2[67] = "け<COL_02><COL_03>栄普め第<COL_06>号";
	Ei2[68] = "け<COL_02><COL_03>栄普め第号<COL_06>号";
	Ei2[69] = "け<COL_02><COL_03>栄普第<COL_06>号";
	Ei2[70] = "け<COL_02><COL_03>栄普第号<COL_06>号";
	Ei2[71] = "け<COL_02><COL_03>栄種<COL_06>号";
	Ei2[72] = "け<COL_02><COL_03>栄種め<COL_06>号";
	Ei2[73] = "け<COL_02><COL_03>栄種め第<COL_06>号";
	Ei2[74] = "け<COL_02><COL_03>栄種め第号<COL_06>号";
	Ei2[75] = "け<COL_02><COL_03>栄種第<COL_06>号";
	Ei2[76] = "け<COL_02><COL_03>栄種第号<COL_06>号";
	Ei2[77] = "け<COL_02><COL_03>栄第<COL_06>号";
	Ei2[78] = "け<COL_02><COL_03>栄第号<COL_06>号";
	Ei2[79] = "め<COL_02><COL_03>栄2<COL_06>号";
	Ei2[80] = "め<COL_02><COL_03>栄2け<COL_06>号";
	Ei2[81] = "め<COL_02><COL_03>栄2け第<COL_06>号";
	Ei2[82] = "め<COL_02><COL_03>栄2け第号<COL_06>号";
	Ei2[83] = "め<COL_02><COL_03>栄2め<COL_06>号";
	Ei2[84] = "め<COL_02><COL_03>栄2め第<COL_06>号";
	Ei2[85] = "め<COL_02><COL_03>栄2め第号<COL_06>号";
	Ei2[86] = "め<COL_02><COL_03>栄2普<COL_06>号";
	Ei2[87] = "め<COL_02><COL_03>栄2普め<COL_06>号";
	Ei2[88] = "め<COL_02><COL_03>栄2普め第<COL_06>号";
	Ei2[89] = "め<COL_02><COL_03>栄2普め第号<COL_06>号";
	Ei2[90] = "め<COL_02><COL_03>栄2普第<COL_06>号";
	Ei2[91] = "め<COL_02><COL_03>栄2普第号<COL_06>号";
	Ei2[92] = "め<COL_02><COL_03>栄2種<COL_06>号";
	Ei2[93] = "め<COL_02><COL_03>栄2種め<COL_06>号";
	Ei2[94] = "め<COL_02><COL_03>栄2種め第<COL_06>号";
	Ei2[95] = "め<COL_02><COL_03>栄2種め第号<COL_06>号";
	Ei2[96] = "め<COL_02><COL_03>栄2種第<COL_06>号";
	Ei2[97] = "め<COL_02><COL_03>栄2種第号<COL_06>号";
	Ei2[98] = "め<COL_02><COL_03>栄2第<COL_06>号";
	Ei2[99] = "め<COL_02><COL_03>栄2第号<COL_06>号";
	Ei2[100] = "め<COL_02><COL_03>栄2級<COL_06>号";
	Ei2[101] = "め<COL_02><COL_03>栄2級第<COL_06>号";
	Ei2[102] = "め<COL_02><COL_03>栄2級第号<COL_06>号";
	Ei2[103] = "め<COL_02><COL_03>栄<COL_06>号";
	Ei2[104] = "め<COL_02><COL_03>栄普<COL_06>号";
	Ei2[105] = "め<COL_02><COL_03>栄普め<COL_06>号";
	Ei2[106] = "め<COL_02><COL_03>栄普め第<COL_06>号";
	Ei2[107] = "め<COL_02><COL_03>栄普め第号<COL_06>号";
	Ei2[108] = "め<COL_02><COL_03>栄普第<COL_06>号";
	Ei2[109] = "め<COL_02><COL_03>栄普第号<COL_06>号";
	Ei2[110] = "め<COL_02><COL_03>栄種<COL_06>号";
	Ei2[111] = "め<COL_02><COL_03>栄種め<COL_06>号";
	Ei2[112] = "め<COL_02><COL_03>栄種め第<COL_06>号";
	Ei2[113] = "め<COL_02><COL_03>栄種め第号<COL_06>号";
	Ei2[114] = "め<COL_02><COL_03>栄種第<COL_06>号";
	Ei2[115] = "め<COL_02><COL_03>栄種第号<COL_06>号";
	Ei2[116] = "め<COL_02><COL_03>栄第<COL_06>号";
	Ei2[117] = "め<COL_02><COL_03>栄第号<COL_06>号";
}

# ------------------------------------------------------------------------------------------------------------------------

# 栄養教諭_臨時
function setEiRinArray(){
	EiRin[1] = "<COL_02><COL_03>栄<COL_06>号";
	EiRin[2] = "<COL_02><COL_03>栄臨<COL_06>号";
	EiRin[3] = "<COL_02><COL_03>栄臨第<COL_06>号";
	EiRin[4] = "<COL_02><COL_03>栄臨第号<COL_06>号";
	EiRin[5] = "け<COL_02><COL_03>栄<COL_06>号";
	EiRin[6] = "け<COL_02><COL_03>栄臨<COL_06>号";
	EiRin[7] = "け<COL_02><COL_03>栄臨第<COL_06>号";
	EiRin[8] = "け<COL_02><COL_03>栄臨第号<COL_06>号";
	EiRin[9] = "め<COL_02><COL_03>栄<COL_06>号";
	EiRin[10] = "め<COL_02><COL_03>栄臨<COL_06>号";
	EiRin[11] = "め<COL_02><COL_03>栄臨第<COL_06>号";
	EiRin[12] = "め<COL_02><COL_03>栄臨第号<COL_06>号";
}

# ------------------------------------------------------------------------------------------------------------------------

# 栄養教諭_特別
function setEiTokuArray(){
	EiToku[1] = "<COL_02><COL_03>栄<COL_06>号";
	EiToku[2] = "<COL_02><COL_03>栄特1<COL_06>号";
	EiToku[3] = "<COL_02><COL_03>栄特1第<COL_06>号";
	EiToku[4] = "<COL_02><COL_03>栄特1第号<COL_06>号";
	EiToku[5] = "<COL_02><COL_03>栄特2<COL_06>号";
	EiToku[6] = "<COL_02><COL_03>栄特2第<COL_06>号";
	EiToku[7] = "<COL_02><COL_03>栄特2第号<COL_06>号";
	EiToku[8] = "<COL_02><COL_03>栄特<COL_06>号";
	EiToku[9] = "<COL_02><COL_03>栄特第<COL_06>号";
	EiToku[10] = "<COL_02><COL_03>栄特第号<COL_06>号";
	EiToku[11] = "<COL_02><COL_03>栄第<COL_06>号";
	EiToku[12] = "<COL_02><COL_03>栄第号<COL_06>号";
	EiToku[13] = "け<COL_02><COL_03>栄<COL_06>号";
	EiToku[14] = "け<COL_02><COL_03>栄特1<COL_06>号";
	EiToku[15] = "け<COL_02><COL_03>栄特1第<COL_06>号";
	EiToku[16] = "け<COL_02><COL_03>栄特1第号<COL_06>号";
	EiToku[17] = "け<COL_02><COL_03>栄特2<COL_06>号";
	EiToku[18] = "け<COL_02><COL_03>栄特2第<COL_06>号";
	EiToku[19] = "け<COL_02><COL_03>栄特2第号<COL_06>号";
	EiToku[20] = "け<COL_02><COL_03>栄特<COL_06>号";
	EiToku[21] = "け<COL_02><COL_03>栄特第<COL_06>号";
	EiToku[22] = "け<COL_02><COL_03>栄特第号<COL_06>号";
	EiToku[23] = "け<COL_02><COL_03>栄第<COL_06>号";
	EiToku[24] = "け<COL_02><COL_03>栄第号<COL_06>号";
	EiToku[25] = "め<COL_02><COL_03>栄<COL_06>号";
	EiToku[26] = "め<COL_02><COL_03>栄特1<COL_06>号";
	EiToku[27] = "め<COL_02><COL_03>栄特1第<COL_06>号";
	EiToku[28] = "め<COL_02><COL_03>栄特1第号<COL_06>号";
	EiToku[29] = "め<COL_02><COL_03>栄特2<COL_06>号";
	EiToku[30] = "め<COL_02><COL_03>栄特2第<COL_06>号";
	EiToku[31] = "め<COL_02><COL_03>栄特2第号<COL_06>号";
	EiToku[32] = "め<COL_02><COL_03>栄特<COL_06>号";
	EiToku[33] = "め<COL_02><COL_03>栄特第<COL_06>号";
	EiToku[34] = "め<COL_02><COL_03>栄特第号<COL_06>号";
	EiToku[35] = "め<COL_02><COL_03>栄第<COL_06>号";
	EiToku[36] = "め<COL_02><COL_03>栄第号<COL_06>号";
}

# ------------------------------------------------------------------------------------------------------------------------

