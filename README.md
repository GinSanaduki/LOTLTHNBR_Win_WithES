<p align="center">
    <a href="https://opensource.org/licenses/BSD-3-Clause"><img src="https://img.shields.io/badge/license-bsd-orange.svg" alt="Licenses"></a>
</p>

# LOTLTHNBR

## Introduction

LOTLTHNBR Scripts provides a function to obtain a list of non-returned license numbers of teacher licenses from the Ministry of Education, Culture, Sports, Science and Technology from the website of the Ministry of Education, Culture, Sports, Science and Technology, and to inquire by license number.  
This Scripts needs GAWK(the GNU implementation of the AWK programming language) version 4.0 or later and BusyBox developed by Erik Andersen, Rob Landley, Denys Vlasenko and others.  

文部科学省の公開している未返納教員免許状一覧からデータを取得し免許番号の照会を行います。
担任の教職員に教員免許状を確認すれば、教育委員会の採用担当に限らず、保護者の方でも確認を行うことができます。

LOTLTHNBRはGAWK、busyboxのバイナリで動作します。

以下のリンクからダウンロードするか、releaseのタグからダウンロードして、zipファイルを解凍し、ExplorerDefineフォルダに照会したい免許番号を記載したテキストファイル（拡張子がtxt、dat、log、def、conf、csv、tsv（それぞれ小文字）に対応）を格納し、subbat内の07_Exec_DETECTOR.batというバッチファイルをクリックするだけで起動します。
https://github.com/GinSanaduki/LOTLTHNBR_Win_WithES/releases/download/v1.0.0/LOTLTHNBR_Win_WithES.zip

照会結果はLogFileというフォルダにログとして出力され、テキストエディタが起動しテキストエディタ上で結果を確認できます。



# 注意
## 免許番号を記載する際に、必ず改行を入れてください。挙動がおかしくなる場合があります。

## 免許番号を記載する際に、必ず「平30高1第98765号」のように、「第」をつけて照会してください。
   * これは、「第」がない場合に、以下のような困った事態が発生してしまうためです。

文科省が発表している未返納教員免許一覧の実表の中には、「中」という表記しかない免許もあります。  
「中」だけだと、一種普通免許かどうかすらわからないのです。  
これはつまり、「高12345」や「中22345」といった、「中学校の何の免許かよくわからないが通し番号が22345」か、「中学校の2種免許で通し番号が2345」なのかがシステムでどうしても区別がつかない、という事態になってしまいます。  
そのため、「第」がついていない、ExplorerDefineフォルダに照会したい免許番号を記載したテキストファイルの免許番号は、照会しない措置をとっています。  
この点はどうかご留意ください。  
ただし、照会時点では、「第」がついていないケースも想定した照会処理も行っていますので、ご安心ください。  

## LOTLTHNBRに対するバグレポートは随時受け付けますが、それ以外の苦情は基本的に受け付けませんのであしからず。

GAWK 5.0.1 Download ezwinports from SourceForge.net

https://sourceforge.net/projects/ezwinports/files/gawk-5.0.1-w32-bin.zip/download

BusyBox Official

https://www.busybox.net/

BusyBox -w32
http://frippery.org/busybox/

Download

http://frippery.org/files/busybox/busybox.exe

BusyBox Wildcard expansion

https://frippery.org/busybox/globbing.html

Download

https://frippery.org/files/busybox/busybox_glob.exe

nkf32 developed by Itaru Ichikawa and others.

Download

https://www.vector.co.jp/soft/win95/util/se295331.html

