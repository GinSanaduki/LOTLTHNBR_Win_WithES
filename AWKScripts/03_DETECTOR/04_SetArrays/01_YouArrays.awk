#! /usr/bin/gawk
# 01_YouArrays.awk
# Import : AWKScripts/03_DETECTOR/04_SetArrays/01_YouArrays.awk

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

# 幼稚園_専修
function setYouSenArray(){
	YouSen[1] = "<COL_02><COL_03>幼<COL_06>号";
	YouSen[2] = "<COL_02><COL_03>幼専<COL_06>号";
	YouSen[3] = "<COL_02><COL_03>幼専修<COL_06>号";
	YouSen[4] = "<COL_02><COL_03>幼専修第<COL_06>号";
	YouSen[5] = "<COL_02><COL_03>幼専修第号<COL_06>号";
	YouSen[6] = "<COL_02><COL_03>幼専種<COL_06>号";
	YouSen[7] = "<COL_02><COL_03>幼専種第<COL_06>号";
	YouSen[8] = "<COL_02><COL_03>幼専種第号<COL_06>号";
	YouSen[9] = "<COL_02><COL_03>幼専第<COL_06>号";
	YouSen[10] = "<COL_02><COL_03>幼専第号<COL_06>号";
	YouSen[11] = "<COL_02><COL_03>幼第<COL_06>号";
	YouSen[12] = "<COL_02><COL_03>幼第号<COL_06>号";
	YouSen[13] = "け<COL_02><COL_03>幼<COL_06>号";
	YouSen[14] = "け<COL_02><COL_03>幼専<COL_06>号";
	YouSen[15] = "け<COL_02><COL_03>幼専修<COL_06>号";
	YouSen[16] = "け<COL_02><COL_03>幼専修第<COL_06>号";
	YouSen[17] = "け<COL_02><COL_03>幼専修第号<COL_06>号";
	YouSen[18] = "け<COL_02><COL_03>幼専種<COL_06>号";
	YouSen[19] = "け<COL_02><COL_03>幼専種第<COL_06>号";
	YouSen[20] = "け<COL_02><COL_03>幼専種第号<COL_06>号";
	YouSen[21] = "け<COL_02><COL_03>幼専第<COL_06>号";
	YouSen[22] = "け<COL_02><COL_03>幼専第号<COL_06>号";
	YouSen[23] = "け<COL_02><COL_03>幼第<COL_06>号";
	YouSen[24] = "け<COL_02><COL_03>幼第号<COL_06>号";
	YouSen[25] = "め<COL_02><COL_03>幼<COL_06>号";
	YouSen[26] = "め<COL_02><COL_03>幼専<COL_06>号";
	YouSen[27] = "め<COL_02><COL_03>幼専修<COL_06>号";
	YouSen[28] = "め<COL_02><COL_03>幼専修第<COL_06>号";
	YouSen[29] = "め<COL_02><COL_03>幼専修第号<COL_06>号";
	YouSen[30] = "め<COL_02><COL_03>幼専種<COL_06>号";
	YouSen[31] = "め<COL_02><COL_03>幼専種第<COL_06>号";
	YouSen[32] = "め<COL_02><COL_03>幼専種第号<COL_06>号";
	YouSen[33] = "め<COL_02><COL_03>幼専第<COL_06>号";
	YouSen[34] = "め<COL_02><COL_03>幼専第号<COL_06>号";
	YouSen[35] = "め<COL_02><COL_03>幼第<COL_06>号";
	YouSen[36] = "め<COL_02><COL_03>幼第号<COL_06>号";
}

# ------------------------------------------------------------------------------------------------------------------------

