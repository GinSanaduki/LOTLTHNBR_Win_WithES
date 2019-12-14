#! /usr/bin/gawk
# 03_ChuuArrays.awk
# Import : AWKScripts/03_DETECTOR/04_SetArrays/03_ChuuArrays.awk

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

# 中学校_専修
function setChuuSenArray(){
	ChuuSen[1] = "<COL_02><COL_03>中<COL_06>号";
	ChuuSen[2] = "<COL_02><COL_03>中専<COL_06>号";
	ChuuSen[3] = "<COL_02><COL_03>中専修<COL_06>号";
	ChuuSen[4] = "<COL_02><COL_03>中専修第<COL_06>号";
	ChuuSen[5] = "<COL_02><COL_03>中専修第号<COL_06>号";
	ChuuSen[6] = "<COL_02><COL_03>中専種<COL_06>号";
	ChuuSen[7] = "<COL_02><COL_03>中専種第<COL_06>号";
	ChuuSen[8] = "<COL_02><COL_03>中専種第号<COL_06>号";
	ChuuSen[9] = "<COL_02><COL_03>中専第<COL_06>号";
	ChuuSen[10] = "<COL_02><COL_03>中専第号<COL_06>号";
	ChuuSen[11] = "<COL_02><COL_03>中第<COL_06>号";
	ChuuSen[12] = "<COL_02><COL_03>中第号<COL_06>号";
	ChuuSen[13] = "け<COL_02><COL_03>中<COL_06>号";
	ChuuSen[14] = "け<COL_02><COL_03>中専<COL_06>号";
	ChuuSen[15] = "け<COL_02><COL_03>中専修<COL_06>号";
	ChuuSen[16] = "け<COL_02><COL_03>中専修第<COL_06>号";
	ChuuSen[17] = "け<COL_02><COL_03>中専修第号<COL_06>号";
	ChuuSen[18] = "け<COL_02><COL_03>中専種<COL_06>号";
	ChuuSen[19] = "け<COL_02><COL_03>中専種第<COL_06>号";
	ChuuSen[20] = "け<COL_02><COL_03>中専種第号<COL_06>号";
	ChuuSen[21] = "け<COL_02><COL_03>中専第<COL_06>号";
	ChuuSen[22] = "け<COL_02><COL_03>中専第号<COL_06>号";
	ChuuSen[23] = "け<COL_02><COL_03>中第<COL_06>号";
	ChuuSen[24] = "け<COL_02><COL_03>中第号<COL_06>号";
	ChuuSen[25] = "め<COL_02><COL_03>中<COL_06>号";
	ChuuSen[26] = "め<COL_02><COL_03>中専<COL_06>号";
	ChuuSen[27] = "め<COL_02><COL_03>中専修<COL_06>号";
	ChuuSen[28] = "め<COL_02><COL_03>中専修第<COL_06>号";
	ChuuSen[29] = "め<COL_02><COL_03>中専修第号<COL_06>号";
	ChuuSen[30] = "め<COL_02><COL_03>中専種<COL_06>号";
	ChuuSen[31] = "め<COL_02><COL_03>中専種第<COL_06>号";
	ChuuSen[32] = "め<COL_02><COL_03>中専種第号<COL_06>号";
	ChuuSen[33] = "め<COL_02><COL_03>中専第<COL_06>号";
	ChuuSen[34] = "め<COL_02><COL_03>中専第号<COL_06>号";
	ChuuSen[35] = "め<COL_02><COL_03>中第<COL_06>号";
	ChuuSen[36] = "め<COL_02><COL_03>中第号<COL_06>号";
}

# ------------------------------------------------------------------------------------------------------------------------

