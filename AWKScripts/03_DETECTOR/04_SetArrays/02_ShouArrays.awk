#! /usr/bin/gawk
# 02_ShouArrays.awk
# Import : AWKScripts/03_DETECTOR/04_SetArrays/02_ShouArrays.awk

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

# 小学校_専修
function setShouSenArray(){
	ShouSen[1] = "<COL_02><COL_03>小<COL_06>号";
	ShouSen[2] = "<COL_02><COL_03>小専<COL_06>号";
	ShouSen[3] = "<COL_02><COL_03>小専修<COL_06>号";
	ShouSen[4] = "<COL_02><COL_03>小専修第<COL_06>号";
	ShouSen[5] = "<COL_02><COL_03>小専修第号<COL_06>号";
	ShouSen[6] = "<COL_02><COL_03>小専種<COL_06>号";
	ShouSen[7] = "<COL_02><COL_03>小専種第<COL_06>号";
	ShouSen[8] = "<COL_02><COL_03>小専種第号<COL_06>号";
	ShouSen[9] = "<COL_02><COL_03>小専第<COL_06>号";
	ShouSen[10] = "<COL_02><COL_03>小専第号<COL_06>号";
	ShouSen[11] = "<COL_02><COL_03>小第<COL_06>号";
	ShouSen[12] = "<COL_02><COL_03>小第号<COL_06>号";
	ShouSen[13] = "け<COL_02><COL_03>小<COL_06>号";
	ShouSen[14] = "け<COL_02><COL_03>小専<COL_06>号";
	ShouSen[15] = "け<COL_02><COL_03>小専修<COL_06>号";
	ShouSen[16] = "け<COL_02><COL_03>小専修第<COL_06>号";
	ShouSen[17] = "け<COL_02><COL_03>小専修第号<COL_06>号";
	ShouSen[18] = "け<COL_02><COL_03>小専種<COL_06>号";
	ShouSen[19] = "け<COL_02><COL_03>小専種第<COL_06>号";
	ShouSen[20] = "け<COL_02><COL_03>小専種第号<COL_06>号";
	ShouSen[21] = "け<COL_02><COL_03>小専第<COL_06>号";
	ShouSen[22] = "け<COL_02><COL_03>小専第号<COL_06>号";
	ShouSen[23] = "け<COL_02><COL_03>小第<COL_06>号";
	ShouSen[24] = "け<COL_02><COL_03>小第号<COL_06>号";
	ShouSen[25] = "め<COL_02><COL_03>小<COL_06>号";
	ShouSen[26] = "め<COL_02><COL_03>小専<COL_06>号";
	ShouSen[27] = "め<COL_02><COL_03>小専修<COL_06>号";
	ShouSen[28] = "め<COL_02><COL_03>小専修第<COL_06>号";
	ShouSen[29] = "め<COL_02><COL_03>小専修第号<COL_06>号";
	ShouSen[30] = "め<COL_02><COL_03>小専種<COL_06>号";
	ShouSen[31] = "め<COL_02><COL_03>小専種第<COL_06>号";
	ShouSen[32] = "め<COL_02><COL_03>小専種第号<COL_06>号";
	ShouSen[33] = "め<COL_02><COL_03>小専第<COL_06>号";
	ShouSen[34] = "め<COL_02><COL_03>小専第号<COL_06>号";
	ShouSen[35] = "め<COL_02><COL_03>小第<COL_06>号";
	ShouSen[36] = "め<COL_02><COL_03>小第号<COL_06>号";
}

# ------------------------------------------------------------------------------------------------------------------------

