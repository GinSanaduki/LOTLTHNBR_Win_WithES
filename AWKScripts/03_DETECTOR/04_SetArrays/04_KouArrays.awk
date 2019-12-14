#! /usr/bin/gawk
# 04_KouArrays.awk
# Import : AWKScripts/03_DETECTOR/04_SetArrays/04_KouArrays.awk

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

# 高等学校_専修
function setKouSenArray(){
	KouSen[1] = "<COL_02><COL_03>高<COL_06>号";
	KouSen[2] = "<COL_02><COL_03>高専<COL_06>号";
	KouSen[3] = "<COL_02><COL_03>高専修<COL_06>号";
	KouSen[4] = "<COL_02><COL_03>高専修第<COL_06>号";
	KouSen[5] = "<COL_02><COL_03>高専修第号<COL_06>号";
	KouSen[6] = "<COL_02><COL_03>高専種<COL_06>号";
	KouSen[7] = "<COL_02><COL_03>高専種第<COL_06>号";
	KouSen[8] = "<COL_02><COL_03>高専種第号<COL_06>号";
	KouSen[9] = "<COL_02><COL_03>高専第<COL_06>号";
	KouSen[10] = "<COL_02><COL_03>高専第号<COL_06>号";
	KouSen[11] = "<COL_02><COL_03>高第<COL_06>号";
	KouSen[12] = "<COL_02><COL_03>高第号<COL_06>号";
	KouSen[13] = "け<COL_02><COL_03>高<COL_06>号";
	KouSen[14] = "け<COL_02><COL_03>高専<COL_06>号";
	KouSen[15] = "け<COL_02><COL_03>高専修<COL_06>号";
	KouSen[16] = "け<COL_02><COL_03>高専修第<COL_06>号";
	KouSen[17] = "け<COL_02><COL_03>高専修第号<COL_06>号";
	KouSen[18] = "け<COL_02><COL_03>高専種<COL_06>号";
	KouSen[19] = "け<COL_02><COL_03>高専種第<COL_06>号";
	KouSen[20] = "け<COL_02><COL_03>高専種第号<COL_06>号";
	KouSen[21] = "け<COL_02><COL_03>高専第<COL_06>号";
	KouSen[22] = "け<COL_02><COL_03>高専第号<COL_06>号";
	KouSen[23] = "け<COL_02><COL_03>高第<COL_06>号";
	KouSen[24] = "け<COL_02><COL_03>高第号<COL_06>号";
	KouSen[25] = "め<COL_02><COL_03>高<COL_06>号";
	KouSen[26] = "め<COL_02><COL_03>高専<COL_06>号";
	KouSen[27] = "め<COL_02><COL_03>高専修<COL_06>号";
	KouSen[28] = "め<COL_02><COL_03>高専修第<COL_06>号";
	KouSen[29] = "め<COL_02><COL_03>高専修第号<COL_06>号";
	KouSen[30] = "め<COL_02><COL_03>高専種<COL_06>号";
	KouSen[31] = "め<COL_02><COL_03>高専種第<COL_06>号";
	KouSen[32] = "め<COL_02><COL_03>高専種第号<COL_06>号";
	KouSen[33] = "め<COL_02><COL_03>高専第<COL_06>号";
	KouSen[34] = "め<COL_02><COL_03>高専第号<COL_06>号";
	KouSen[35] = "め<COL_02><COL_03>高第<COL_06>号";
	KouSen[36] = "め<COL_02><COL_03>高第号<COL_06>号";
}

# ------------------------------------------------------------------------------------------------------------------------