# 中学校_1種
function setChuu1Array(){
	Chuu1[1] = "<COL_02><COL_03>中1<COL_06>号";
	Chuu1[2] = "<COL_02><COL_03>中1け<COL_06>号";
	Chuu1[3] = "<COL_02><COL_03>中1け第<COL_06>号";
	Chuu1[4] = "<COL_02><COL_03>中1け第号<COL_06>号";
	Chuu1[5] = "<COL_02><COL_03>中1め<COL_06>号";
	Chuu1[6] = "<COL_02><COL_03>中1め第<COL_06>号";
	Chuu1[7] = "<COL_02><COL_03>中1め第号<COL_06>号";
	Chuu1[8] = "<COL_02><COL_03>中1普<COL_06>号";
	Chuu1[9] = "<COL_02><COL_03>中1普め<COL_06>号";
	Chuu1[10] = "<COL_02><COL_03>中1普め第<COL_06>号";
	Chuu1[11] = "<COL_02><COL_03>中1普め第号<COL_06>号";
	Chuu1[12] = "<COL_02><COL_03>中1普第<COL_06>号";
	Chuu1[13] = "<COL_02><COL_03>中1普第号<COL_06>号";
	Chuu1[14] = "<COL_02><COL_03>中1種<COL_06>号";
	Chuu1[15] = "<COL_02><COL_03>中1種め<COL_06>号";
	Chuu1[16] = "<COL_02><COL_03>中1種め第<COL_06>号";
	Chuu1[17] = "<COL_02><COL_03>中1種め第号<COL_06>号";
	Chuu1[18] = "<COL_02><COL_03>中1種第<COL_06>号";
	Chuu1[19] = "<COL_02><COL_03>中1種第号<COL_06>号";
	Chuu1[20] = "<COL_02><COL_03>中1第<COL_06>号";
	Chuu1[21] = "<COL_02><COL_03>中1第号<COL_06>号";
	Chuu1[22] = "<COL_02><COL_03>中1級<COL_06>号";
	Chuu1[23] = "<COL_02><COL_03>中1級第<COL_06>号";
	Chuu1[24] = "<COL_02><COL_03>中1級第号<COL_06>号";
	Chuu1[25] = "<COL_02><COL_03>中<COL_06>号";
	Chuu1[26] = "<COL_02><COL_03>中普<COL_06>号";
	Chuu1[27] = "<COL_02><COL_03>中普め<COL_06>号";
	Chuu1[28] = "<COL_02><COL_03>中普め第<COL_06>号";
	Chuu1[29] = "<COL_02><COL_03>中普め第号<COL_06>号";
	Chuu1[30] = "<COL_02><COL_03>中普第<COL_06>号";
	Chuu1[31] = "<COL_02><COL_03>中普第号<COL_06>号";
	Chuu1[32] = "<COL_02><COL_03>中種<COL_06>号";
	Chuu1[33] = "<COL_02><COL_03>中種め<COL_06>号";
	Chuu1[34] = "<COL_02><COL_03>中種め第<COL_06>号";
	Chuu1[35] = "<COL_02><COL_03>中種め第号<COL_06>号";
	Chuu1[36] = "<COL_02><COL_03>中種第<COL_06>号";
	Chuu1[37] = "<COL_02><COL_03>中種第号<COL_06>号";
	Chuu1[38] = "<COL_02><COL_03>中第<COL_06>号";
	Chuu1[39] = "<COL_02><COL_03>中第号<COL_06>号";
	Chuu1[40] = "け<COL_02><COL_03>中1<COL_06>号";
	Chuu1[41] = "け<COL_02><COL_03>中1け<COL_06>号";
	Chuu1[42] = "け<COL_02><COL_03>中1け第<COL_06>号";
	Chuu1[43] = "け<COL_02><COL_03>中1け第号<COL_06>号";
	Chuu1[44] = "け<COL_02><COL_03>中1め<COL_06>号";
	Chuu1[45] = "け<COL_02><COL_03>中1め第<COL_06>号";
	Chuu1[46] = "け<COL_02><COL_03>中1め第号<COL_06>号";
	Chuu1[47] = "け<COL_02><COL_03>中1普<COL_06>号";
	Chuu1[48] = "け<COL_02><COL_03>中1普め<COL_06>号";
	Chuu1[49] = "け<COL_02><COL_03>中1普め第<COL_06>号";
	Chuu1[50] = "け<COL_02><COL_03>中1普め第号<COL_06>号";
	Chuu1[51] = "け<COL_02><COL_03>中1普第<COL_06>号";
	Chuu1[52] = "け<COL_02><COL_03>中1普第号<COL_06>号";
	Chuu1[53] = "け<COL_02><COL_03>中1種<COL_06>号";
	Chuu1[54] = "け<COL_02><COL_03>中1種め<COL_06>号";
	Chuu1[55] = "け<COL_02><COL_03>中1種め第<COL_06>号";
	Chuu1[56] = "け<COL_02><COL_03>中1種め第号<COL_06>号";
	Chuu1[57] = "け<COL_02><COL_03>中1種第<COL_06>号";
	Chuu1[58] = "け<COL_02><COL_03>中1種第号<COL_06>号";
	Chuu1[59] = "け<COL_02><COL_03>中1第<COL_06>号";
	Chuu1[60] = "け<COL_02><COL_03>中1第号<COL_06>号";
	Chuu1[61] = "け<COL_02><COL_03>中1級<COL_06>号";
	Chuu1[62] = "け<COL_02><COL_03>中1級第<COL_06>号";
	Chuu1[63] = "け<COL_02><COL_03>中1級第号<COL_06>号";
	Chuu1[64] = "け<COL_02><COL_03>中<COL_06>号";
	Chuu1[65] = "け<COL_02><COL_03>中普<COL_06>号";
	Chuu1[66] = "け<COL_02><COL_03>中普め<COL_06>号";
	Chuu1[67] = "け<COL_02><COL_03>中普め第<COL_06>号";
	Chuu1[68] = "け<COL_02><COL_03>中普め第号<COL_06>号";
	Chuu1[69] = "け<COL_02><COL_03>中普第<COL_06>号";
	Chuu1[70] = "け<COL_02><COL_03>中普第号<COL_06>号";
	Chuu1[71] = "け<COL_02><COL_03>中種<COL_06>号";
	Chuu1[72] = "け<COL_02><COL_03>中種め<COL_06>号";
	Chuu1[73] = "け<COL_02><COL_03>中種め第<COL_06>号";
	Chuu1[74] = "け<COL_02><COL_03>中種め第号<COL_06>号";
	Chuu1[75] = "け<COL_02><COL_03>中種第<COL_06>号";
	Chuu1[76] = "け<COL_02><COL_03>中種第号<COL_06>号";
	Chuu1[77] = "け<COL_02><COL_03>中第<COL_06>号";
	Chuu1[78] = "け<COL_02><COL_03>中第号<COL_06>号";
	Chuu1[79] = "め<COL_02><COL_03>中1<COL_06>号";
	Chuu1[80] = "め<COL_02><COL_03>中1け<COL_06>号";
	Chuu1[81] = "め<COL_02><COL_03>中1け第<COL_06>号";
	Chuu1[82] = "め<COL_02><COL_03>中1け第号<COL_06>号";
	Chuu1[83] = "め<COL_02><COL_03>中1め<COL_06>号";
	Chuu1[84] = "め<COL_02><COL_03>中1め第<COL_06>号";
	Chuu1[85] = "め<COL_02><COL_03>中1め第号<COL_06>号";
	Chuu1[86] = "め<COL_02><COL_03>中1普<COL_06>号";
	Chuu1[87] = "め<COL_02><COL_03>中1普め<COL_06>号";
	Chuu1[88] = "め<COL_02><COL_03>中1普め第<COL_06>号";
	Chuu1[89] = "め<COL_02><COL_03>中1普め第号<COL_06>号";
	Chuu1[90] = "め<COL_02><COL_03>中1普第<COL_06>号";
	Chuu1[91] = "め<COL_02><COL_03>中1普第号<COL_06>号";
	Chuu1[92] = "め<COL_02><COL_03>中1種<COL_06>号";
	Chuu1[93] = "め<COL_02><COL_03>中1種め<COL_06>号";
	Chuu1[94] = "め<COL_02><COL_03>中1種め第<COL_06>号";
	Chuu1[95] = "め<COL_02><COL_03>中1種め第号<COL_06>号";
	Chuu1[96] = "め<COL_02><COL_03>中1種第<COL_06>号";
	Chuu1[97] = "め<COL_02><COL_03>中1種第号<COL_06>号";
	Chuu1[98] = "め<COL_02><COL_03>中1第<COL_06>号";
	Chuu1[99] = "め<COL_02><COL_03>中1第号<COL_06>号";
	Chuu1[100] = "め<COL_02><COL_03>中1級<COL_06>号";
	Chuu1[101] = "め<COL_02><COL_03>中1級第<COL_06>号";
	Chuu1[102] = "め<COL_02><COL_03>中1級第号<COL_06>号";
	Chuu1[103] = "め<COL_02><COL_03>中<COL_06>号";
	Chuu1[104] = "め<COL_02><COL_03>中普<COL_06>号";
	Chuu1[105] = "め<COL_02><COL_03>中普め<COL_06>号";
	Chuu1[106] = "め<COL_02><COL_03>中普め第<COL_06>号";
	Chuu1[107] = "め<COL_02><COL_03>中普め第号<COL_06>号";
	Chuu1[108] = "め<COL_02><COL_03>中普第<COL_06>号";
	Chuu1[109] = "め<COL_02><COL_03>中普第号<COL_06>号";
	Chuu1[110] = "め<COL_02><COL_03>中種<COL_06>号";
	Chuu1[111] = "め<COL_02><COL_03>中種め<COL_06>号";
	Chuu1[112] = "め<COL_02><COL_03>中種め第<COL_06>号";
	Chuu1[113] = "め<COL_02><COL_03>中種め第号<COL_06>号";
	Chuu1[114] = "め<COL_02><COL_03>中種第<COL_06>号";
	Chuu1[115] = "め<COL_02><COL_03>中種第号<COL_06>号";
	Chuu1[116] = "め<COL_02><COL_03>中第<COL_06>号";
	Chuu1[117] = "め<COL_02><COL_03>中第号<COL_06>号";
}

