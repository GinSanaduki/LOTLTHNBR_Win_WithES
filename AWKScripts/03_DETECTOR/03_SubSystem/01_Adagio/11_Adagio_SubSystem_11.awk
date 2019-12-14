#! /usr/bin/gawk
# 11_Adagio_SubSystem_11.awk
# gawk.exe -f AWKScripts/03_DETECTOR/03_SubSystem/01_Adagio/11_Adagio_SubSystem_11.awk

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

# setDefineWordTextArray
@include "AWKScripts/03_DETECTOR/03_SubSystem/01_Adagio/10_Adagio_SubSystem_10.awk";

@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/01_You/01_YouSen.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/01_You/02_You1.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/01_You/03_You2.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/01_You/04_YouRin.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/01_You/05_YouToku.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/02_Shou/01_ShouSen.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/02_Shou/02_Shou1.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/02_Shou/03_Shou2.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/02_Shou/04_ShouRin.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/02_Shou/05_ShouToku.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/03_Chuu/01_ChuuSen.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/03_Chuu/02_Chuu1.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/03_Chuu/03_Chuu2.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/03_Chuu/04_ChuuRin.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/03_Chuu/05_ChuuToku.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/04_Kou/01_KouSen.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/04_Kou/02_Kou1.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/04_Kou/03_Kou2.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/04_Kou/04_KouRin.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/04_Kou/05_KouToku.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/05_TokuShi/01_TokuShiSen.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/05_TokuShi/02_TokuShi1.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/05_TokuShi/03_TokuShi2.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/05_TokuShi/04_TokuShiRin.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/05_TokuShi/05_TokuShiToku.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/06_YouKyou/01_YouKyouSen.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/06_YouKyou/02_YouKyou1.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/06_YouKyou/03_YouKyou2.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/06_YouKyou/04_YouKyouRin.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/06_YouKyou/05_YouKyouToku.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/07_Ei/01_EiSen.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/07_Ei/02_Ei1.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/07_Ei/03_Ei2.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/07_Ei/04_EiRin.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/07_Ei/05_EiToku.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/08_Mou/01_MouSen.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/08_Mou/02_Mou1.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/08_Mou/03_Mou2.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/08_Mou/04_MouRin.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/08_Mou/05_MouToku.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/09_Rou/01_RouSen.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/09_Rou/02_Rou1.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/09_Rou/03_Rou2.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/09_Rou/04_RouRin.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/09_Rou/05_RouToku.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/10_YouGaku/01_YouGakuSen.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/10_YouGaku/02_YouGaku1.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/10_YouGaku/03_YouGaku2.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/10_YouGaku/04_YouGakuRin.awk"
@include "AWKScripts/03_DETECTOR/05_Gene_Koushu_Kubun/10_YouGaku/05_YouGakuToku.awk"

# ------------------------------------------------------------------------------------------------------------------------

BEGIN{
	FS = "\t";
	Declaration_03();
	setDefineWordTextArray();
	Cnt = 1;
	Cnt2 = 0;
	BitField = 0;
}

# ------------------------------------------------------------------------------------------------------------------------

{
	if($1 != Cnt || BitField == 0){
		BitField = 1;
		close(Fname);
		Cnt = $1;
		Cnt2++;
		Fname = WorksDir_06"/Detector_WORD_No_"Cnt".txt";
		GrepFileArrays[Cnt2] = Fname;
		ResFileArrays[Cnt2] = WorksDir_13"/GrepRes_No_"Cnt".txt";
	}
	GenerateWord();
}

# ------------------------------------------------------------------------------------------------------------------------

END{
	close(Fname);
	DelArrays();
	delete GrepFileArrays;
	delete ResFileArrays;
}

# ------------------------------------------------------------------------------------------------------------------------

