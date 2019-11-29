#! /usr/bin/gawk
# 04_Allegro_Trois.awk

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

function Allegro_Sub15(Allegro_Sub15_FileExt,Allegro_Sub15_FileTex,Allegro_Sub15_CMD01,Allegro_Sub15_CMD01_01,Allegro_Sub15_CMD01_02){
	switch(Allegro_Sub15_FileExt){
		case "txt":
			for(i in Allegro_Sub05_TXT_UTF8Arrays){
				Allegro_Sub15_FileTex = Allegro_Sub15_FileTex"\""Allegro_Sub05_TXT_UTF8Arrays[i]"\" ";
			}
			delete Allegro_Sub05_TXT_UTF8Arrays;
			Allegro_Sub15_CMD01_02 = "LinuxTools/nkf32.exe -s -Lw > "TMP_EXT_TXT_UTF8;
			break;
		case "dat":
			for(i in Allegro_Sub05_DAT_UTF8Arrays){
				Allegro_Sub15_FileTex = Allegro_Sub15_FileTex"\""Allegro_Sub05_DAT_UTF8Arrays[i]"\" ";
			}
			delete Allegro_Sub05_DAT_UTF8Arrays;
			Allegro_Sub15_CMD01_02 = "LinuxTools/nkf32.exe -s -Lw > "TMP_EXT_DAT_UTF8;
			break;
		case "log":
			for(i in Allegro_Sub05_LOG_UTF8Arrays){
				Allegro_Sub15_FileTex = Allegro_Sub15_FileTex"\""Allegro_Sub05_LOG_UTF8Arrays[i]"\" ";
			}
			delete Allegro_Sub05_LOG_UTF8Arrays;
			Allegro_Sub15_CMD01_02 = "LinuxTools/nkf32.exe -s -Lw > "TMP_EXT_LOG_UTF8;
			break;
		case "def":
			for(i in Allegro_Sub05_DEF_UTF8Arrays){
				Allegro_Sub15_FileTex = Allegro_Sub15_FileTex"\""Allegro_Sub05_DEF_UTF8Arrays[i]"\" ";
			}
			delete Allegro_Sub05_DEF_UTF8Arrays;
			Allegro_Sub15_CMD01_02 = "LinuxTools/nkf32.exe -s -Lw > "TMP_EXT_DEF_UTF8;
			break;
		case "conf":
			for(i in Allegro_Sub05_CONF_UTF8Arrays){
				Allegro_Sub15_FileTex = Allegro_Sub15_FileTex"\""Allegro_Sub05_CONF_UTF8Arrays[i]"\" ";
			}
			delete Allegro_Sub05_CONF_UTF8Arrays;
			Allegro_Sub15_CMD01_02 = "LinuxTools/nkf32.exe -s -Lw > "TMP_EXT_CONF_UTF8;
			break;
		case "csv":
			for(i in Allegro_Sub05_CSV_UTF8Arrays){
				Allegro_Sub15_FileTex = Allegro_Sub15_FileTex"\""Allegro_Sub05_CSV_UTF8Arrays[i]"\" ";
			}
			delete Allegro_Sub05_CSV_UTF8Arrays;
			Allegro_Sub15_CMD01_02 = "LinuxTools/nkf32.exe -s -Lw > "TMP_EXT_CSV_UTF8;
			break;
		case "tsv":
			for(i in Allegro_Sub05_TSV_UTF8Arrays){
				Allegro_Sub15_FileTex = Allegro_Sub15_FileTex"\""Allegro_Sub05_TSV_UTF8Arrays[i]"\" ";
			}
			delete Allegro_Sub05_TSV_UTF8Arrays;
			Allegro_Sub15_CMD01_02 = "LinuxTools/nkf32.exe -s -Lw > "TMP_EXT_TSV_UTF8;
			break;
		default:
			exit 99;
	}
	Allegro_Sub15_CMD01_01 = "cat "Allegro_Sub15_FileTex" | ";
	Allegro_Sub15_CMD01 = Allegro_Sub15_CMD01_01 Allegro_Sub15_CMD01_02;
	switch(Allegro_Sub15_FileExt){
		case "txt":
			print Allegro_Sub15_CMD01 > EXTRACTOR_EXT_TXT;
			break;
		case "dat":
			print Allegro_Sub15_CMD01 > EXTRACTOR_EXT_DAT;
		break;
		case "log":
			print Allegro_Sub15_CMD01 > EXTRACTOR_EXT_LOG;
		break;
		case "def":
			print Allegro_Sub15_CMD01 > EXTRACTOR_EXT_DEF;
		break;
		case "conf":
			print Allegro_Sub15_CMD01 > EXTRACTOR_EXT_CONF;
		break;
		case "csv":
			print Allegro_Sub15_CMD01 > EXTRACTOR_EXT_CSV;
		break;
		case "tsv":
			print Allegro_Sub15_CMD01 > EXTRACTOR_EXT_TSV;
		break;
		default:
			exit 99;
	}
}