# ------------------------------------------------------------------------------------------------------------------------

# 中学校_2種
function setChuu2Array(){
	Chuu2[1] = "<COL_02><COL_03>中2<COL_06>号";
	Chuu2[2] = "<COL_02><COL_03>中2け<COL_06>号";
	Chuu2[3] = "<COL_02><COL_03>中2け第<COL_06>号";
	Chuu2[4] = "<COL_02><COL_03>中2け第号<COL_06>号";
	Chuu2[5] = "<COL_02><COL_03>中2め<COL_06>号";
	Chuu2[6] = "<COL_02><COL_03>中2め第<COL_06>号";
	Chuu2[7] = "<COL_02><COL_03>中2め第号<COL_06>号";
	Chuu2[8] = "<COL_02><COL_03>中2普<COL_06>号";
	Chuu2[9] = "<COL_02><COL_03>中2普め<COL_06>号";
	Chuu2[10] = "<COL_02><COL_03>中2普め第<COL_06>号";
	Chuu2[11] = "<COL_02><COL_03>中2普め第号<COL_06>号";
	Chuu2[12] = "<COL_02><COL_03>中2普第<COL_06>号";
	Chuu2[13] = "<COL_02><COL_03>中2普第号<COL_06>号";
	Chuu2[14] = "<COL_02><COL_03>中2種<COL_06>号";
	Chuu2[15] = "<COL_02><COL_03>中2種め<COL_06>号";
	Chuu2[16] = "<COL_02><COL_03>中2種め第<COL_06>号";
	Chuu2[17] = "<COL_02><COL_03>中2種め第号<COL_06>号";
	Chuu2[18] = "<COL_02><COL_03>中2種第<COL_06>号";
	Chuu2[19] = "<COL_02><COL_03>中2種第号<COL_06>号";
	Chuu2[20] = "<COL_02><COL_03>中2第<COL_06>号";
	Chuu2[21] = "<COL_02><COL_03>中2第号<COL_06>号";
	Chuu2[22] = "<COL_02><COL_03>中2級<COL_06>号";
	Chuu2[23] = "<COL_02><COL_03>中2級第<COL_06>号";
	Chuu2[24] = "<COL_02><COL_03>中2級第号<COL_06>号";
	Chuu2[25] = "<COL_02><COL_03>中<COL_06>号";
	Chuu2[26] = "<COL_02><COL_03>中普<COL_06>号";
	Chuu2[27] = "<COL_02><COL_03>中普め<COL_06>号";
	Chuu2[28] = "<COL_02><COL_03>中普め第<COL_06>号";
	Chuu2[29] = "<COL_02><COL_03>中普め第号<COL_06>号";
	Chuu2[30] = "<COL_02><COL_03>中普第<COL_06>号";
	Chuu2[31] = "<COL_02><COL_03>中普第号<COL_06>号";
	Chuu2[32] = "<COL_02><COL_03>中種<COL_06>号";
	Chuu2[33] = "<COL_02><COL_03>中種め<COL_06>号";
	Chuu2[34] = "<COL_02><COL_03>中種め第<COL_06>号";
	Chuu2[35] = "<COL_02><COL_03>中種め第号<COL_06>号";
	Chuu2[36] = "<COL_02><COL_03>中種第<COL_06>号";
	Chuu2[37] = "<COL_02><COL_03>中種第号<COL_06>号";
	Chuu2[38] = "<COL_02><COL_03>中第<COL_06>号";
	Chuu2[39] = "<COL_02><COL_03>中第号<COL_06>号";
	Chuu2[40] = "け<COL_02><COL_03>中2<COL_06>号";
	Chuu2[41] = "け<COL_02><COL_03>中2け<COL_06>号";
	Chuu2[42] = "け<COL_02><COL_03>中2け第<COL_06>号";
	Chuu2[43] = "け<COL_02><COL_03>中2け第号<COL_06>号";
	Chuu2[44] = "け<COL_02><COL_03>中2め<COL_06>号";
	Chuu2[45] = "け<COL_02><COL_03>中2め第<COL_06>号";
	Chuu2[46] = "け<COL_02><COL_03>中2め第号<COL_06>号";
	Chuu2[47] = "け<COL_02><COL_03>中2普<COL_06>号";
	Chuu2[48] = "け<COL_02><COL_03>中2普め<COL_06>号";
	Chuu2[49] = "け<COL_02><COL_03>中2普め第<COL_06>号";
	Chuu2[50] = "け<COL_02><COL_03>中2普め第号<COL_06>号";
	Chuu2[51] = "け<COL_02><COL_03>中2普第<COL_06>号";
	Chuu2[52] = "け<COL_02><COL_03>中2普第号<COL_06>号";
	Chuu2[53] = "け<COL_02><COL_03>中2種<COL_06>号";
	Chuu2[54] = "け<COL_02><COL_03>中2種め<COL_06>号";
	Chuu2[55] = "け<COL_02><COL_03>中2種め第<COL_06>号";
	Chuu2[56] = "け<COL_02><COL_03>中2種め第号<COL_06>号";
	Chuu2[57] = "け<COL_02><COL_03>中2種第<COL_06>号";
	Chuu2[58] = "け<COL_02><COL_03>中2種第号<COL_06>号";
	Chuu2[59] = "け<COL_02><COL_03>中2第<COL_06>号";
	Chuu2[60] = "け<COL_02><COL_03>中2第号<COL_06>号";
	Chuu2[61] = "け<COL_02><COL_03>中2級<COL_06>号";
	Chuu2[62] = "け<COL_02><COL_03>中2級第<COL_06>号";
	Chuu2[63] = "け<COL_02><COL_03>中2級第号<COL_06>号";
	Chuu2[64] = "け<COL_02><COL_03>中<COL_06>号";
	Chuu2[65] = "け<COL_02><COL_03>中普<COL_06>号";
	Chuu2[66] = "け<COL_02><COL_03>中普め<COL_06>号";
	Chuu2[67] = "け<COL_02><COL_03>中普め第<COL_06>号";
	Chuu2[68] = "け<COL_02><COL_03>中普め第号<COL_06>号";
	Chuu2[69] = "け<COL_02><COL_03>中普第<COL_06>号";
	Chuu2[70] = "け<COL_02><COL_03>中普第号<COL_06>号";
	Chuu2[71] = "け<COL_02><COL_03>中種<COL_06>号";
	Chuu2[72] = "け<COL_02><COL_03>中種め<COL_06>号";
	Chuu2[73] = "け<COL_02><COL_03>中種め第<COL_06>号";
	Chuu2[74] = "け<COL_02><COL_03>中種め第号<COL_06>号";
	Chuu2[75] = "け<COL_02><COL_03>中種第<COL_06>号";
	Chuu2[76] = "け<COL_02><COL_03>中種第号<COL_06>号";
	Chuu2[77] = "け<COL_02><COL_03>中第<COL_06>号";
	Chuu2[78] = "け<COL_02><COL_03>中第号<COL_06>号";
	Chuu2[79] = "め<COL_02><COL_03>中2<COL_06>号";
	Chuu2[80] = "め<COL_02><COL_03>中2け<COL_06>号";
	Chuu2[81] = "め<COL_02><COL_03>中2け第<COL_06>号";
	Chuu2[82] = "め<COL_02><COL_03>中2け第号<COL_06>号";
	Chuu2[83] = "め<COL_02><COL_03>中2め<COL_06>号";
	Chuu2[84] = "め<COL_02><COL_03>中2め第<COL_06>号";
	Chuu2[85] = "め<COL_02><COL_03>中2め第号<COL_06>号";
	Chuu2[86] = "め<COL_02><COL_03>中2普<COL_06>号";
	Chuu2[87] = "め<COL_02><COL_03>中2普め<COL_06>号";
	Chuu2[88] = "め<COL_02><COL_03>中2普め第<COL_06>号";
	Chuu2[89] = "め<COL_02><COL_03>中2普め第号<COL_06>号";
	Chuu2[90] = "め<COL_02><COL_03>中2普第<COL_06>号";
	Chuu2[91] = "め<COL_02><COL_03>中2普第号<COL_06>号";
	Chuu2[92] = "め<COL_02><COL_03>中2種<COL_06>号";
	Chuu2[93] = "め<COL_02><COL_03>中2種め<COL_06>号";
	Chuu2[94] = "め<COL_02><COL_03>中2種め第<COL_06>号";
	Chuu2[95] = "め<COL_02><COL_03>中2種め第号<COL_06>号";
	Chuu2[96] = "め<COL_02><COL_03>中2種第<COL_06>号";
	Chuu2[97] = "め<COL_02><COL_03>中2種第号<COL_06>号";
	Chuu2[98] = "め<COL_02><COL_03>中2第<COL_06>号";
	Chuu2[99] = "め<COL_02><COL_03>中2第号<COL_06>号";
	Chuu2[100] = "め<COL_02><COL_03>中2級<COL_06>号";
	Chuu2[101] = "め<COL_02><COL_03>中2級第<COL_06>号";
	Chuu2[102] = "め<COL_02><COL_03>中2級第号<COL_06>号";
	Chuu2[103] = "め<COL_02><COL_03>中<COL_06>号";
	Chuu2[104] = "め<COL_02><COL_03>中普<COL_06>号";
	Chuu2[105] = "め<COL_02><COL_03>中普め<COL_06>号";
	Chuu2[106] = "め<COL_02><COL_03>中普め第<COL_06>号";
	Chuu2[107] = "め<COL_02><COL_03>中普め第号<COL_06>号";
	Chuu2[108] = "め<COL_02><COL_03>中普第<COL_06>号";
	Chuu2[109] = "め<COL_02><COL_03>中普第号<COL_06>号";
	Chuu2[110] = "め<COL_02><COL_03>中種<COL_06>号";
	Chuu2[111] = "め<COL_02><COL_03>中種め<COL_06>号";
	Chuu2[112] = "め<COL_02><COL_03>中種め第<COL_06>号";
	Chuu2[113] = "め<COL_02><COL_03>中種め第号<COL_06>号";
	Chuu2[114] = "め<COL_02><COL_03>中種第<COL_06>号";
	Chuu2[115] = "め<COL_02><COL_03>中種第号<COL_06>号";
	Chuu2[116] = "め<COL_02><COL_03>中第<COL_06>号";
	Chuu2[117] = "め<COL_02><COL_03>中第号<COL_06>号";
}

