# 01_String_Quartet_No44_in_Bb_major Op50_1_Hob_III_44.awk
# String Quartet No.44 in Bb major Op.50-1 Hob.III:44
# ①検査用に01_Konzert_fur_Klavier_und_Orchester_Nr27_B_Dur_K595.awkを起動。これにより、少なくとも本日分のDefineCSVとハッシュ表は担保できる。
# ②DefineCSVから日付の降順でファイルリストを配列に格納する。
# ③ExplorerDefineから拡張子が.txt、.dat、.log、.def、.conf、.csv、.tsvのファイルリストを抽出し、nkfの-g（--guess）オプションでShift_JISかUTF-8のみ抽出する。asciiはマルチバイト文字検索を行う前提からしておかしいので、抽出対象には入らない。
# ④SJIS_txt_conf_dat_def_log.tmp、SJIS_csv.tmp、SJIS_tsv.tmp、UTF8_txt_conf_dat_def_log.tmp、UTF8_csv.tmp、UTF_tsv.tmp、txt_conf_dat_def_log.tmp、csv.tmp、tsv.tmp、Detector_Target.defをnulデバイスで初期化する。抽出したファイルから、Shift-JISファイルをcatで抽出し、それぞれ追記リダイレクト形式で格納する。抽出したファイルから、UTF8ファイルをnkfでShift-JISに変換し、それぞれ格納する。その後、txt_conf_dat_def_log.tmp、csv.tmp、tsv.tmpに統合し、SJIS_txt_conf_dat_def_log.tmp、SJIS_csv.tmp、SJIS_tsv.tmp、UTF8_txt_conf_dat_def_log.tmp、UTF8_csv.tmp、UTF_tsv.tmpを削除する。
# ⑤csv.tmpからカンマを改行に変換したものと、tsv.tmpからタブを改行に変換したものと、txt_conf_dat_def_log.tmpをDetector_Target.defに空行を除外し統合し、txt_conf_dat_def_log.tmp、csv.tmp、tsv.tmpを削除する。Detector_Target.defが空ファイルの場合、検索対象がファイルに記載されていない警告を出し、異常終了させる。
# ⑥「0-9」「平」「昭」「令」「幼」、「小」、「中」、「高」、「特」、「支」、「養」、「教」、「栄」、「盲」、「聾」、「養」、「学」、「専」、「臨」、「免」、「め」、「第」、「号」、「元」、「〇」、「一」、「二」、「三」、「四」、「五」、「六」、「七」、「八」、「九」、「十」、「百」、「千」、「万」、「１」、「２」、「３」、「４」、「５」、「６」、「７」、「８」、「９」、「０」以外が含まれていたら、行を除外する。
# ⑦「〇」、「一」、「二」、「三」、「四」、「五」、「六」、「七」、「八」、「九」、「十」、「百」、「千」、「万」、「１」、「２」、「３」、「４」、「５」、「６」、「７」、「８」、「９」、「０」が含まれていたら、変換処理を実行する。
# ⑧「〇」、「一」、「二」、「三」、「四」、「五」、「六」、「七」、「八」、「九」、「十」、「百」、「千」、「万」、「１」、「２」、「３」、「４」、「５」、「６」、「７」、「８」、「９」、「０」が含まれていたら、当該行を除外する。
# ⑨「元」を「1」に置換する。
# ⑩正規表現で検索し、該当行のみを検索対象とする。存在しない場合、異常終了。
# ⑪該当行から表記ゆれ対策を兼ねたfgrep用リストを生成する。
# ⑫過去日付のファイルが存在する場合、過去日付のファイル名を行頭につけ、照会リストを作る。
# ⑬当日日付で存在するかqオプションでチェックし、存在した場合は再度取得し、警告を出し、ログに記録する。
# ⑭当日日付で存在しない場合、過去ファイルも存在しない場合は正常終了。過去ファイルが存在する場合、過去ファイルを検索し、存在した場合警告を出し、ログに記録する。