# 高等学校_1種
function setKou1Array(){
	Kou1[1] = "<COL_02><COL_03>高1<COL_06>号";
	Kou1[2] = "<COL_02><COL_03>高1け<COL_06>号";
	Kou1[3] = "<COL_02><COL_03>高1け第<COL_06>号";
	Kou1[4] = "<COL_02><COL_03>高1け第号<COL_06>号";
	Kou1[5] = "<COL_02><COL_03>高1め<COL_06>号";
	Kou1[6] = "<COL_02><COL_03>高1め第<COL_06>号";
	Kou1[7] = "<COL_02><COL_03>高1め第号<COL_06>号";
	Kou1[8] = "<COL_02><COL_03>高1普<COL_06>号";
	Kou1[9] = "<COL_02><COL_03>高1普め<COL_06>号";
	Kou1[10] = "<COL_02><COL_03>高1普め第<COL_06>号";
	Kou1[11] = "<COL_02><COL_03>高1普め第号<COL_06>号";
	Kou1[12] = "<COL_02><COL_03>高1普第<COL_06>号";
	Kou1[13] = "<COL_02><COL_03>高1普第号<COL_06>号";
	Kou1[14] = "<COL_02><COL_03>高1種<COL_06>号";
	Kou1[15] = "<COL_02><COL_03>高1種め<COL_06>号";
	Kou1[16] = "<COL_02><COL_03>高1種め第<COL_06>号";
	Kou1[17] = "<COL_02><COL_03>高1種め第号<COL_06>号";
	Kou1[18] = "<COL_02><COL_03>高1種第<COL_06>号";
	Kou1[19] = "<COL_02><COL_03>高1種第号<COL_06>号";
	Kou1[20] = "<COL_02><COL_03>高1第<COL_06>号";
	Kou1[21] = "<COL_02><COL_03>高1第号<COL_06>号";
	Kou1[22] = "<COL_02><COL_03>高1級<COL_06>号";
	Kou1[23] = "<COL_02><COL_03>高1級第<COL_06>号";
	Kou1[24] = "<COL_02><COL_03>高1級第号<COL_06>号";
	Kou1[25] = "<COL_02><COL_03>高<COL_06>号";
	Kou1[26] = "<COL_02><COL_03>高普<COL_06>号";
	Kou1[27] = "<COL_02><COL_03>高普め<COL_06>号";
	Kou1[28] = "<COL_02><COL_03>高普め第<COL_06>号";
	Kou1[29] = "<COL_02><COL_03>高普め第号<COL_06>号";
	Kou1[30] = "<COL_02><COL_03>高普第<COL_06>号";
	Kou1[31] = "<COL_02><COL_03>高普第号<COL_06>号";
	Kou1[32] = "<COL_02><COL_03>高種<COL_06>号";
	Kou1[33] = "<COL_02><COL_03>高種め<COL_06>号";
	Kou1[34] = "<COL_02><COL_03>高種め第<COL_06>号";
	Kou1[35] = "<COL_02><COL_03>高種め第号<COL_06>号";
	Kou1[36] = "<COL_02><COL_03>高種第<COL_06>号";
	Kou1[37] = "<COL_02><COL_03>高種第号<COL_06>号";
	Kou1[38] = "<COL_02><COL_03>高第<COL_06>号";
	Kou1[39] = "<COL_02><COL_03>高第号<COL_06>号";
	Kou1[40] = "け<COL_02><COL_03>高1<COL_06>号";
	Kou1[41] = "け<COL_02><COL_03>高1け<COL_06>号";
	Kou1[42] = "け<COL_02><COL_03>高1け第<COL_06>号";
	Kou1[43] = "け<COL_02><COL_03>高1け第号<COL_06>号";
	Kou1[44] = "け<COL_02><COL_03>高1め<COL_06>号";
	Kou1[45] = "け<COL_02><COL_03>高1め第<COL_06>号";
	Kou1[46] = "け<COL_02><COL_03>高1め第号<COL_06>号";
	Kou1[47] = "け<COL_02><COL_03>高1普<COL_06>号";
	Kou1[48] = "け<COL_02><COL_03>高1普め<COL_06>号";
	Kou1[49] = "け<COL_02><COL_03>高1普め第<COL_06>号";
	Kou1[50] = "け<COL_02><COL_03>高1普め第号<COL_06>号";
	Kou1[51] = "け<COL_02><COL_03>高1普第<COL_06>号";
	Kou1[52] = "け<COL_02><COL_03>高1普第号<COL_06>号";
	Kou1[53] = "け<COL_02><COL_03>高1種<COL_06>号";
	Kou1[54] = "け<COL_02><COL_03>高1種め<COL_06>号";
	Kou1[55] = "け<COL_02><COL_03>高1種め第<COL_06>号";
	Kou1[56] = "け<COL_02><COL_03>高1種め第号<COL_06>号";
	Kou1[57] = "け<COL_02><COL_03>高1種第<COL_06>号";
	Kou1[58] = "け<COL_02><COL_03>高1種第号<COL_06>号";
	Kou1[59] = "け<COL_02><COL_03>高1第<COL_06>号";
	Kou1[60] = "け<COL_02><COL_03>高1第号<COL_06>号";
	Kou1[61] = "け<COL_02><COL_03>高1級<COL_06>号";
	Kou1[62] = "け<COL_02><COL_03>高1級第<COL_06>号";
	Kou1[63] = "け<COL_02><COL_03>高1級第号<COL_06>号";
	Kou1[64] = "け<COL_02><COL_03>高<COL_06>号";
	Kou1[65] = "け<COL_02><COL_03>高普<COL_06>号";
	Kou1[66] = "け<COL_02><COL_03>高普め<COL_06>号";
	Kou1[67] = "け<COL_02><COL_03>高普め第<COL_06>号";
	Kou1[68] = "け<COL_02><COL_03>高普め第号<COL_06>号";
	Kou1[69] = "け<COL_02><COL_03>高普第<COL_06>号";
	Kou1[70] = "け<COL_02><COL_03>高普第号<COL_06>号";
	Kou1[71] = "け<COL_02><COL_03>高種<COL_06>号";
	Kou1[72] = "け<COL_02><COL_03>高種め<COL_06>号";
	Kou1[73] = "け<COL_02><COL_03>高種め第<COL_06>号";
	Kou1[74] = "け<COL_02><COL_03>高種め第号<COL_06>号";
	Kou1[75] = "け<COL_02><COL_03>高種第<COL_06>号";
	Kou1[76] = "け<COL_02><COL_03>高種第号<COL_06>号";
	Kou1[77] = "け<COL_02><COL_03>高第<COL_06>号";
	Kou1[78] = "け<COL_02><COL_03>高第号<COL_06>号";
	Kou1[79] = "め<COL_02><COL_03>高1<COL_06>号";
	Kou1[80] = "め<COL_02><COL_03>高1け<COL_06>号";
	Kou1[81] = "め<COL_02><COL_03>高1け第<COL_06>号";
	Kou1[82] = "め<COL_02><COL_03>高1け第号<COL_06>号";
	Kou1[83] = "め<COL_02><COL_03>高1め<COL_06>号";
	Kou1[84] = "め<COL_02><COL_03>高1め第<COL_06>号";
	Kou1[85] = "め<COL_02><COL_03>高1め第号<COL_06>号";
	Kou1[86] = "め<COL_02><COL_03>高1普<COL_06>号";
	Kou1[87] = "め<COL_02><COL_03>高1普め<COL_06>号";
	Kou1[88] = "め<COL_02><COL_03>高1普め第<COL_06>号";
	Kou1[89] = "め<COL_02><COL_03>高1普め第号<COL_06>号";
	Kou1[90] = "め<COL_02><COL_03>高1普第<COL_06>号";
	Kou1[91] = "め<COL_02><COL_03>高1普第号<COL_06>号";
	Kou1[92] = "め<COL_02><COL_03>高1種<COL_06>号";
	Kou1[93] = "め<COL_02><COL_03>高1種め<COL_06>号";
	Kou1[94] = "め<COL_02><COL_03>高1種め第<COL_06>号";
	Kou1[95] = "め<COL_02><COL_03>高1種め第号<COL_06>号";
	Kou1[96] = "め<COL_02><COL_03>高1種第<COL_06>号";
	Kou1[97] = "め<COL_02><COL_03>高1種第号<COL_06>号";
	Kou1[98] = "め<COL_02><COL_03>高1第<COL_06>号";
	Kou1[99] = "め<COL_02><COL_03>高1第号<COL_06>号";
	Kou1[100] = "め<COL_02><COL_03>高1級<COL_06>号";
	Kou1[101] = "め<COL_02><COL_03>高1級第<COL_06>号";
	Kou1[102] = "め<COL_02><COL_03>高1級第号<COL_06>号";
	Kou1[103] = "め<COL_02><COL_03>高<COL_06>号";
	Kou1[104] = "め<COL_02><COL_03>高普<COL_06>号";
	Kou1[105] = "め<COL_02><COL_03>高普め<COL_06>号";
	Kou1[106] = "め<COL_02><COL_03>高普め第<COL_06>号";
	Kou1[107] = "め<COL_02><COL_03>高普め第号<COL_06>号";
	Kou1[108] = "め<COL_02><COL_03>高普第<COL_06>号";
	Kou1[109] = "め<COL_02><COL_03>高普第号<COL_06>号";
	Kou1[110] = "め<COL_02><COL_03>高種<COL_06>号";
	Kou1[111] = "め<COL_02><COL_03>高種め<COL_06>号";
	Kou1[112] = "め<COL_02><COL_03>高種め第<COL_06>号";
	Kou1[113] = "め<COL_02><COL_03>高種め第号<COL_06>号";
	Kou1[114] = "め<COL_02><COL_03>高種第<COL_06>号";
	Kou1[115] = "め<COL_02><COL_03>高種第号<COL_06>号";
	Kou1[116] = "め<COL_02><COL_03>高第<COL_06>号";
	Kou1[117] = "め<COL_02><COL_03>高第号<COL_06>号";
}