# ------------------------------------------------------------------------------------------------------------------------

function Allegro_Sub16(Allegro_Sub16_FileExt,Allegro_Sub16_FileTex,Allegro_Sub16_CMD01,Allegro_Sub16_CMD01_01,Allegro_Sub16_CMD01_02){
	switch(Allegro_Sub16_FileExt){
		case "txt":
			for(i in Allegro_Sub05_TXT_SJISArrays){
				Allegro_Sub16_FileTex = Allegro_Sub16_FileTex"\""Allegro_Sub05_TXT_SJISArrays[i]"\" ";
			}
			delete Allegro_Sub05_TXT_SJISArrays;
			Allegro_Sub16_CMD01_02 = "LinuxTools/nkf32.exe -Lw > "TMP_EXT_TXT_SJIS;
			break;
		case "dat":
			for(i in Allegro_Sub05_DAT_SJISArrays){
				Allegro_Sub16_FileTex = Allegro_Sub16_FileTex"\""Allegro_Sub05_DAT_SJISArrays[i]"\" ";
			}
			delete Allegro_Sub05_DAT_SJISArrays;
			Allegro_Sub16_CMD01_02 = "LinuxTools/nkf32.exe -Lw > "TMP_EXT_DAT_SJIS;
			break;
		case "log":
			for(i in Allegro_Sub05_LOG_SJISArrays){
				Allegro_Sub16_FileTex = Allegro_Sub16_FileTex"\""Allegro_Sub05_LOG_SJISArrays[i]"\" ";
			}
			delete Allegro_Sub05_LOG_SJISArrays;
			Allegro_Sub16_CMD01_02 = "LinuxTools/nkf32.exe -Lw > "TMP_EXT_LOG_SJIS;
			break;
		case "def":
			for(i in Allegro_Sub05_DEF_SJISArrays){
				Allegro_Sub16_FileTex = Allegro_Sub16_FileTex"\""Allegro_Sub05_DEF_SJISArrays[i]"\" ";
			}
			delete Allegro_Sub05_DEF_SJISArrays;
			Allegro_Sub16_CMD01_02 = "LinuxTools/nkf32.exe -Lw > "TMP_EXT_DEF_SJIS;
			break;
		case "conf":
			for(i in Allegro_Sub05_CONF_SJISArrays){
				Allegro_Sub16_FileTex = Allegro_Sub16_FileTex"\""Allegro_Sub05_CONF_SJISArrays[i]"\" ";
			}
			delete Allegro_Sub05_CONF_SJISArrays;
			Allegro_Sub16_CMD01_02 = "LinuxTools/nkf32.exe -Lw > "TMP_EXT_CONF_SJIS;
			break;
		case "csv":
			for(i in Allegro_Sub05_CSV_SJISArrays){
				Allegro_Sub16_FileTex = Allegro_Sub16_FileTex"\""Allegro_Sub05_CSV_SJISArrays[i]"\" ";
			}
			delete Allegro_Sub05_CSV_SJISArrays;
			Allegro_Sub16_CMD01_02 = "LinuxTools/nkf32.exe -Lw > "TMP_EXT_CSV_SJIS;
			break;
		case "tsv":
			for(i in Allegro_Sub05_TSV_SJISArrays){
				Allegro_Sub16_FileTex = Allegro_Sub16_FileTex"\""Allegro_Sub05_TSV_SJISArrays[i]"\" ";
			}
			delete Allegro_Sub05_TSV_SJISArrays;
			Allegro_Sub16_CMD01_02 = "LinuxTools/nkf32.exe -Lw > "TMP_EXT_TSV_SJIS;
			break;
		default:
			exit 99;
	}
	Allegro_Sub16_CMD01_01 = "cat "Allegro_Sub16_FileTex" | ";
	Allegro_Sub16_CMD01 = Allegro_Sub16_CMD01_01 Allegro_Sub16_CMD01_02;
	switch(Allegro_Sub16_FileExt){
		case "txt":
			print Allegro_Sub16_CMD01 > EXTRACTOR_EXT_TXT;
			break;
		case "dat":
			print Allegro_Sub16_CMD01 > EXTRACTOR_EXT_DAT;
			break;
		case "log":
			print Allegro_Sub16_CMD01 > EXTRACTOR_EXT_LOG;
			break;
		case "def":
			print Allegro_Sub16_CMD01 > EXTRACTOR_EXT_DEF;
			break;
		case "conf":
			print Allegro_Sub16_CMD01 > EXTRACTOR_EXT_CONF;
			break;
		case "csv":
			print Allegro_Sub16_CMD01 > EXTRACTOR_EXT_CSV;
			break;
		case "tsv":
			print Allegro_Sub16_CMD01 > EXTRACTOR_EXT_TSV;
			break;
		default:
			exit 99;
	}
}