# 幼稚園_1種
function setYou1Array(){
	You1[1] = "<COL_02><COL_03>幼1<COL_06>号";
	You1[2] = "<COL_02><COL_03>幼1け<COL_06>号";
	You1[3] = "<COL_02><COL_03>幼1け第<COL_06>号";
	You1[4] = "<COL_02><COL_03>幼1け第号<COL_06>号";
	You1[5] = "<COL_02><COL_03>幼1め<COL_06>号";
	You1[6] = "<COL_02><COL_03>幼1め第<COL_06>号";
	You1[7] = "<COL_02><COL_03>幼1め第号<COL_06>号";
	You1[8] = "<COL_02><COL_03>幼1普<COL_06>号";
	You1[9] = "<COL_02><COL_03>幼1普め<COL_06>号";
	You1[10] = "<COL_02><COL_03>幼1普め第<COL_06>号";
	You1[11] = "<COL_02><COL_03>幼1普め第号<COL_06>号";
	You1[12] = "<COL_02><COL_03>幼1普第<COL_06>号";
	You1[13] = "<COL_02><COL_03>幼1普第号<COL_06>号";
	You1[14] = "<COL_02><COL_03>幼1種<COL_06>号";
	You1[15] = "<COL_02><COL_03>幼1種め<COL_06>号";
	You1[16] = "<COL_02><COL_03>幼1種め第<COL_06>号";
	You1[17] = "<COL_02><COL_03>幼1種め第号<COL_06>号";
	You1[18] = "<COL_02><COL_03>幼1種第<COL_06>号";
	You1[19] = "<COL_02><COL_03>幼1種第号<COL_06>号";
	You1[20] = "<COL_02><COL_03>幼1第<COL_06>号";
	You1[21] = "<COL_02><COL_03>幼1第号<COL_06>号";
	You1[22] = "<COL_02><COL_03>幼1級<COL_06>号";
	You1[23] = "<COL_02><COL_03>幼1級第<COL_06>号";
	You1[24] = "<COL_02><COL_03>幼1級第号<COL_06>号";
	You1[25] = "<COL_02><COL_03>幼<COL_06>号";
	You1[26] = "<COL_02><COL_03>幼普<COL_06>号";
	You1[27] = "<COL_02><COL_03>幼普め<COL_06>号";
	You1[28] = "<COL_02><COL_03>幼普め第<COL_06>号";
	You1[29] = "<COL_02><COL_03>幼普め第号<COL_06>号";
	You1[30] = "<COL_02><COL_03>幼普第<COL_06>号";
	You1[31] = "<COL_02><COL_03>幼普第号<COL_06>号";
	You1[32] = "<COL_02><COL_03>幼種<COL_06>号";
	You1[33] = "<COL_02><COL_03>幼種め<COL_06>号";
	You1[34] = "<COL_02><COL_03>幼種め第<COL_06>号";
	You1[35] = "<COL_02><COL_03>幼種め第号<COL_06>号";
	You1[36] = "<COL_02><COL_03>幼種第<COL_06>号";
	You1[37] = "<COL_02><COL_03>幼種第号<COL_06>号";
	You1[38] = "<COL_02><COL_03>幼第<COL_06>号";
	You1[39] = "<COL_02><COL_03>幼第号<COL_06>号";
	You1[40] = "け<COL_02><COL_03>幼1<COL_06>号";
	You1[41] = "け<COL_02><COL_03>幼1け<COL_06>号";
	You1[42] = "け<COL_02><COL_03>幼1け第<COL_06>号";
	You1[43] = "け<COL_02><COL_03>幼1け第号<COL_06>号";
	You1[44] = "け<COL_02><COL_03>幼1め<COL_06>号";
	You1[45] = "け<COL_02><COL_03>幼1め第<COL_06>号";
	You1[46] = "け<COL_02><COL_03>幼1め第号<COL_06>号";
	You1[47] = "け<COL_02><COL_03>幼1普<COL_06>号";
	You1[48] = "け<COL_02><COL_03>幼1普め<COL_06>号";
	You1[49] = "け<COL_02><COL_03>幼1普め第<COL_06>号";
	You1[50] = "け<COL_02><COL_03>幼1普め第号<COL_06>号";
	You1[51] = "け<COL_02><COL_03>幼1普第<COL_06>号";
	You1[52] = "け<COL_02><COL_03>幼1普第号<COL_06>号";
	You1[53] = "け<COL_02><COL_03>幼1種<COL_06>号";
	You1[54] = "け<COL_02><COL_03>幼1種め<COL_06>号";
	You1[55] = "け<COL_02><COL_03>幼1種め第<COL_06>号";
	You1[56] = "け<COL_02><COL_03>幼1種め第号<COL_06>号";
	You1[57] = "け<COL_02><COL_03>幼1種第<COL_06>号";
	You1[58] = "け<COL_02><COL_03>幼1種第号<COL_06>号";
	You1[59] = "け<COL_02><COL_03>幼1第<COL_06>号";
	You1[60] = "け<COL_02><COL_03>幼1第号<COL_06>号";
	You1[61] = "け<COL_02><COL_03>幼1級<COL_06>号";
	You1[62] = "け<COL_02><COL_03>幼1級第<COL_06>号";
	You1[63] = "け<COL_02><COL_03>幼1級第号<COL_06>号";
	You1[64] = "け<COL_02><COL_03>幼<COL_06>号";
	You1[65] = "け<COL_02><COL_03>幼普<COL_06>号";
	You1[66] = "け<COL_02><COL_03>幼普め<COL_06>号";
	You1[67] = "け<COL_02><COL_03>幼普め第<COL_06>号";
	You1[68] = "け<COL_02><COL_03>幼普め第号<COL_06>号";
	You1[69] = "け<COL_02><COL_03>幼普第<COL_06>号";
	You1[70] = "け<COL_02><COL_03>幼普第号<COL_06>号";
	You1[71] = "け<COL_02><COL_03>幼種<COL_06>号";
	You1[72] = "け<COL_02><COL_03>幼種め<COL_06>号";
	You1[73] = "け<COL_02><COL_03>幼種め第<COL_06>号";
	You1[74] = "け<COL_02><COL_03>幼種め第号<COL_06>号";
	You1[75] = "け<COL_02><COL_03>幼種第<COL_06>号";
	You1[76] = "け<COL_02><COL_03>幼種第号<COL_06>号";
	You1[77] = "け<COL_02><COL_03>幼第<COL_06>号";
	You1[78] = "け<COL_02><COL_03>幼第号<COL_06>号";
	You1[79] = "め<COL_02><COL_03>幼1<COL_06>号";
	You1[80] = "め<COL_02><COL_03>幼1け<COL_06>号";
	You1[81] = "め<COL_02><COL_03>幼1け第<COL_06>号";
	You1[82] = "め<COL_02><COL_03>幼1け第号<COL_06>号";
	You1[83] = "め<COL_02><COL_03>幼1め<COL_06>号";
	You1[84] = "め<COL_02><COL_03>幼1め第<COL_06>号";
	You1[85] = "め<COL_02><COL_03>幼1め第号<COL_06>号";
	You1[86] = "め<COL_02><COL_03>幼1普<COL_06>号";
	You1[87] = "め<COL_02><COL_03>幼1普め<COL_06>号";
	You1[88] = "め<COL_02><COL_03>幼1普め第<COL_06>号";
	You1[89] = "め<COL_02><COL_03>幼1普め第号<COL_06>号";
	You1[90] = "め<COL_02><COL_03>幼1普第<COL_06>号";
	You1[91] = "め<COL_02><COL_03>幼1普第号<COL_06>号";
	You1[92] = "め<COL_02><COL_03>幼1種<COL_06>号";
	You1[93] = "め<COL_02><COL_03>幼1種め<COL_06>号";
	You1[94] = "め<COL_02><COL_03>幼1種め第<COL_06>号";
	You1[95] = "め<COL_02><COL_03>幼1種め第号<COL_06>号";
	You1[96] = "め<COL_02><COL_03>幼1種第<COL_06>号";
	You1[97] = "め<COL_02><COL_03>幼1種第号<COL_06>号";
	You1[98] = "め<COL_02><COL_03>幼1第<COL_06>号";
	You1[99] = "め<COL_02><COL_03>幼1第号<COL_06>号";
	You1[100] = "め<COL_02><COL_03>幼1級<COL_06>号";
	You1[101] = "め<COL_02><COL_03>幼1級第<COL_06>号";
	You1[102] = "め<COL_02><COL_03>幼1級第号<COL_06>号";
	You1[103] = "め<COL_02><COL_03>幼<COL_06>号";
	You1[104] = "め<COL_02><COL_03>幼普<COL_06>号";
	You1[105] = "め<COL_02><COL_03>幼普め<COL_06>号";
	You1[106] = "め<COL_02><COL_03>幼普め第<COL_06>号";
	You1[107] = "め<COL_02><COL_03>幼普め第号<COL_06>号";
	You1[108] = "め<COL_02><COL_03>幼普第<COL_06>号";
	You1[109] = "め<COL_02><COL_03>幼普第号<COL_06>号";
	You1[110] = "め<COL_02><COL_03>幼種<COL_06>号";
	You1[111] = "め<COL_02><COL_03>幼種め<COL_06>号";
	You1[112] = "め<COL_02><COL_03>幼種め第<COL_06>号";
	You1[113] = "め<COL_02><COL_03>幼種め第号<COL_06>号";
	You1[114] = "め<COL_02><COL_03>幼種第<COL_06>号";
	You1[115] = "め<COL_02><COL_03>幼種第号<COL_06>号";
	You1[116] = "め<COL_02><COL_03>幼第<COL_06>号";
	You1[117] = "め<COL_02><COL_03>幼第号<COL_06>号";
}