# ------------------------------------------------------------------------------------------------------------------------

# 高等学校_2種
function setKou2Array(){
	Kou2[1] = "<COL_02><COL_03>高2<COL_06>号";
	Kou2[2] = "<COL_02><COL_03>高2け<COL_06>号";
	Kou2[3] = "<COL_02><COL_03>高2け第<COL_06>号";
	Kou2[4] = "<COL_02><COL_03>高2け第号<COL_06>号";
	Kou2[5] = "<COL_02><COL_03>高2め<COL_06>号";
	Kou2[6] = "<COL_02><COL_03>高2め第<COL_06>号";
	Kou2[7] = "<COL_02><COL_03>高2め第号<COL_06>号";
	Kou2[8] = "<COL_02><COL_03>高2普<COL_06>号";
	Kou2[9] = "<COL_02><COL_03>高2普め<COL_06>号";
	Kou2[10] = "<COL_02><COL_03>高2普め第<COL_06>号";
	Kou2[11] = "<COL_02><COL_03>高2普め第号<COL_06>号";
	Kou2[12] = "<COL_02><COL_03>高2普第<COL_06>号";
	Kou2[13] = "<COL_02><COL_03>高2普第号<COL_06>号";
	Kou2[14] = "<COL_02><COL_03>高2種<COL_06>号";
	Kou2[15] = "<COL_02><COL_03>高2種め<COL_06>号";
	Kou2[16] = "<COL_02><COL_03>高2種め第<COL_06>号";
	Kou2[17] = "<COL_02><COL_03>高2種め第号<COL_06>号";
	Kou2[18] = "<COL_02><COL_03>高2種第<COL_06>号";
	Kou2[19] = "<COL_02><COL_03>高2種第号<COL_06>号";
	Kou2[20] = "<COL_02><COL_03>高2第<COL_06>号";
	Kou2[21] = "<COL_02><COL_03>高2第号<COL_06>号";
	Kou2[22] = "<COL_02><COL_03>高2級<COL_06>号";
	Kou2[23] = "<COL_02><COL_03>高2級第<COL_06>号";
	Kou2[24] = "<COL_02><COL_03>高2級第号<COL_06>号";
	Kou2[25] = "<COL_02><COL_03>高<COL_06>号";
	Kou2[26] = "<COL_02><COL_03>高普<COL_06>号";
	Kou2[27] = "<COL_02><COL_03>高普め<COL_06>号";
	Kou2[28] = "<COL_02><COL_03>高普め第<COL_06>号";
	Kou2[29] = "<COL_02><COL_03>高普め第号<COL_06>号";
	Kou2[30] = "<COL_02><COL_03>高普第<COL_06>号";
	Kou2[31] = "<COL_02><COL_03>高普第号<COL_06>号";
	Kou2[32] = "<COL_02><COL_03>高種<COL_06>号";
	Kou2[33] = "<COL_02><COL_03>高種め<COL_06>号";
	Kou2[34] = "<COL_02><COL_03>高種め第<COL_06>号";
	Kou2[35] = "<COL_02><COL_03>高種め第号<COL_06>号";
	Kou2[36] = "<COL_02><COL_03>高種第<COL_06>号";
	Kou2[37] = "<COL_02><COL_03>高種第号<COL_06>号";
	Kou2[38] = "<COL_02><COL_03>高第<COL_06>号";
	Kou2[39] = "<COL_02><COL_03>高第号<COL_06>号";
	Kou2[40] = "け<COL_02><COL_03>高2<COL_06>号";
	Kou2[41] = "け<COL_02><COL_03>高2け<COL_06>号";
	Kou2[42] = "け<COL_02><COL_03>高2け第<COL_06>号";
	Kou2[43] = "け<COL_02><COL_03>高2け第号<COL_06>号";
	Kou2[44] = "け<COL_02><COL_03>高2め<COL_06>号";
	Kou2[45] = "け<COL_02><COL_03>高2め第<COL_06>号";
	Kou2[46] = "け<COL_02><COL_03>高2め第号<COL_06>号";
	Kou2[47] = "け<COL_02><COL_03>高2普<COL_06>号";
	Kou2[48] = "け<COL_02><COL_03>高2普め<COL_06>号";
	Kou2[49] = "け<COL_02><COL_03>高2普め第<COL_06>号";
	Kou2[50] = "け<COL_02><COL_03>高2普め第号<COL_06>号";
	Kou2[51] = "け<COL_02><COL_03>高2普第<COL_06>号";
	Kou2[52] = "け<COL_02><COL_03>高2普第号<COL_06>号";
	Kou2[53] = "け<COL_02><COL_03>高2種<COL_06>号";
	Kou2[54] = "け<COL_02><COL_03>高2種め<COL_06>号";
	Kou2[55] = "け<COL_02><COL_03>高2種め第<COL_06>号";
	Kou2[56] = "け<COL_02><COL_03>高2種め第号<COL_06>号";
	Kou2[57] = "け<COL_02><COL_03>高2種第<COL_06>号";
	Kou2[58] = "け<COL_02><COL_03>高2種第号<COL_06>号";
	Kou2[59] = "け<COL_02><COL_03>高2第<COL_06>号";
	Kou2[60] = "け<COL_02><COL_03>高2第号<COL_06>号";
	Kou2[61] = "け<COL_02><COL_03>高2級<COL_06>号";
	Kou2[62] = "け<COL_02><COL_03>高2級第<COL_06>号";
	Kou2[63] = "け<COL_02><COL_03>高2級第号<COL_06>号";
	Kou2[64] = "け<COL_02><COL_03>高<COL_06>号";
	Kou2[65] = "け<COL_02><COL_03>高普<COL_06>号";
	Kou2[66] = "け<COL_02><COL_03>高普め<COL_06>号";
	Kou2[67] = "け<COL_02><COL_03>高普め第<COL_06>号";
	Kou2[68] = "け<COL_02><COL_03>高普め第号<COL_06>号";
	Kou2[69] = "け<COL_02><COL_03>高普第<COL_06>号";
	Kou2[70] = "け<COL_02><COL_03>高普第号<COL_06>号";
	Kou2[71] = "け<COL_02><COL_03>高種<COL_06>号";
	Kou2[72] = "け<COL_02><COL_03>高種め<COL_06>号";
	Kou2[73] = "け<COL_02><COL_03>高種め第<COL_06>号";
	Kou2[74] = "け<COL_02><COL_03>高種め第号<COL_06>号";
	Kou2[75] = "け<COL_02><COL_03>高種第<COL_06>号";
	Kou2[76] = "け<COL_02><COL_03>高種第号<COL_06>号";
	Kou2[77] = "け<COL_02><COL_03>高第<COL_06>号";
	Kou2[78] = "け<COL_02><COL_03>高第号<COL_06>号";
	Kou2[79] = "め<COL_02><COL_03>高2<COL_06>号";
	Kou2[80] = "め<COL_02><COL_03>高2け<COL_06>号";
	Kou2[81] = "め<COL_02><COL_03>高2け第<COL_06>号";
	Kou2[82] = "め<COL_02><COL_03>高2け第号<COL_06>号";
	Kou2[83] = "め<COL_02><COL_03>高2め<COL_06>号";
	Kou2[84] = "め<COL_02><COL_03>高2め第<COL_06>号";
	Kou2[85] = "め<COL_02><COL_03>高2め第号<COL_06>号";
	Kou2[86] = "め<COL_02><COL_03>高2普<COL_06>号";
	Kou2[87] = "め<COL_02><COL_03>高2普め<COL_06>号";
	Kou2[88] = "め<COL_02><COL_03>高2普め第<COL_06>号";
	Kou2[89] = "め<COL_02><COL_03>高2普め第号<COL_06>号";
	Kou2[90] = "め<COL_02><COL_03>高2普第<COL_06>号";
	Kou2[91] = "め<COL_02><COL_03>高2普第号<COL_06>号";
	Kou2[92] = "め<COL_02><COL_03>高2種<COL_06>号";
	Kou2[93] = "め<COL_02><COL_03>高2種め<COL_06>号";
	Kou2[94] = "め<COL_02><COL_03>高2種め第<COL_06>号";
	Kou2[95] = "め<COL_02><COL_03>高2種め第号<COL_06>号";
	Kou2[96] = "め<COL_02><COL_03>高2種第<COL_06>号";
	Kou2[97] = "め<COL_02><COL_03>高2種第号<COL_06>号";
	Kou2[98] = "め<COL_02><COL_03>高2第<COL_06>号";
	Kou2[99] = "め<COL_02><COL_03>高2第号<COL_06>号";
	Kou2[100] = "め<COL_02><COL_03>高2級<COL_06>号";
	Kou2[101] = "め<COL_02><COL_03>高2級第<COL_06>号";
	Kou2[102] = "め<COL_02><COL_03>高2級第号<COL_06>号";
	Kou2[103] = "め<COL_02><COL_03>高<COL_06>号";
	Kou2[104] = "め<COL_02><COL_03>高普<COL_06>号";
	Kou2[105] = "め<COL_02><COL_03>高普め<COL_06>号";
	Kou2[106] = "め<COL_02><COL_03>高普め第<COL_06>号";
	Kou2[107] = "め<COL_02><COL_03>高普め第号<COL_06>号";
	Kou2[108] = "め<COL_02><COL_03>高普第<COL_06>号";
	Kou2[109] = "め<COL_02><COL_03>高普第号<COL_06>号";
	Kou2[110] = "め<COL_02><COL_03>高種<COL_06>号";
	Kou2[111] = "め<COL_02><COL_03>高種め<COL_06>号";
	Kou2[112] = "め<COL_02><COL_03>高種め第<COL_06>号";
	Kou2[113] = "め<COL_02><COL_03>高種め第号<COL_06>号";
	Kou2[114] = "め<COL_02><COL_03>高種第<COL_06>号";
	Kou2[115] = "め<COL_02><COL_03>高種第号<COL_06>号";
	Kou2[116] = "め<COL_02><COL_03>高第<COL_06>号";
	Kou2[117] = "め<COL_02><COL_03>高第号<COL_06>号";
}