# ------------------------------------------------------------------------------------------------------------------------

function Allegro_Sub17(Allegro_Sub17_FileExt,Allegro_Sub17_CMD01,Allegro_Sub17_CMD01_01,Allegro_Sub17_CMD01_02){
	switch(Allegro_Sub17_FileExt){
		case "txt":
			Allegro_Sub17_CMD01_01 = "cat "TMP_EXT_TXT_UTF8" "TMP_EXT_TXT_SJIS" | ";
			Allegro_Sub17_CMD01_02 = "LinuxTools/nkf32.exe -Lw > "TMP_EXT_TXT;
			break;
		case "dat":
			Allegro_Sub17_CMD01_01 = "cat "TMP_EXT_DAT_UTF8" "TMP_EXT_DAT_SJIS" | ";
			Allegro_Sub17_CMD01_02 = "LinuxTools/nkf32.exe -Lw > "TMP_EXT_DAT;
			break;
		case "log":
			Allegro_Sub17_CMD01_01 = "cat "TMP_EXT_LOG_UTF8" "TMP_EXT_LOG_SJIS" | ";
			Allegro_Sub17_CMD01_02 = "LinuxTools/nkf32.exe -Lw > "TMP_EXT_LOG;
			break;
		case "def":
			Allegro_Sub17_CMD01_01 = "cat "TMP_EXT_DEF_UTF8" "TMP_EXT_DEF_SJIS" | ";
			Allegro_Sub17_CMD01_02 = "LinuxTools/nkf32.exe -Lw > "TMP_EXT_DEF;
			break;
		case "conf":
			Allegro_Sub17_CMD01_01 = "cat "TMP_EXT_CONF_UTF8" "TMP_EXT_CONF_SJIS" | ";
			Allegro_Sub17_CMD01_02 = "LinuxTools/nkf32.exe -Lw > "TMP_EXT_CONF;
			break;
		case "csv":
			Allegro_Sub17_CMD01_01 = "cat "TMP_EXT_CSV_UTF8" "TMP_EXT_CSV_SJIS" | ";
			Allegro_Sub17_CMD01_02 = "LinuxTools/nkf32.exe -Lw > "TMP_EXT_CSV;
			break;
		case "tsv":
			Allegro_Sub17_CMD01_01 = "cat "TMP_EXT_TSV_UTF8" "TMP_EXT_TSV_SJIS" | ";
			Allegro_Sub17_CMD01_02 = "LinuxTools/nkf32.exe -Lw > "TMP_EXT_TSV;
			break;
		default:
			exit 99;
	}
	Allegro_Sub17_CMD01 = Allegro_Sub17_CMD01_01 Allegro_Sub17_CMD01_02;
	switch(Allegro_Sub17_FileExt){
		case "txt":
			print Allegro_Sub17_CMD01 > EXTRACTOR_EXT_TXT;
			break;
		case "dat":
			print Allegro_Sub17_CMD01 > EXTRACTOR_EXT_DAT;
			break;
		case "log":
			print Allegro_Sub17_CMD01 > EXTRACTOR_EXT_LOG;
			break;
		case "def":
			print Allegro_Sub17_CMD01 > EXTRACTOR_EXT_DEF;
			break;
		case "conf":
			print Allegro_Sub17_CMD01 > EXTRACTOR_EXT_CONF;
			break;
		case "csv":
			print Allegro_Sub17_CMD01 > EXTRACTOR_EXT_CSV;
			break;
		case "tsv":
			print Allegro_Sub17_CMD01 > EXTRACTOR_EXT_TSV;
			break;
		default:
			exit 99;
	}
}

# ------------------------------------------------------------------------------------------------------------------------

