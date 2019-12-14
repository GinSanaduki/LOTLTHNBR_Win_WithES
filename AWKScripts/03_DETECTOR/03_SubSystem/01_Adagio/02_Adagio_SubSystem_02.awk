#! /usr/bin/gawk
# 02_Adagio_SubSystem_02.awk
# gawk.exe -f AWKScripts/03_DETECTOR/03_SubSystem/01_Adagio/02_Adagio_SubSystem_02.awk DETECTOR_WORKS/Filter_01.txt

# GinSanaduki/kn2anInGAWK
# https://github.com/GinSanaduki/kn2anInGAWK/blob/master/kn2anInGAWK.awk

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

{
	Tex = $0;
	gsub("年","",Tex);
	gsub("第号","第",Tex);
	gsub(" ","",Tex);
	gsub("　","",Tex);
	# 原典の表記ゆれ部を直す
	# スタンダードに変換した後に、照会用に表記ゆれのワードを作り出す
	gsub("め","",Tex);
	gsub("け","",Tex);
	gsub("和","",Tex);
	gsub("成","",Tex);
	gsub("元","1",Tex);
	# 免許番号の区分の「専修」と「専種」を「専」に変換する
	gsub("専修","専",Tex);
	gsub("専種","専",Tex);
	# 全角数字を半角数字に変換
	Tex_02 = ZenHan(Tex);
	# 免許番号の区分の「1普」、「1種」、「1級」を「1」に変換する
	gsub("1普","1",Tex_02);
	gsub("1種","1",Tex_02);
	gsub("1級","1",Tex_02);
	# 免許番号の区分の「2普」、「2種」、「2級」を「2」に変換する
	gsub("2普","2",Tex_02);
	gsub("2種","2",Tex_02);
	gsub("2級","2",Tex_02);
	# 免許番号の校種+区分の「高普」を「高1」に変換する
	# http://www.mext.go.jp/a_menu/shotou/kyoin/__icsFiles/afieldfile/2019/09/09/1339300_1.pdf
	# 教員免許制度の概要（平成31年4月1日版）
	# 「専修、一種、二種（高等学校は専修、一種）の区分があります。」
	gsub("高普","高1",Tex_02);
	# 免許番号の校種の「養自」を「養学」に変換する
	gsub("養自","養学",Tex_02);
	# 免許番号の区分の「特学」を「特支」に変換する
	gsub("特学","特支",Tex_02);
	# 免許番号の区分の「盲特」、「盲学」を「盲」に変換する
	# 2019/12/12
	# 盲1で照会される
	# gsub("盲特","盲",Tex_02);
	gsub("盲特2","盲特",Tex_02);
	gsub("盲特1","盲特",Tex_02);
	BitFiled_MouToku = 0;
	mat = match(Tex_02,/盲特/);
	if(mat > 0){
		BitFiled_MouToku = 1;
	}
	gsub("盲学","盲",Tex_02);
	# 免許番号の区分の「聾特」、「聾学」を「盲」に変換する
	# 2019/12/12
	# 盲1で照会される
	# の横展開
	# gsub("聾特","聾",Tex_02);
	gsub("聾特1","聾",Tex_02);
	gsub("聾特2","聾",Tex_02);
	BitFiled_RouToku = 0;
	mat = match(Tex_02,/聾特/);
	if(mat > 0){
		BitFiled_RouToku = 1;
	}
	gsub("聾学","聾",Tex_02);
	Tex_03 = NENGO_ZeroPaddingDel(Tex_02);
	gsub("昭64","平1",Tex_03);
	gsub("平31","令1",Tex_03);
	# 免許番号の校種+区分の「養1」、「養2」、「養専」、「養臨」、「養特」を
	# 「養学1」、「養学2」、「養学専」、「養学臨」、「養学特」に変換する
	gsub("養1","養学1",Tex_03);
	gsub("養2","養学2",Tex_03);
	gsub("養専","養学専",Tex_03);
	gsub("養臨","養学臨",Tex_03);
	gsub("養特","養学特",Tex_03);
	# 元号の年度部分を漢数字で当て込んだものを変換
	Tex_04 = kandel(Tex_03);
	# 元号・年号部分をカンマで切り出す
	Tex_05 = nentab(Tex_04);
	# 免許番号の校種+区分の「特1」、「特2」、「特専」、「特臨」、「特特」を
	# 「特支1」、「特支2」、「特支専」、「特支臨」、「特支特」に変換する
	gsub("特1","特支1",Tex_05);
	gsub("特2","特支2",Tex_05);
	gsub("特専","特支専",Tex_05);
	gsub("特臨","特支臨",Tex_05);
	gsub("特特","特支特",Tex_05);
	#if(BitFiled_MouToku == 1){
	#	gsub("盲","盲特",Tex_05);
	#}
	#if(BitFiled_RouToku == 1){
	#	gsub("聾","聾特",Tex_05);
	#}
	# 「幼第」、「小第」、「中第」、「高第」、「特支第」、「養教第」、
	# 「栄第」、「盲第」、「聾第」、「養学第」を
	# 「幼1第」、「小1第」、「中1第」、「高1第」、「特支1第」、「養教1第」、
	# 「栄1第」、「盲1第」、「聾1第」、「養学1第」に変換する
	gsub("幼第","幼1第",Tex_05);
	gsub("小第","小1第",Tex_05);
	gsub("中第","中1第",Tex_05);
	gsub("高第","高1第",Tex_05);
	gsub("特支第","特支1第",Tex_05);
	gsub("栄第","養教1第",Tex_05);
	gsub("盲第","盲1第",Tex_05);
	gsub("聾第","聾1第",Tex_05);
	gsub("養学第","養学1第",Tex_05);
	print Tex_05;
	# debug
	# print Tex_05 > "con"
	# close("con");
}