# ------------------------------------------------------------------------------------------------------------------------

# 高等学校_臨時
function setKouRinArray(){
	KouRin[1] = "<COL_02><COL_03>高<COL_06>号";
	KouRin[2] = "<COL_02><COL_03>高臨<COL_06>号";
	KouRin[3] = "<COL_02><COL_03>高臨第<COL_06>号";
	KouRin[4] = "<COL_02><COL_03>高臨第号<COL_06>号";
	KouRin[5] = "け<COL_02><COL_03>高<COL_06>号";
	KouRin[6] = "け<COL_02><COL_03>高臨<COL_06>号";
	KouRin[7] = "け<COL_02><COL_03>高臨第<COL_06>号";
	KouRin[8] = "け<COL_02><COL_03>高臨第号<COL_06>号";
	KouRin[9] = "め<COL_02><COL_03>高<COL_06>号";
	KouRin[10] = "め<COL_02><COL_03>高臨<COL_06>号";
	KouRin[11] = "め<COL_02><COL_03>高臨第<COL_06>号";
	KouRin[12] = "め<COL_02><COL_03>高臨第号<COL_06>号";
}

# ------------------------------------------------------------------------------------------------------------------------

# 高等学校_特別
function setKouTokuArray(){
	KouToku[1] = "<COL_02><COL_03>高<COL_06>号";
	KouToku[2] = "<COL_02><COL_03>高特1<COL_06>号";
	KouToku[3] = "<COL_02><COL_03>高特1第<COL_06>号";
	KouToku[4] = "<COL_02><COL_03>高特1第号<COL_06>号";
	KouToku[5] = "<COL_02><COL_03>高特2<COL_06>号";
	KouToku[6] = "<COL_02><COL_03>高特2第<COL_06>号";
	KouToku[7] = "<COL_02><COL_03>高特2第号<COL_06>号";
	KouToku[8] = "<COL_02><COL_03>高特<COL_06>号";
	KouToku[9] = "<COL_02><COL_03>高特第<COL_06>号";
	KouToku[10] = "<COL_02><COL_03>高特第号<COL_06>号";
	KouToku[11] = "<COL_02><COL_03>高第<COL_06>号";
	KouToku[12] = "<COL_02><COL_03>高第号<COL_06>号";
	KouToku[13] = "け<COL_02><COL_03>高<COL_06>号";
	KouToku[14] = "け<COL_02><COL_03>高特1<COL_06>号";
	KouToku[15] = "け<COL_02><COL_03>高特1第<COL_06>号";
	KouToku[16] = "け<COL_02><COL_03>高特1第号<COL_06>号";
	KouToku[17] = "け<COL_02><COL_03>高特2<COL_06>号";
	KouToku[18] = "け<COL_02><COL_03>高特2第<COL_06>号";
	KouToku[19] = "け<COL_02><COL_03>高特2第号<COL_06>号";
	KouToku[20] = "け<COL_02><COL_03>高特<COL_06>号";
	KouToku[21] = "け<COL_02><COL_03>高特第<COL_06>号";
	KouToku[22] = "け<COL_02><COL_03>高特第号<COL_06>号";
	KouToku[23] = "け<COL_02><COL_03>高第<COL_06>号";
	KouToku[24] = "け<COL_02><COL_03>高第号<COL_06>号";
	KouToku[25] = "め<COL_02><COL_03>高<COL_06>号";
	KouToku[26] = "め<COL_02><COL_03>高特1<COL_06>号";
	KouToku[27] = "め<COL_02><COL_03>高特1第<COL_06>号";
	KouToku[28] = "め<COL_02><COL_03>高特1第号<COL_06>号";
	KouToku[29] = "め<COL_02><COL_03>高特2<COL_06>号";
	KouToku[30] = "め<COL_02><COL_03>高特2第<COL_06>号";
	KouToku[31] = "め<COL_02><COL_03>高特2第号<COL_06>号";
	KouToku[32] = "め<COL_02><COL_03>高特<COL_06>号";
	KouToku[33] = "め<COL_02><COL_03>高特第<COL_06>号";
	KouToku[34] = "め<COL_02><COL_03>高特第号<COL_06>号";
	KouToku[35] = "め<COL_02><COL_03>高第<COL_06>号";
	KouToku[36] = "め<COL_02><COL_03>高第号<COL_06>号";
}

# ------------------------------------------------------------------------------------------------------------------------