# 小学校_1種
function setShou1Array(){
	Shou1[1] = "<COL_02><COL_03>小1<COL_06>号";
	Shou1[2] = "<COL_02><COL_03>小1け<COL_06>号";
	Shou1[3] = "<COL_02><COL_03>小1け第<COL_06>号";
	Shou1[4] = "<COL_02><COL_03>小1け第号<COL_06>号";
	Shou1[5] = "<COL_02><COL_03>小1め<COL_06>号";
	Shou1[6] = "<COL_02><COL_03>小1め第<COL_06>号";
	Shou1[7] = "<COL_02><COL_03>小1め第号<COL_06>号";
	Shou1[8] = "<COL_02><COL_03>小1普<COL_06>号";
	Shou1[9] = "<COL_02><COL_03>小1普め<COL_06>号";
	Shou1[10] = "<COL_02><COL_03>小1普め第<COL_06>号";
	Shou1[11] = "<COL_02><COL_03>小1普め第号<COL_06>号";
	Shou1[12] = "<COL_02><COL_03>小1普第<COL_06>号";
	Shou1[13] = "<COL_02><COL_03>小1普第号<COL_06>号";
	Shou1[14] = "<COL_02><COL_03>小1種<COL_06>号";
	Shou1[15] = "<COL_02><COL_03>小1種め<COL_06>号";
	Shou1[16] = "<COL_02><COL_03>小1種め第<COL_06>号";
	Shou1[17] = "<COL_02><COL_03>小1種め第号<COL_06>号";
	Shou1[18] = "<COL_02><COL_03>小1種第<COL_06>号";
	Shou1[19] = "<COL_02><COL_03>小1種第号<COL_06>号";
	Shou1[20] = "<COL_02><COL_03>小1第<COL_06>号";
	Shou1[21] = "<COL_02><COL_03>小1第号<COL_06>号";
	Shou1[22] = "<COL_02><COL_03>小1級<COL_06>号";
	Shou1[23] = "<COL_02><COL_03>小1級第<COL_06>号";
	Shou1[24] = "<COL_02><COL_03>小1級第号<COL_06>号";
	Shou1[25] = "<COL_02><COL_03>小<COL_06>号";
	Shou1[26] = "<COL_02><COL_03>小普<COL_06>号";
	Shou1[27] = "<COL_02><COL_03>小普め<COL_06>号";
	Shou1[28] = "<COL_02><COL_03>小普め第<COL_06>号";
	Shou1[29] = "<COL_02><COL_03>小普め第号<COL_06>号";
	Shou1[30] = "<COL_02><COL_03>小普第<COL_06>号";
	Shou1[31] = "<COL_02><COL_03>小普第号<COL_06>号";
	Shou1[32] = "<COL_02><COL_03>小種<COL_06>号";
	Shou1[33] = "<COL_02><COL_03>小種め<COL_06>号";
	Shou1[34] = "<COL_02><COL_03>小種め第<COL_06>号";
	Shou1[35] = "<COL_02><COL_03>小種め第号<COL_06>号";
	Shou1[36] = "<COL_02><COL_03>小種第<COL_06>号";
	Shou1[37] = "<COL_02><COL_03>小種第号<COL_06>号";
	Shou1[38] = "<COL_02><COL_03>小第<COL_06>号";
	Shou1[39] = "<COL_02><COL_03>小第号<COL_06>号";
	Shou1[40] = "け<COL_02><COL_03>小1<COL_06>号";
	Shou1[41] = "け<COL_02><COL_03>小1け<COL_06>号";
	Shou1[42] = "け<COL_02><COL_03>小1け第<COL_06>号";
	Shou1[43] = "け<COL_02><COL_03>小1け第号<COL_06>号";
	Shou1[44] = "け<COL_02><COL_03>小1め<COL_06>号";
	Shou1[45] = "け<COL_02><COL_03>小1め第<COL_06>号";
	Shou1[46] = "け<COL_02><COL_03>小1め第号<COL_06>号";
	Shou1[47] = "け<COL_02><COL_03>小1普<COL_06>号";
	Shou1[48] = "け<COL_02><COL_03>小1普め<COL_06>号";
	Shou1[49] = "け<COL_02><COL_03>小1普め第<COL_06>号";
	Shou1[50] = "け<COL_02><COL_03>小1普め第号<COL_06>号";
	Shou1[51] = "け<COL_02><COL_03>小1普第<COL_06>号";
	Shou1[52] = "け<COL_02><COL_03>小1普第号<COL_06>号";
	Shou1[53] = "け<COL_02><COL_03>小1種<COL_06>号";
	Shou1[54] = "け<COL_02><COL_03>小1種め<COL_06>号";
	Shou1[55] = "け<COL_02><COL_03>小1種め第<COL_06>号";
	Shou1[56] = "け<COL_02><COL_03>小1種め第号<COL_06>号";
	Shou1[57] = "け<COL_02><COL_03>小1種第<COL_06>号";
	Shou1[58] = "け<COL_02><COL_03>小1種第号<COL_06>号";
	Shou1[59] = "け<COL_02><COL_03>小1第<COL_06>号";
	Shou1[60] = "け<COL_02><COL_03>小1第号<COL_06>号";
	Shou1[61] = "け<COL_02><COL_03>小1級<COL_06>号";
	Shou1[62] = "け<COL_02><COL_03>小1級第<COL_06>号";
	Shou1[63] = "け<COL_02><COL_03>小1級第号<COL_06>号";
	Shou1[64] = "け<COL_02><COL_03>小<COL_06>号";
	Shou1[65] = "け<COL_02><COL_03>小普<COL_06>号";
	Shou1[66] = "け<COL_02><COL_03>小普め<COL_06>号";
	Shou1[67] = "け<COL_02><COL_03>小普め第<COL_06>号";
	Shou1[68] = "け<COL_02><COL_03>小普め第号<COL_06>号";
	Shou1[69] = "け<COL_02><COL_03>小普第<COL_06>号";
	Shou1[70] = "け<COL_02><COL_03>小普第号<COL_06>号";
	Shou1[71] = "け<COL_02><COL_03>小種<COL_06>号";
	Shou1[72] = "け<COL_02><COL_03>小種め<COL_06>号";
	Shou1[73] = "け<COL_02><COL_03>小種め第<COL_06>号";
	Shou1[74] = "け<COL_02><COL_03>小種め第号<COL_06>号";
	Shou1[75] = "け<COL_02><COL_03>小種第<COL_06>号";
	Shou1[76] = "け<COL_02><COL_03>小種第号<COL_06>号";
	Shou1[77] = "け<COL_02><COL_03>小第<COL_06>号";
	Shou1[78] = "け<COL_02><COL_03>小第号<COL_06>号";
	Shou1[79] = "め<COL_02><COL_03>小1<COL_06>号";
	Shou1[80] = "め<COL_02><COL_03>小1け<COL_06>号";
	Shou1[81] = "め<COL_02><COL_03>小1け第<COL_06>号";
	Shou1[82] = "め<COL_02><COL_03>小1け第号<COL_06>号";
	Shou1[83] = "め<COL_02><COL_03>小1め<COL_06>号";
	Shou1[84] = "め<COL_02><COL_03>小1め第<COL_06>号";
	Shou1[85] = "め<COL_02><COL_03>小1め第号<COL_06>号";
	Shou1[86] = "め<COL_02><COL_03>小1普<COL_06>号";
	Shou1[87] = "め<COL_02><COL_03>小1普め<COL_06>号";
	Shou1[88] = "め<COL_02><COL_03>小1普め第<COL_06>号";
	Shou1[89] = "め<COL_02><COL_03>小1普め第号<COL_06>号";
	Shou1[90] = "め<COL_02><COL_03>小1普第<COL_06>号";
	Shou1[91] = "め<COL_02><COL_03>小1普第号<COL_06>号";
	Shou1[92] = "め<COL_02><COL_03>小1種<COL_06>号";
	Shou1[93] = "め<COL_02><COL_03>小1種め<COL_06>号";
	Shou1[94] = "め<COL_02><COL_03>小1種め第<COL_06>号";
	Shou1[95] = "め<COL_02><COL_03>小1種め第号<COL_06>号";
	Shou1[96] = "め<COL_02><COL_03>小1種第<COL_06>号";
	Shou1[97] = "め<COL_02><COL_03>小1種第号<COL_06>号";
	Shou1[98] = "め<COL_02><COL_03>小1第<COL_06>号";
	Shou1[99] = "め<COL_02><COL_03>小1第号<COL_06>号";
	Shou1[100] = "め<COL_02><COL_03>小1級<COL_06>号";
	Shou1[101] = "め<COL_02><COL_03>小1級第<COL_06>号";
	Shou1[102] = "め<COL_02><COL_03>小1級第号<COL_06>号";
	Shou1[103] = "め<COL_02><COL_03>小<COL_06>号";
	Shou1[104] = "め<COL_02><COL_03>小普<COL_06>号";
	Shou1[105] = "め<COL_02><COL_03>小普め<COL_06>号";
	Shou1[106] = "め<COL_02><COL_03>小普め第<COL_06>号";
	Shou1[107] = "め<COL_02><COL_03>小普め第号<COL_06>号";
	Shou1[108] = "め<COL_02><COL_03>小普第<COL_06>号";
	Shou1[109] = "め<COL_02><COL_03>小普第号<COL_06>号";
	Shou1[110] = "め<COL_02><COL_03>小種<COL_06>号";
	Shou1[111] = "め<COL_02><COL_03>小種め<COL_06>号";
	Shou1[112] = "め<COL_02><COL_03>小種め第<COL_06>号";
	Shou1[113] = "め<COL_02><COL_03>小種め第号<COL_06>号";
	Shou1[114] = "め<COL_02><COL_03>小種第<COL_06>号";
	Shou1[115] = "め<COL_02><COL_03>小種第号<COL_06>号";
	Shou1[116] = "め<COL_02><COL_03>小第<COL_06>号";
	Shou1[117] = "め<COL_02><COL_03>小第号<COL_06>号";
}