# ------------------------------------------------------------------------------------------------------------------------

# 中学校_臨時
function setChuuRinArray(){
	ChuuRin[1] = "<COL_02><COL_03>中<COL_06>号";
	ChuuRin[2] = "<COL_02><COL_03>中臨<COL_06>号";
	ChuuRin[3] = "<COL_02><COL_03>中臨第<COL_06>号";
	ChuuRin[4] = "<COL_02><COL_03>中臨第号<COL_06>号";
	ChuuRin[5] = "け<COL_02><COL_03>中<COL_06>号";
	ChuuRin[6] = "け<COL_02><COL_03>中臨<COL_06>号";
	ChuuRin[7] = "け<COL_02><COL_03>中臨第<COL_06>号";
	ChuuRin[8] = "け<COL_02><COL_03>中臨第号<COL_06>号";
	ChuuRin[9] = "め<COL_02><COL_03>中<COL_06>号";
	ChuuRin[10] = "め<COL_02><COL_03>中臨<COL_06>号";
	ChuuRin[11] = "め<COL_02><COL_03>中臨第<COL_06>号";
	ChuuRin[12] = "め<COL_02><COL_03>中臨第号<COL_06>号";
}

# ------------------------------------------------------------------------------------------------------------------------

# 中学校_特別
function setChuuTokuArray(){
	ChuuToku[1] = "<COL_02><COL_03>中<COL_06>号";
	ChuuToku[2] = "<COL_02><COL_03>中特1<COL_06>号";
	ChuuToku[3] = "<COL_02><COL_03>中特1第<COL_06>号";
	ChuuToku[4] = "<COL_02><COL_03>中特1第号<COL_06>号";
	ChuuToku[5] = "<COL_02><COL_03>中特2<COL_06>号";
	ChuuToku[6] = "<COL_02><COL_03>中特2第<COL_06>号";
	ChuuToku[7] = "<COL_02><COL_03>中特2第号<COL_06>号";
	ChuuToku[8] = "<COL_02><COL_03>中特<COL_06>号";
	ChuuToku[9] = "<COL_02><COL_03>中特第<COL_06>号";
	ChuuToku[10] = "<COL_02><COL_03>中特第号<COL_06>号";
	ChuuToku[11] = "<COL_02><COL_03>中第<COL_06>号";
	ChuuToku[12] = "<COL_02><COL_03>中第号<COL_06>号";
	ChuuToku[13] = "け<COL_02><COL_03>中<COL_06>号";
	ChuuToku[14] = "け<COL_02><COL_03>中特1<COL_06>号";
	ChuuToku[15] = "け<COL_02><COL_03>中特1第<COL_06>号";
	ChuuToku[16] = "け<COL_02><COL_03>中特1第号<COL_06>号";
	ChuuToku[17] = "け<COL_02><COL_03>中特2<COL_06>号";
	ChuuToku[18] = "け<COL_02><COL_03>中特2第<COL_06>号";
	ChuuToku[19] = "け<COL_02><COL_03>中特2第号<COL_06>号";
	ChuuToku[20] = "け<COL_02><COL_03>中特<COL_06>号";
	ChuuToku[21] = "け<COL_02><COL_03>中特第<COL_06>号";
	ChuuToku[22] = "け<COL_02><COL_03>中特第号<COL_06>号";
	ChuuToku[23] = "け<COL_02><COL_03>中第<COL_06>号";
	ChuuToku[24] = "け<COL_02><COL_03>中第号<COL_06>号";
	ChuuToku[25] = "め<COL_02><COL_03>中<COL_06>号";
	ChuuToku[26] = "め<COL_02><COL_03>中特1<COL_06>号";
	ChuuToku[27] = "め<COL_02><COL_03>中特1第<COL_06>号";
	ChuuToku[28] = "め<COL_02><COL_03>中特1第号<COL_06>号";
	ChuuToku[29] = "め<COL_02><COL_03>中特2<COL_06>号";
	ChuuToku[30] = "め<COL_02><COL_03>中特2第<COL_06>号";
	ChuuToku[31] = "め<COL_02><COL_03>中特2第号<COL_06>号";
	ChuuToku[32] = "め<COL_02><COL_03>中特<COL_06>号";
	ChuuToku[33] = "め<COL_02><COL_03>中特第<COL_06>号";
	ChuuToku[34] = "め<COL_02><COL_03>中特第号<COL_06>号";
	ChuuToku[35] = "め<COL_02><COL_03>中第<COL_06>号";
	ChuuToku[36] = "め<COL_02><COL_03>中第号<COL_06>号";
}

# ------------------------------------------------------------------------------------------------------------------------