# ------------------------------------------------------------------------------------------------------------------------

# 幼稚園_2種
function setYou2Array(){
	You2[1] = "<COL_02><COL_03>幼2<COL_06>号";
	You2[2] = "<COL_02><COL_03>幼2け<COL_06>号";
	You2[3] = "<COL_02><COL_03>幼2け第<COL_06>号";
	You2[4] = "<COL_02><COL_03>幼2け第号<COL_06>号";
	You2[5] = "<COL_02><COL_03>幼2め<COL_06>号";
	You2[6] = "<COL_02><COL_03>幼2め第<COL_06>号";
	You2[7] = "<COL_02><COL_03>幼2め第号<COL_06>号";
	You2[8] = "<COL_02><COL_03>幼2普<COL_06>号";
	You2[9] = "<COL_02><COL_03>幼2普め<COL_06>号";
	You2[10] = "<COL_02><COL_03>幼2普め第<COL_06>号";
	You2[11] = "<COL_02><COL_03>幼2普め第号<COL_06>号";
	You2[12] = "<COL_02><COL_03>幼2普第<COL_06>号";
	You2[13] = "<COL_02><COL_03>幼2普第号<COL_06>号";
	You2[14] = "<COL_02><COL_03>幼2種<COL_06>号";
	You2[15] = "<COL_02><COL_03>幼2種め<COL_06>号";
	You2[16] = "<COL_02><COL_03>幼2種め第<COL_06>号";
	You2[17] = "<COL_02><COL_03>幼2種め第号<COL_06>号";
	You2[18] = "<COL_02><COL_03>幼2種第<COL_06>号";
	You2[19] = "<COL_02><COL_03>幼2種第号<COL_06>号";
	You2[20] = "<COL_02><COL_03>幼2第<COL_06>号";
	You2[21] = "<COL_02><COL_03>幼2第号<COL_06>号";
	You2[22] = "<COL_02><COL_03>幼2級<COL_06>号";
	You2[23] = "<COL_02><COL_03>幼2級第<COL_06>号";
	You2[24] = "<COL_02><COL_03>幼2級第号<COL_06>号";
	You2[25] = "<COL_02><COL_03>幼<COL_06>号";
	You2[26] = "<COL_02><COL_03>幼普<COL_06>号";
	You2[27] = "<COL_02><COL_03>幼普め<COL_06>号";
	You2[28] = "<COL_02><COL_03>幼普め第<COL_06>号";
	You2[29] = "<COL_02><COL_03>幼普め第号<COL_06>号";
	You2[30] = "<COL_02><COL_03>幼普第<COL_06>号";
	You2[31] = "<COL_02><COL_03>幼普第号<COL_06>号";
	You2[32] = "<COL_02><COL_03>幼種<COL_06>号";
	You2[33] = "<COL_02><COL_03>幼種め<COL_06>号";
	You2[34] = "<COL_02><COL_03>幼種め第<COL_06>号";
	You2[35] = "<COL_02><COL_03>幼種め第号<COL_06>号";
	You2[36] = "<COL_02><COL_03>幼種第<COL_06>号";
	You2[37] = "<COL_02><COL_03>幼種第号<COL_06>号";
	You2[38] = "<COL_02><COL_03>幼第<COL_06>号";
	You2[39] = "<COL_02><COL_03>幼第号<COL_06>号";
	You2[40] = "け<COL_02><COL_03>幼2<COL_06>号";
	You2[41] = "け<COL_02><COL_03>幼2け<COL_06>号";
	You2[42] = "け<COL_02><COL_03>幼2け第<COL_06>号";
	You2[43] = "け<COL_02><COL_03>幼2け第号<COL_06>号";
	You2[44] = "け<COL_02><COL_03>幼2め<COL_06>号";
	You2[45] = "け<COL_02><COL_03>幼2め第<COL_06>号";
	You2[46] = "け<COL_02><COL_03>幼2め第号<COL_06>号";
	You2[47] = "け<COL_02><COL_03>幼2普<COL_06>号";
	You2[48] = "け<COL_02><COL_03>幼2普め<COL_06>号";
	You2[49] = "け<COL_02><COL_03>幼2普め第<COL_06>号";
	You2[50] = "け<COL_02><COL_03>幼2普め第号<COL_06>号";
	You2[51] = "け<COL_02><COL_03>幼2普第<COL_06>号";
	You2[52] = "け<COL_02><COL_03>幼2普第号<COL_06>号";
	You2[53] = "け<COL_02><COL_03>幼2種<COL_06>号";
	You2[54] = "け<COL_02><COL_03>幼2種め<COL_06>号";
	You2[55] = "け<COL_02><COL_03>幼2種め第<COL_06>号";
	You2[56] = "け<COL_02><COL_03>幼2種め第号<COL_06>号";
	You2[57] = "け<COL_02><COL_03>幼2種第<COL_06>号";
	You2[58] = "け<COL_02><COL_03>幼2種第号<COL_06>号";
	You2[59] = "け<COL_02><COL_03>幼2第<COL_06>号";
	You2[60] = "け<COL_02><COL_03>幼2第号<COL_06>号";
	You2[61] = "け<COL_02><COL_03>幼2級<COL_06>号";
	You2[62] = "け<COL_02><COL_03>幼2級第<COL_06>号";
	You2[63] = "け<COL_02><COL_03>幼2級第号<COL_06>号";
	You2[64] = "け<COL_02><COL_03>幼<COL_06>号";
	You2[65] = "け<COL_02><COL_03>幼普<COL_06>号";
	You2[66] = "け<COL_02><COL_03>幼普め<COL_06>号";
	You2[67] = "け<COL_02><COL_03>幼普め第<COL_06>号";
	You2[68] = "け<COL_02><COL_03>幼普め第号<COL_06>号";
	You2[69] = "け<COL_02><COL_03>幼普第<COL_06>号";
	You2[70] = "け<COL_02><COL_03>幼普第号<COL_06>号";
	You2[71] = "け<COL_02><COL_03>幼種<COL_06>号";
	You2[72] = "け<COL_02><COL_03>幼種め<COL_06>号";
	You2[73] = "け<COL_02><COL_03>幼種め第<COL_06>号";
	You2[74] = "け<COL_02><COL_03>幼種め第号<COL_06>号";
	You2[75] = "け<COL_02><COL_03>幼種第<COL_06>号";
	You2[76] = "け<COL_02><COL_03>幼種第号<COL_06>号";
	You2[77] = "け<COL_02><COL_03>幼第<COL_06>号";
	You2[78] = "け<COL_02><COL_03>幼第号<COL_06>号";
	You2[79] = "め<COL_02><COL_03>幼2<COL_06>号";
	You2[80] = "め<COL_02><COL_03>幼2け<COL_06>号";
	You2[81] = "め<COL_02><COL_03>幼2け第<COL_06>号";
	You2[82] = "め<COL_02><COL_03>幼2け第号<COL_06>号";
	You2[83] = "め<COL_02><COL_03>幼2め<COL_06>号";
	You2[84] = "め<COL_02><COL_03>幼2め第<COL_06>号";
	You2[85] = "め<COL_02><COL_03>幼2め第号<COL_06>号";
	You2[86] = "め<COL_02><COL_03>幼2普<COL_06>号";
	You2[87] = "め<COL_02><COL_03>幼2普め<COL_06>号";
	You2[88] = "め<COL_02><COL_03>幼2普め第<COL_06>号";
	You2[89] = "め<COL_02><COL_03>幼2普め第号<COL_06>号";
	You2[90] = "め<COL_02><COL_03>幼2普第<COL_06>号";
	You2[91] = "め<COL_02><COL_03>幼2普第号<COL_06>号";
	You2[92] = "め<COL_02><COL_03>幼2種<COL_06>号";
	You2[93] = "め<COL_02><COL_03>幼2種め<COL_06>号";
	You2[94] = "め<COL_02><COL_03>幼2種め第<COL_06>号";
	You2[95] = "め<COL_02><COL_03>幼2種め第号<COL_06>号";
	You2[96] = "め<COL_02><COL_03>幼2種第<COL_06>号";
	You2[97] = "め<COL_02><COL_03>幼2種第号<COL_06>号";
	You2[98] = "め<COL_02><COL_03>幼2第<COL_06>号";
	You2[99] = "め<COL_02><COL_03>幼2第号<COL_06>号";
	You2[100] = "め<COL_02><COL_03>幼2級<COL_06>号";
	You2[101] = "め<COL_02><COL_03>幼2級第<COL_06>号";
	You2[102] = "め<COL_02><COL_03>幼2級第号<COL_06>号";
	You2[103] = "め<COL_02><COL_03>幼<COL_06>号";
	You2[104] = "め<COL_02><COL_03>幼普<COL_06>号";
	You2[105] = "め<COL_02><COL_03>幼普め<COL_06>号";
	You2[106] = "め<COL_02><COL_03>幼普め第<COL_06>号";
	You2[107] = "め<COL_02><COL_03>幼普め第号<COL_06>号";
	You2[108] = "め<COL_02><COL_03>幼普第<COL_06>号";
	You2[109] = "め<COL_02><COL_03>幼普第号<COL_06>号";
	You2[110] = "め<COL_02><COL_03>幼種<COL_06>号";
	You2[111] = "め<COL_02><COL_03>幼種め<COL_06>号";
	You2[112] = "め<COL_02><COL_03>幼種め第<COL_06>号";
	You2[113] = "め<COL_02><COL_03>幼種め第号<COL_06>号";
	You2[114] = "め<COL_02><COL_03>幼種第<COL_06>号";
	You2[115] = "め<COL_02><COL_03>幼種第号<COL_06>号";
	You2[116] = "め<COL_02><COL_03>幼第<COL_06>号";
	You2[117] = "め<COL_02><COL_03>幼第号<COL_06>号";
}