# ------------------------------------------------------------------------------------------------------------------------

# 小学校_2種
function setShou2Array(){
	Shou2[1] = "<COL_02><COL_03>小2<COL_06>号";
	Shou2[2] = "<COL_02><COL_03>小2け<COL_06>号";
	Shou2[3] = "<COL_02><COL_03>小2け第<COL_06>号";
	Shou2[4] = "<COL_02><COL_03>小2け第号<COL_06>号";
	Shou2[5] = "<COL_02><COL_03>小2め<COL_06>号";
	Shou2[6] = "<COL_02><COL_03>小2め第<COL_06>号";
	Shou2[7] = "<COL_02><COL_03>小2め第号<COL_06>号";
	Shou2[8] = "<COL_02><COL_03>小2普<COL_06>号";
	Shou2[9] = "<COL_02><COL_03>小2普め<COL_06>号";
	Shou2[10] = "<COL_02><COL_03>小2普め第<COL_06>号";
	Shou2[11] = "<COL_02><COL_03>小2普め第号<COL_06>号";
	Shou2[12] = "<COL_02><COL_03>小2普第<COL_06>号";
	Shou2[13] = "<COL_02><COL_03>小2普第号<COL_06>号";
	Shou2[14] = "<COL_02><COL_03>小2種<COL_06>号";
	Shou2[15] = "<COL_02><COL_03>小2種め<COL_06>号";
	Shou2[16] = "<COL_02><COL_03>小2種め第<COL_06>号";
	Shou2[17] = "<COL_02><COL_03>小2種め第号<COL_06>号";
	Shou2[18] = "<COL_02><COL_03>小2種第<COL_06>号";
	Shou2[19] = "<COL_02><COL_03>小2種第号<COL_06>号";
	Shou2[20] = "<COL_02><COL_03>小2第<COL_06>号";
	Shou2[21] = "<COL_02><COL_03>小2第号<COL_06>号";
	Shou2[22] = "<COL_02><COL_03>小2級<COL_06>号";
	Shou2[23] = "<COL_02><COL_03>小2級第<COL_06>号";
	Shou2[24] = "<COL_02><COL_03>小2級第号<COL_06>号";
	Shou2[25] = "<COL_02><COL_03>小<COL_06>号";
	Shou2[26] = "<COL_02><COL_03>小普<COL_06>号";
	Shou2[27] = "<COL_02><COL_03>小普め<COL_06>号";
	Shou2[28] = "<COL_02><COL_03>小普め第<COL_06>号";
	Shou2[29] = "<COL_02><COL_03>小普め第号<COL_06>号";
	Shou2[30] = "<COL_02><COL_03>小普第<COL_06>号";
	Shou2[31] = "<COL_02><COL_03>小普第号<COL_06>号";
	Shou2[32] = "<COL_02><COL_03>小種<COL_06>号";
	Shou2[33] = "<COL_02><COL_03>小種め<COL_06>号";
	Shou2[34] = "<COL_02><COL_03>小種め第<COL_06>号";
	Shou2[35] = "<COL_02><COL_03>小種め第号<COL_06>号";
	Shou2[36] = "<COL_02><COL_03>小種第<COL_06>号";
	Shou2[37] = "<COL_02><COL_03>小種第号<COL_06>号";
	Shou2[38] = "<COL_02><COL_03>小第<COL_06>号";
	Shou2[39] = "<COL_02><COL_03>小第号<COL_06>号";
	Shou2[40] = "け<COL_02><COL_03>小2<COL_06>号";
	Shou2[41] = "け<COL_02><COL_03>小2け<COL_06>号";
	Shou2[42] = "け<COL_02><COL_03>小2け第<COL_06>号";
	Shou2[43] = "け<COL_02><COL_03>小2け第号<COL_06>号";
	Shou2[44] = "け<COL_02><COL_03>小2め<COL_06>号";
	Shou2[45] = "け<COL_02><COL_03>小2め第<COL_06>号";
	Shou2[46] = "け<COL_02><COL_03>小2め第号<COL_06>号";
	Shou2[47] = "け<COL_02><COL_03>小2普<COL_06>号";
	Shou2[48] = "け<COL_02><COL_03>小2普め<COL_06>号";
	Shou2[49] = "け<COL_02><COL_03>小2普め第<COL_06>号";
	Shou2[50] = "け<COL_02><COL_03>小2普め第号<COL_06>号";
	Shou2[51] = "け<COL_02><COL_03>小2普第<COL_06>号";
	Shou2[52] = "け<COL_02><COL_03>小2普第号<COL_06>号";
	Shou2[53] = "け<COL_02><COL_03>小2種<COL_06>号";
	Shou2[54] = "け<COL_02><COL_03>小2種め<COL_06>号";
	Shou2[55] = "け<COL_02><COL_03>小2種め第<COL_06>号";
	Shou2[56] = "け<COL_02><COL_03>小2種め第号<COL_06>号";
	Shou2[57] = "け<COL_02><COL_03>小2種第<COL_06>号";
	Shou2[58] = "け<COL_02><COL_03>小2種第号<COL_06>号";
	Shou2[59] = "け<COL_02><COL_03>小2第<COL_06>号";
	Shou2[60] = "け<COL_02><COL_03>小2第号<COL_06>号";
	Shou2[61] = "け<COL_02><COL_03>小2級<COL_06>号";
	Shou2[62] = "け<COL_02><COL_03>小2級第<COL_06>号";
	Shou2[63] = "け<COL_02><COL_03>小2級第号<COL_06>号";
	Shou2[64] = "け<COL_02><COL_03>小<COL_06>号";
	Shou2[65] = "け<COL_02><COL_03>小普<COL_06>号";
	Shou2[66] = "け<COL_02><COL_03>小普め<COL_06>号";
	Shou2[67] = "け<COL_02><COL_03>小普め第<COL_06>号";
	Shou2[68] = "け<COL_02><COL_03>小普め第号<COL_06>号";
	Shou2[69] = "け<COL_02><COL_03>小普第<COL_06>号";
	Shou2[70] = "け<COL_02><COL_03>小普第号<COL_06>号";
	Shou2[71] = "け<COL_02><COL_03>小種<COL_06>号";
	Shou2[72] = "け<COL_02><COL_03>小種め<COL_06>号";
	Shou2[73] = "け<COL_02><COL_03>小種め第<COL_06>号";
	Shou2[74] = "け<COL_02><COL_03>小種め第号<COL_06>号";
	Shou2[75] = "け<COL_02><COL_03>小種第<COL_06>号";
	Shou2[76] = "け<COL_02><COL_03>小種第号<COL_06>号";
	Shou2[77] = "け<COL_02><COL_03>小第<COL_06>号";
	Shou2[78] = "け<COL_02><COL_03>小第号<COL_06>号";
	Shou2[79] = "め<COL_02><COL_03>小2<COL_06>号";
	Shou2[80] = "め<COL_02><COL_03>小2け<COL_06>号";
	Shou2[81] = "め<COL_02><COL_03>小2け第<COL_06>号";
	Shou2[82] = "め<COL_02><COL_03>小2け第号<COL_06>号";
	Shou2[83] = "め<COL_02><COL_03>小2め<COL_06>号";
	Shou2[84] = "め<COL_02><COL_03>小2め第<COL_06>号";
	Shou2[85] = "め<COL_02><COL_03>小2め第号<COL_06>号";
	Shou2[86] = "め<COL_02><COL_03>小2普<COL_06>号";
	Shou2[87] = "め<COL_02><COL_03>小2普め<COL_06>号";
	Shou2[88] = "め<COL_02><COL_03>小2普め第<COL_06>号";
	Shou2[89] = "め<COL_02><COL_03>小2普め第号<COL_06>号";
	Shou2[90] = "め<COL_02><COL_03>小2普第<COL_06>号";
	Shou2[91] = "め<COL_02><COL_03>小2普第号<COL_06>号";
	Shou2[92] = "め<COL_02><COL_03>小2種<COL_06>号";
	Shou2[93] = "め<COL_02><COL_03>小2種め<COL_06>号";
	Shou2[94] = "め<COL_02><COL_03>小2種め第<COL_06>号";
	Shou2[95] = "め<COL_02><COL_03>小2種め第号<COL_06>号";
	Shou2[96] = "め<COL_02><COL_03>小2種第<COL_06>号";
	Shou2[97] = "め<COL_02><COL_03>小2種第号<COL_06>号";
	Shou2[98] = "め<COL_02><COL_03>小2第<COL_06>号";
	Shou2[99] = "め<COL_02><COL_03>小2第号<COL_06>号";
	Shou2[100] = "め<COL_02><COL_03>小2級<COL_06>号";
	Shou2[101] = "め<COL_02><COL_03>小2級第<COL_06>号";
	Shou2[102] = "め<COL_02><COL_03>小2級第号<COL_06>号";
	Shou2[103] = "め<COL_02><COL_03>小<COL_06>号";
	Shou2[104] = "め<COL_02><COL_03>小普<COL_06>号";
	Shou2[105] = "め<COL_02><COL_03>小普め<COL_06>号";
	Shou2[106] = "め<COL_02><COL_03>小普め第<COL_06>号";
	Shou2[107] = "め<COL_02><COL_03>小普め第号<COL_06>号";
	Shou2[108] = "め<COL_02><COL_03>小普第<COL_06>号";
	Shou2[109] = "め<COL_02><COL_03>小普第号<COL_06>号";
	Shou2[110] = "め<COL_02><COL_03>小種<COL_06>号";
	Shou2[111] = "め<COL_02><COL_03>小種め<COL_06>号";
	Shou2[112] = "め<COL_02><COL_03>小種め第<COL_06>号";
	Shou2[113] = "め<COL_02><COL_03>小種め第号<COL_06>号";
	Shou2[114] = "め<COL_02><COL_03>小種第<COL_06>号";
	Shou2[115] = "め<COL_02><COL_03>小種第号<COL_06>号";
	Shou2[116] = "め<COL_02><COL_03>小第<COL_06>号";
	Shou2[117] = "め<COL_02><COL_03>小第号<COL_06>号";
}

