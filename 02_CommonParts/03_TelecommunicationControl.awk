#! /usr/bin/gawk
# 03_TelecommunicationControl.awk

# ------------------------------------------------------------------------------------------------------------------------

# Copyright 2019 The LOTLTHNBR Project Authors, GinSanaduki.
# All rights reserved.
# Use of this source code is governed by a BSD-style license that can be found in the LICENSE file.
# LOTLTHNBR Scripts provides a function to obtain a list of non-returned license numbers of teacher licenses from the Ministry of Education, Culture, Sports, Science and Technology from the website of the Ministry of Education, Culture, Sports, Science and Technology, and to inquire by license number.
# This Scripts needs GAWK(the GNU implementation of the AWK programming language) version 4.0 or later and BusyBox developed by Erik Andersen, Rob Landley, Denys Vlasenko and others.
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

function EditHTTPResponse(){
	# HTMLに対しスパイダを掛け、HTTPレスポンスヘッダを取得する。
	# HTTPレスポンスヘッダは標準エラー出力として出るため、標準出力に統合している。
	cmd = CALL_BUSYBOX" wget -q --spider -S \""MEXT_URL"\" 2>&1";
	cnt = 1;
	while(cmd | getline esc){
		HTTPResArrays[cnt] = esc;
		cnt++;
	}
	close(cmd);
	for(i in HTTPResArrays){
		# 先頭の半角スペースを除去
		HTTPResArrays[i] = substr(HTTPResArrays[i],3);
	}
	
	# 以降の仕組みは、mkzipdic_kenall.shを参考にしています。
	# https://github.com/ShellShoccar-jpn/zip2addr/blob/master/data/mkzipdic_kenall.sh
	
	# HTTPリターンコードを取得
	status = 0;
	for(i in HTTPResArrays){
		mat = match(HTTPResArrays[i],/^HTTP\//);
		if(mat > 0){
			split(HTTPResArrays[i],SplitLine_HTTP);
			status = SplitLine_HTTP[2];
			delete SplitLine_HTTP;
			break;
		}
	}
	# ETagを取得
	ETag = "";
	for(i in HTTPResArrays){
		mat = match(HTTPResArrays[i],/^ETag: /);
		if(mat > 0){
			# 不要部分を除外
			ETag = HTTPResArrays[i];
			gsub("ETag: ","",ETag);
			gsub("\"","",ETag);
			break;
		}
	}
	# Last-Modifiedを取得
	d["Jan"] = "01";
	d["Feb"] = "02";
	d["Mar"] = "03";
	d["Apr"] = "04";
	d["May"] = "05";
	d["Jun"] = "06";
	d["Jul"] = "07";
	d["Aug"] = "08";
	d["Sep"] = "09";
	d["Oct"] = "10";
	d["Nov"] = "11";
	d["Dec"] = "12";
	ts = "";
	for(i in HTTPResArrays){
		mat = match(HTTPResArrays[i],/^^Last-Modified/);
		if(mat > 0){
			split(HTTPResArrays[i],SplitLine_LastModified);
			gsub(/:/, "", SplitLine_LastModified[6]);
			YYYYMMDDHHmmSS = sprintf("%04d%02d%02d%06d" ,SplitLine_LastModified[5],d[SplitLine_LastModified[4]],SplitLine_LastModified[3],SplitLine_LastModified[6]);
			delete SplitLine_LastModified;
			break;
		}
	}
	len = length(YYYYMMDDHHmmSS);
	delete HTTPResArrays;
	if (status >= 200 && status < 300 && len == 14) {
		return 0;
	} else {
		return 99;
	}
}

# ------------------------------------------------------------------------------------------------------------------------

function GetContents(GetContents_URL,GetContents_OUTFILE){
	cmd = CALL_BUSYBOX" wget -q \""GetContents_URL"\" -O \""GetContents_OUTFILE"\"";
	ExecCmd(cmd);
}

# ------------------------------------------------------------------------------------------------------------------------

function SLEEP(){
	cmd = CALL_BUSYBOX" sleep 5";
	ExecCmd(cmd);
}

# ------------------------------------------------------------------------------------------------------------------------