# ------------------------------------------------------------------------------------------------------------------------

# 幼稚園_臨時
function setYouRinArray(){
	YouRin[1] = "<COL_02><COL_03>幼<COL_06>号";
	YouRin[2] = "<COL_02><COL_03>幼臨<COL_06>号";
	YouRin[3] = "<COL_02><COL_03>幼臨第<COL_06>号";
	YouRin[4] = "<COL_02><COL_03>幼臨第号<COL_06>号";
	YouRin[5] = "け<COL_02><COL_03>幼<COL_06>号";
	YouRin[6] = "け<COL_02><COL_03>幼臨<COL_06>号";
	YouRin[7] = "け<COL_02><COL_03>幼臨第<COL_06>号";
	YouRin[8] = "け<COL_02><COL_03>幼臨第号<COL_06>号";
	YouRin[9] = "め<COL_02><COL_03>幼<COL_06>号";
	YouRin[10] = "め<COL_02><COL_03>幼臨<COL_06>号";
	YouRin[11] = "め<COL_02><COL_03>幼臨第<COL_06>号";
	YouRin[12] = "め<COL_02><COL_03>幼臨第号<COL_06>号";
}

# ------------------------------------------------------------------------------------------------------------------------

# 幼稚園_特別
function setYouTokuArray(){
	YouToku[1] = "<COL_02><COL_03>幼<COL_06>号";
	YouToku[2] = "<COL_02><COL_03>幼特1<COL_06>号";
	YouToku[3] = "<COL_02><COL_03>幼特1第<COL_06>号";
	YouToku[4] = "<COL_02><COL_03>幼特1第号<COL_06>号";
	YouToku[5] = "<COL_02><COL_03>幼特2<COL_06>号";
	YouToku[6] = "<COL_02><COL_03>幼特2第<COL_06>号";
	YouToku[7] = "<COL_02><COL_03>幼特2第号<COL_06>号";
	YouToku[8] = "<COL_02><COL_03>幼特<COL_06>号";
	YouToku[9] = "<COL_02><COL_03>幼特第<COL_06>号";
	YouToku[10] = "<COL_02><COL_03>幼特第号<COL_06>号";
	YouToku[11] = "<COL_02><COL_03>幼第<COL_06>号";
	YouToku[12] = "<COL_02><COL_03>幼第号<COL_06>号";
	YouToku[13] = "け<COL_02><COL_03>幼<COL_06>号";
	YouToku[14] = "け<COL_02><COL_03>幼特1<COL_06>号";
	YouToku[15] = "け<COL_02><COL_03>幼特1第<COL_06>号";
	YouToku[16] = "け<COL_02><COL_03>幼特1第号<COL_06>号";
	YouToku[17] = "け<COL_02><COL_03>幼特2<COL_06>号";
	YouToku[18] = "け<COL_02><COL_03>幼特2第<COL_06>号";
	YouToku[19] = "け<COL_02><COL_03>幼特2第号<COL_06>号";
	YouToku[20] = "け<COL_02><COL_03>幼特<COL_06>号";
	YouToku[21] = "け<COL_02><COL_03>幼特第<COL_06>号";
	YouToku[22] = "け<COL_02><COL_03>幼特第号<COL_06>号";
	YouToku[23] = "け<COL_02><COL_03>幼第<COL_06>号";
	YouToku[24] = "け<COL_02><COL_03>幼第号<COL_06>号";
	YouToku[25] = "め<COL_02><COL_03>幼<COL_06>号";
	YouToku[26] = "め<COL_02><COL_03>幼特1<COL_06>号";
	YouToku[27] = "め<COL_02><COL_03>幼特1第<COL_06>号";
	YouToku[28] = "め<COL_02><COL_03>幼特1第号<COL_06>号";
	YouToku[29] = "め<COL_02><COL_03>幼特2<COL_06>号";
	YouToku[30] = "め<COL_02><COL_03>幼特2第<COL_06>号";
	YouToku[31] = "め<COL_02><COL_03>幼特2第号<COL_06>号";
	YouToku[32] = "め<COL_02><COL_03>幼特<COL_06>号";
	YouToku[33] = "め<COL_02><COL_03>幼特第<COL_06>号";
	YouToku[34] = "め<COL_02><COL_03>幼特第号<COL_06>号";
	YouToku[35] = "め<COL_02><COL_03>幼第<COL_06>号";
	YouToku[36] = "め<COL_02><COL_03>幼第号<COL_06>号";
}

# ------------------------------------------------------------------------------------------------------------------------