# ------------------------------------------------------------------------------------------------------------------------

# 小学校_臨時
function setShouRinArray(){
	ShouRin[1] = "<COL_02><COL_03>小<COL_06>号";
	ShouRin[2] = "<COL_02><COL_03>小臨<COL_06>号";
	ShouRin[3] = "<COL_02><COL_03>小臨第<COL_06>号";
	ShouRin[4] = "<COL_02><COL_03>小臨第号<COL_06>号";
	ShouRin[5] = "け<COL_02><COL_03>小<COL_06>号";
	ShouRin[6] = "け<COL_02><COL_03>小臨<COL_06>号";
	ShouRin[7] = "け<COL_02><COL_03>小臨第<COL_06>号";
	ShouRin[8] = "け<COL_02><COL_03>小臨第号<COL_06>号";
	ShouRin[9] = "め<COL_02><COL_03>小<COL_06>号";
	ShouRin[10] = "め<COL_02><COL_03>小臨<COL_06>号";
	ShouRin[11] = "め<COL_02><COL_03>小臨第<COL_06>号";
	ShouRin[12] = "め<COL_02><COL_03>小臨第号<COL_06>号";
}

# ------------------------------------------------------------------------------------------------------------------------

# 小学校_特別
function setShouTokuArray(){
	ShouToku[1] = "<COL_02><COL_03>小<COL_06>号";
	ShouToku[2] = "<COL_02><COL_03>小特1<COL_06>号";
	ShouToku[3] = "<COL_02><COL_03>小特1第<COL_06>号";
	ShouToku[4] = "<COL_02><COL_03>小特1第号<COL_06>号";
	ShouToku[5] = "<COL_02><COL_03>小特2<COL_06>号";
	ShouToku[6] = "<COL_02><COL_03>小特2第<COL_06>号";
	ShouToku[7] = "<COL_02><COL_03>小特2第号<COL_06>号";
	ShouToku[8] = "<COL_02><COL_03>小特<COL_06>号";
	ShouToku[9] = "<COL_02><COL_03>小特第<COL_06>号";
	ShouToku[10] = "<COL_02><COL_03>小特第号<COL_06>号";
	ShouToku[11] = "<COL_02><COL_03>小第<COL_06>号";
	ShouToku[12] = "<COL_02><COL_03>小第号<COL_06>号";
	ShouToku[13] = "け<COL_02><COL_03>小<COL_06>号";
	ShouToku[14] = "け<COL_02><COL_03>小特1<COL_06>号";
	ShouToku[15] = "け<COL_02><COL_03>小特1第<COL_06>号";
	ShouToku[16] = "け<COL_02><COL_03>小特1第号<COL_06>号";
	ShouToku[17] = "け<COL_02><COL_03>小特2<COL_06>号";
	ShouToku[18] = "け<COL_02><COL_03>小特2第<COL_06>号";
	ShouToku[19] = "け<COL_02><COL_03>小特2第号<COL_06>号";
	ShouToku[20] = "け<COL_02><COL_03>小特<COL_06>号";
	ShouToku[21] = "け<COL_02><COL_03>小特第<COL_06>号";
	ShouToku[22] = "け<COL_02><COL_03>小特第号<COL_06>号";
	ShouToku[23] = "け<COL_02><COL_03>小第<COL_06>号";
	ShouToku[24] = "け<COL_02><COL_03>小第号<COL_06>号";
	ShouToku[25] = "め<COL_02><COL_03>小<COL_06>号";
	ShouToku[26] = "め<COL_02><COL_03>小特1<COL_06>号";
	ShouToku[27] = "め<COL_02><COL_03>小特1第<COL_06>号";
	ShouToku[28] = "め<COL_02><COL_03>小特1第号<COL_06>号";
	ShouToku[29] = "め<COL_02><COL_03>小特2<COL_06>号";
	ShouToku[30] = "め<COL_02><COL_03>小特2第<COL_06>号";
	ShouToku[31] = "め<COL_02><COL_03>小特2第号<COL_06>号";
	ShouToku[32] = "め<COL_02><COL_03>小特<COL_06>号";
	ShouToku[33] = "め<COL_02><COL_03>小特第<COL_06>号";
	ShouToku[34] = "め<COL_02><COL_03>小特第号<COL_06>号";
	ShouToku[35] = "め<COL_02><COL_03>小第<COL_06>号";
	ShouToku[36] = "め<COL_02><COL_03>小第号<COL_06>号";
}

# ------------------------------------------------------------------------------------------------------------------------