# ------------------------------------------------------------------------------------------------------------------------

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

# ------------------------------------------------------------------------------------------------------------------------

function NENGO_ZeroPaddingDel(NENGO_ZeroPaddingDelFrom){
	# 平成
	gsub("平01","平1",NENGO_ZeroPaddingDelFrom);
	gsub("平02","平2",NENGO_ZeroPaddingDelFrom);
	gsub("平03","平3",NENGO_ZeroPaddingDelFrom);
	gsub("平04","平4",NENGO_ZeroPaddingDelFrom);
	gsub("平05","平5",NENGO_ZeroPaddingDelFrom);
	gsub("平06","平6",NENGO_ZeroPaddingDelFrom);
	gsub("平07","平7",NENGO_ZeroPaddingDelFrom);
	gsub("平08","平8",NENGO_ZeroPaddingDelFrom);
	gsub("平09","平9",NENGO_ZeroPaddingDelFrom);
	# 令和
	gsub("令01","令1",NENGO_ZeroPaddingDelFrom);
	gsub("令02","令2",NENGO_ZeroPaddingDelFrom);
	gsub("令03","令3",NENGO_ZeroPaddingDelFrom);
	gsub("令04","令4",NENGO_ZeroPaddingDelFrom);
	gsub("令05","令5",NENGO_ZeroPaddingDelFrom);
	gsub("令06","令6",NENGO_ZeroPaddingDelFrom);
	gsub("令07","令7",NENGO_ZeroPaddingDelFrom);
	gsub("令08","令8",NENGO_ZeroPaddingDelFrom);
	gsub("令09","令9",NENGO_ZeroPaddingDelFrom);
	return NENGO_ZeroPaddingDelFrom;
}

# ------------------------------------------------------------------------------------------------------------------------

