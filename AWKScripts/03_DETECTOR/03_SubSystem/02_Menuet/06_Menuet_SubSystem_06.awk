#! /usr/bin/gawk
# 06_Menuet_SubSystem_06.awk
# gawk.exe -f AWKScripts/03_DETECTOR/03_SubSystem/02_Menuet/06_Menuet_SubSystem_06.awk DETECTOR_WORKS_SEPT/GrepDefine_Phase1.tsv DETECTOR_WORKS_SIX/FileList.tsv > DETECTOR_WORKS_HUIT/GrepDefine_Phase1_01.tsv

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

# Declaration_03
@include "AWKScripts/03_DETECTOR/02_CommonParts/01_Konzertouverture.awk";

# ------------------------------------------------------------------------------------------------------------------------

BEGIN{
	FS = "\t";
	Declaration_03();
	Cnt_Phase1_ContentsArrays = 1;
	Cnt_Phase2_ContentsArrays = 1;
	Cnt_FileListArrays = 1;
}

BEGINFILE{
	FName = FILENAME;
}

(FName == GREPDEF_PHASE1){
	# Phase1_ContentsArrays[x][1] : 授与権者
	# Phase1_ContentsArrays[x][2] : 免許番号
	# Phase1_ContentsArrays[x][3] : 教科
	Phase1_ContentsArrays[Cnt_Phase1_ContentsArrays][1] = $1;
	Phase1_ContentsArrays[Cnt_Phase1_ContentsArrays][2] = $2;
	Phase1_ContentsArrays[Cnt_Phase1_ContentsArrays][3] = $3;
	Cnt_Phase1_ContentsArrays++;
	next;
}

(FName == FLIST){
	if($3 == "CAUTION"){
		FileListArrays[Cnt_FileListArrays] = $2;
		Cnt_FileListArrays++;
	}
	next;
}

END{
	# default
	Phase2_ContentsArrays[1][1] = "";
	Phase2_ContentsArrays[1][2] = "";
	Phase2_ContentsArrays[1][3] = "";
	Phase2_ContentsArrays[1][4] = "";
	BitField_03 = 0;
	for(i in FileListArrays){
		Extract();
	}
	# 初期状態の場合
	if(BitField_03 == 0){
		delete Phase1_ContentsArrays;
		delete Phase2_ContentsArrays;
		# 結果としてPhase2の対象定義が存在しない場合
		exit 1;
	}
	for(i in Phase2_ContentsArrays){
		print Phase2_ContentsArrays[i][1]"\t"Phase2_ContentsArrays[i][2]"\t"Phase2_ContentsArrays[i][3]"\t"Phase2_ContentsArrays[i][4];
	}
	delete Phase1_ContentsArrays;
	delete Phase2_ContentsArrays;
	exit 0;
}

function Extract(){
	cmd = "LinuxTools\\busybox.exe cat "FileListArrays[i];
	while(cmd | getline esc){
		split(esc,escArrays,",");
		BitField = 0;
		for(j in Phase1_ContentsArrays){
			# WARNINGのファイルの行のコンポーネントと完全一致した場合、
			# ビットフィールドを反転させる
			if(Phase1_ContentsArrays[j][1] == escArrays[2] && 
			Phase1_ContentsArrays[j][2] == escArrays[3] && 
			Phase1_ContentsArrays[j][3] == escArrays[4]){
				BitField = 1;
				break;
			}
		}
		if(BitField == 0){
			BitField_02 = 0;
			for(k in Phase2_ContentsArrays){
				if(Phase2_ContentsArrays[k][1] == escArrays[2] && 
				Phase2_ContentsArrays[k][2] == escArrays[3] && 
				Phase2_ContentsArrays[k][3] == escArrays[4]){
					BitField_02 = 1;
					break;
				}
			}
			if(BitField_02 == 0){
				Phase2_ContentsArrays[Cnt_Phase2_ContentsArrays][1] = escArrays[2];
				Phase2_ContentsArrays[Cnt_Phase2_ContentsArrays][2] = escArrays[3];
				Phase2_ContentsArrays[Cnt_Phase2_ContentsArrays][3] = escArrays[4];
				Phase2_ContentsArrays[Cnt_Phase2_ContentsArrays][4] = FileListArrays[i];
				BitField_03 = 1;
				Cnt_Phase2_ContentsArrays++;
			}
		}
		delete escArrays;
	}
}