function DelArrays(){
	# 各GrepWordの格納配列を削除
	delete YouSen;
	delete You1;
	delete You2;
	delete YouRin;
	delete YouToku;
	delete ShouSen;
	delete Shou1;
	delete Shou2;
	delete ShouRin;
	delete ShouToku;
	delete ChuuSen;
	delete Chuu1;
	delete Chuu2;
	delete ChuuRin;
	delete ChuuToku;
	delete KouSen;
	delete Kou1;
	delete Kou2;
	delete KouRin;
	delete KouToku;
	delete TokuShiSen;
	delete TokuShi1;
	delete TokuShi2;
	delete TokuShiRin;
	delete TokuShiToku;
	delete YouKyouSen;
	delete YouKyou1;
	delete YouKyou2;
	delete YouKyouRin;
	delete YouKyouToku;
	delete EiSen;
	delete Ei1;
	delete Ei2;
	delete EiRin;
	delete EiToku;
	delete MouSen;
	delete Mou1;
	delete Mou2;
	delete MouRin;
	delete MouToku;
	delete RouSen;
	delete Rou1;
	delete Rou2;
	delete RouRin;
	delete RouToku;
	delete YouGakuSen;
	delete YouGaku1;
	delete YouGaku2;
	delete YouGakuRin;
	delete YouGakuToku;
}

# ------------------------------------------------------------------------------------------------------------------------

function GenerateWord(){
	switch($4){
		# 幼稚園
		case "幼専":
			GeneYouSen();
			next;
		case "幼1":
			GeneYou1();
			next;
		case "幼2":
			GeneYou2();
			next;
		case "幼臨":
			GeneYouRin();
			next;
		case "幼特":
			GeneYouToku();
			next;
		# 小学校
		case "小専":
			GeneShouSen();
			next;
		case "小1":
			GeneShou1();
			next;
		case "小2":
			GeneShou2();
			next;
		case "小臨":
			GeneShouRin();
			next;
		case "小特":
			GeneShouToku();
			next;
		# 中学校
		case "中専":
			GeneChuuSen();
			next;
		case "中1":
			GeneChuu1();
			next;
		case "中2":
			GeneChuu2();
			next;
		case "中臨":
			GeneChuuRin();
			next;
		case "中特":
			GeneChuuToku();
			next;
		# 高等学校
		case "高専":
			GeneKouSen();
			next;
		case "高1":
			GeneKou1();
			next;
		case "高2":
			GeneKou2();
			next;
		case "高臨":
			GeneKouRin();
			next;
		case "高特":
			GeneKouToku();
			next;
		# 特別支援学校
		case "特支専":
			GeneTokuShiSen();
			next;
		case "特支1":
			GeneTokuShi1();
			next;
		case "特支2":
			GeneTokuShi2();
			next;
		case "特支臨":
			GeneTokuShiRin();
			next;
		case "特支特":
			GeneTokuShiToku();
			next;
		# 養護教諭
		case "養教専":
			GeneYouKyouSen();
			next;
		case "養教1":
			GeneYouKyou1();
			next;
		case "養教2":
			GeneYouKyou2();
			next;
		case "養教臨":
			GeneYouKyouRin();
			next;
		case "養教特":
			GeneYouKyouToku();
			next;
		# 栄養教諭
		case "栄専":
			GeneEiSen();
			next;
		case "栄1":
			GeneEi1();
			next;
		case "栄2":
			GeneEi2();
			next;
		case "栄臨":
			GeneEiRin();
			next;
		case "栄特":
			GeneEiToku();
			next;
		# 盲学校
		case "盲専":
			GeneMouSen();
			next;
		case "盲1":
			GeneMou1();
			next;
		case "盲2":
			GeneMou2();
			next;
		case "盲臨":
			GeneMouRin();
			next;
		case "盲特":
			GeneMouToku();
			next;
		# 聾学校
		case "聾専":
			GeneRouSen();
			next;
		case "聾1":
			GeneRou1();
			next;
		case "聾2":
			GeneRou2();
			next;
		case "聾臨":
			GeneRouRin();
			next;
		case "聾特":
			GeneRouToku();
			next;
		# 養護学校
		case "養学専":
			GeneYouGakuSen();
			next;
		case "養学1":
			GeneYouGaku1();
			next;
		case "養学2":
			GeneYouGaku2();
			next;
		case "養学臨":
			GeneYouGakuRin();
			next;
		case "養学特":
			GeneYouGakuToku();
			next;
		default:
			next;
	}
}

# ------------------------------------------------------------------------------------------------------------------------