function kandel(kandel_ConvFrom){
	# 昭和NUMSTRING_1
	gsub("昭三十一","昭31",kandel_ConvFrom);
	gsub("昭三十二","昭32",kandel_ConvFrom);
	gsub("昭三十三","昭33",kandel_ConvFrom);
	gsub("昭三十四","昭34",kandel_ConvFrom);
	gsub("昭三十五","昭35",kandel_ConvFrom);
	gsub("昭三十六","昭36",kandel_ConvFrom);
	gsub("昭三十七","昭37",kandel_ConvFrom);
	gsub("昭三十八","昭38",kandel_ConvFrom);
	gsub("昭三十九","昭39",kandel_ConvFrom);
	gsub("昭四十一","昭41",kandel_ConvFrom);
	gsub("昭四十二","昭42",kandel_ConvFrom);
	gsub("昭四十三","昭43",kandel_ConvFrom);
	gsub("昭四十四","昭44",kandel_ConvFrom);
	gsub("昭四十五","昭45",kandel_ConvFrom);
	gsub("昭四十六","昭46",kandel_ConvFrom);
	gsub("昭四十七","昭47",kandel_ConvFrom);
	gsub("昭四十八","昭48",kandel_ConvFrom);
	gsub("昭四十九","昭49",kandel_ConvFrom);
	gsub("昭五十一","昭51",kandel_ConvFrom);
	gsub("昭五十二","昭52",kandel_ConvFrom);
	gsub("昭五十三","昭53",kandel_ConvFrom);
	gsub("昭五十四","昭54",kandel_ConvFrom);
	gsub("昭五十五","昭55",kandel_ConvFrom);
	gsub("昭五十六","昭56",kandel_ConvFrom);
	gsub("昭五十七","昭57",kandel_ConvFrom);
	gsub("昭五十八","昭58",kandel_ConvFrom);
	gsub("昭五十九","昭59",kandel_ConvFrom);
	gsub("昭六十一","昭61",kandel_ConvFrom);
	gsub("昭六十二","昭62",kandel_ConvFrom);
	gsub("昭六十三","昭63",kandel_ConvFrom);
	gsub("昭三十","昭30",kandel_ConvFrom);
	gsub("昭四十","昭40",kandel_ConvFrom);
	gsub("昭五十","昭50",kandel_ConvFrom);
	gsub("昭六十","昭60",kandel_ConvFrom);

	# 昭和NUMSTRING_3
	gsub("昭三〇","昭30",kandel_ConvFrom);
	gsub("昭三一","昭31",kandel_ConvFrom);
	gsub("昭三二","昭32",kandel_ConvFrom);
	gsub("昭三三","昭33",kandel_ConvFrom);
	gsub("昭三四","昭34",kandel_ConvFrom);
	gsub("昭三五","昭35",kandel_ConvFrom);
	gsub("昭三六","昭36",kandel_ConvFrom);
	gsub("昭三七","昭37",kandel_ConvFrom);
	gsub("昭三八","昭38",kandel_ConvFrom);
	gsub("昭三九","昭39",kandel_ConvFrom);
	gsub("昭四〇","昭40",kandel_ConvFrom);
	gsub("昭四一","昭41",kandel_ConvFrom);
	gsub("昭四二","昭42",kandel_ConvFrom);
	gsub("昭四三","昭43",kandel_ConvFrom);
	gsub("昭四四","昭44",kandel_ConvFrom);
	gsub("昭四五","昭45",kandel_ConvFrom);
	gsub("昭四六","昭46",kandel_ConvFrom);
	gsub("昭四七","昭47",kandel_ConvFrom);
	gsub("昭四八","昭48",kandel_ConvFrom);
	gsub("昭四九","昭49",kandel_ConvFrom);
	gsub("昭五〇","昭50",kandel_ConvFrom);
	gsub("昭五一","昭51",kandel_ConvFrom);
	gsub("昭五二","昭52",kandel_ConvFrom);
	gsub("昭五三","昭53",kandel_ConvFrom);
	gsub("昭五四","昭54",kandel_ConvFrom);
	gsub("昭五五","昭55",kandel_ConvFrom);
	gsub("昭五六","昭56",kandel_ConvFrom);
	gsub("昭五七","昭57",kandel_ConvFrom);
	gsub("昭五八","昭58",kandel_ConvFrom);
	gsub("昭五九","昭59",kandel_ConvFrom);
	gsub("昭六〇","昭60",kandel_ConvFrom);
	gsub("昭六一","昭61",kandel_ConvFrom);
	gsub("昭六二","昭62",kandel_ConvFrom);
	gsub("昭六三","昭63",kandel_ConvFrom);

	# 平成NUMSTRING_3
	gsub("平一一","平11",kandel_ConvFrom);
	gsub("平一二","平12",kandel_ConvFrom);
	gsub("平一三","平13",kandel_ConvFrom);
	gsub("平一四","平14",kandel_ConvFrom);
	gsub("平一五","平15",kandel_ConvFrom);
	gsub("平一六","平16",kandel_ConvFrom);
	gsub("平一七","平17",kandel_ConvFrom);
	gsub("平一八","平18",kandel_ConvFrom);
	gsub("平一九","平19",kandel_ConvFrom);
	gsub("平二一","平21",kandel_ConvFrom);
	gsub("平二二","平22",kandel_ConvFrom);
	gsub("平二三","平23",kandel_ConvFrom);
	gsub("平二四","平24",kandel_ConvFrom);
	gsub("平二五","平25",kandel_ConvFrom);
	gsub("平二六","平26",kandel_ConvFrom);
	gsub("平二七","平27",kandel_ConvFrom);
	gsub("平二八","平28",kandel_ConvFrom);
	gsub("平二九","平29",kandel_ConvFrom);
	gsub("平一〇","平10",kandel_ConvFrom);
	gsub("平二〇","平20",kandel_ConvFrom);
	gsub("平三〇","平30",kandel_ConvFrom);

	# 平成NUMSTRING_1
	gsub("平二十一","平21",kandel_ConvFrom);
	gsub("平二十二","平22",kandel_ConvFrom);
	gsub("平二十三","平23",kandel_ConvFrom);
	gsub("平二十四","平24",kandel_ConvFrom);
	gsub("平二十五","平25",kandel_ConvFrom);
	gsub("平二十六","平26",kandel_ConvFrom);
	gsub("平二十七","平27",kandel_ConvFrom);
	gsub("平二十八","平28",kandel_ConvFrom);
	gsub("平二十九","平29",kandel_ConvFrom);
	gsub("平二十","平20",kandel_ConvFrom);
	gsub("平三十","平30",kandel_ConvFrom);
	gsub("平十一","平11",kandel_ConvFrom);
	gsub("平十二","平12",kandel_ConvFrom);
	gsub("平十三","平13",kandel_ConvFrom);
	gsub("平十四","平14",kandel_ConvFrom);
	gsub("平十五","平15",kandel_ConvFrom);
	gsub("平十六","平16",kandel_ConvFrom);
	gsub("平十七","平17",kandel_ConvFrom);
	gsub("平十八","平18",kandel_ConvFrom);
	gsub("平十九","平19",kandel_ConvFrom);
	gsub("平十","平10",kandel_ConvFrom);
	gsub("平一","平1",kandel_ConvFrom);
	gsub("平二","平2",kandel_ConvFrom);
	gsub("平三","平3",kandel_ConvFrom);
	gsub("平四","平4",kandel_ConvFrom);
	gsub("平五","平5",kandel_ConvFrom);
	gsub("平六","平6",kandel_ConvFrom);
	gsub("平七","平7",kandel_ConvFrom);
	gsub("平八","平8",kandel_ConvFrom);
	gsub("平九","平9",kandel_ConvFrom);

	# 令和NUMSTRING_3
	gsub("令一〇","令10",kandel_ConvFrom);
	
	# 令和NUMSTRING_1
	gsub("令十","令10",kandel_ConvFrom);
	gsub("令一","令1",kandel_ConvFrom);
	gsub("令二","令2",kandel_ConvFrom);
	gsub("令三","令3",kandel_ConvFrom);
	gsub("令四","令4",kandel_ConvFrom);
	gsub("令五","令5",kandel_ConvFrom);
	gsub("令六","令6",kandel_ConvFrom);
	gsub("令七","令7",kandel_ConvFrom);
	gsub("令八","令8",kandel_ConvFrom);
	gsub("令九","令9",kandel_ConvFrom);
	return kandel_ConvFrom;
}

function nentab(nentab_ConvFrom){
	# 昭和
	gsub("昭30","昭30\t",nentab_ConvFrom);
	gsub("昭31","昭31\t",nentab_ConvFrom);
	gsub("昭32","昭32\t",nentab_ConvFrom);
	gsub("昭33","昭33\t",nentab_ConvFrom);
	gsub("昭34","昭34\t",nentab_ConvFrom);
	gsub("昭35","昭35\t",nentab_ConvFrom);
	gsub("昭36","昭36\t",nentab_ConvFrom);
	gsub("昭37","昭37\t",nentab_ConvFrom);
	gsub("昭38","昭38\t",nentab_ConvFrom);
	gsub("昭39","昭39\t",nentab_ConvFrom);
	gsub("昭40","昭40\t",nentab_ConvFrom);
	gsub("昭41","昭41\t",nentab_ConvFrom);
	gsub("昭42","昭42\t",nentab_ConvFrom);
	gsub("昭43","昭43\t",nentab_ConvFrom);
	gsub("昭44","昭44\t",nentab_ConvFrom);
	gsub("昭45","昭45\t",nentab_ConvFrom);
	gsub("昭46","昭46\t",nentab_ConvFrom);
	gsub("昭47","昭47\t",nentab_ConvFrom);
	gsub("昭48","昭48\t",nentab_ConvFrom);
	gsub("昭49","昭49\t",nentab_ConvFrom);
	gsub("昭50","昭50\t",nentab_ConvFrom);
	gsub("昭51","昭51\t",nentab_ConvFrom);
	gsub("昭52","昭52\t",nentab_ConvFrom);
	gsub("昭53","昭53\t",nentab_ConvFrom);
	gsub("昭54","昭54\t",nentab_ConvFrom);
	gsub("昭55","昭55\t",nentab_ConvFrom);
	gsub("昭56","昭56\t",nentab_ConvFrom);
	gsub("昭57","昭57\t",nentab_ConvFrom);
	gsub("昭58","昭58\t",nentab_ConvFrom);
	gsub("昭59","昭59\t",nentab_ConvFrom);
	gsub("昭60","昭60\t",nentab_ConvFrom);
	gsub("昭61","昭61\t",nentab_ConvFrom);
	gsub("昭62","昭62\t",nentab_ConvFrom);
	gsub("昭63","昭63\t",nentab_ConvFrom);
	# 平成
	gsub("平10","平10\t",nentab_ConvFrom);
	gsub("平11","平11\t",nentab_ConvFrom);
	gsub("平12","平12\t",nentab_ConvFrom);
	gsub("平13","平13\t",nentab_ConvFrom);
	gsub("平14","平14\t",nentab_ConvFrom);
	gsub("平15","平15\t",nentab_ConvFrom);
	gsub("平16","平16\t",nentab_ConvFrom);
	gsub("平17","平17\t",nentab_ConvFrom);
	gsub("平18","平18\t",nentab_ConvFrom);
	gsub("平19","平19\t",nentab_ConvFrom);
	gsub("平20","平20\t",nentab_ConvFrom);
	gsub("平21","平21\t",nentab_ConvFrom);
	gsub("平22","平22\t",nentab_ConvFrom);
	gsub("平23","平23\t",nentab_ConvFrom);
	gsub("平24","平24\t",nentab_ConvFrom);
	gsub("平25","平25\t",nentab_ConvFrom);
	gsub("平26","平26\t",nentab_ConvFrom);
	gsub("平27","平27\t",nentab_ConvFrom);
	gsub("平28","平28\t",nentab_ConvFrom);
	gsub("平29","平29\t",nentab_ConvFrom);
	gsub("平30","平30\t",nentab_ConvFrom);
	# 令和
	gsub("令10","令10\t",nentab_ConvFrom);
	# 現時点でnentab_ConvFromにタブ文字が存在しない場合
	mat = match(nentab_ConvFrom,/\t/);
	if(mat > 0){
		return nentab_ConvFrom;
	}
	# 平成
	gsub("平1","平1\t",nentab_ConvFrom);
	gsub("平2","平2\t",nentab_ConvFrom);
	gsub("平3","平3\t",nentab_ConvFrom);
	gsub("平4","平4\t",nentab_ConvFrom);
	gsub("平5","平5\t",nentab_ConvFrom);
	gsub("平6","平6\t",nentab_ConvFrom);
	gsub("平7","平7\t",nentab_ConvFrom);
	gsub("平8","平8\t",nentab_ConvFrom);
	gsub("平9","平9\t",nentab_ConvFrom);
	# 令和
	gsub("令1","令1\t",nentab_ConvFrom);
	gsub("令2","令2\t",nentab_ConvFrom);
	gsub("令3","令3\t",nentab_ConvFrom);
	gsub("令4","令4\t",nentab_ConvFrom);
	gsub("令5","令5\t",nentab_ConvFrom);
	gsub("令6","令6\t",nentab_ConvFrom);
	gsub("令7","令7\t",nentab_ConvFrom);
	gsub("令8","令8\t",nentab_ConvFrom);
	gsub("令9","令9\t",nentab_ConvFrom);
	return nentab_ConvFrom;
}

# ------------------------------------------------------------------------------------------------------------------------

