#!/bin/bash

cd /data/url

#list=1
#for list in *; do
# 詳細部分を抽出し上書き保存とバックアップ
ls -F /data/url | grep -v .txt | grep -v .csv | while read line
do
sed -n -i'.bak'  '/<div id="side_room_plan">/,/<\/div>/p' "${line}"
# タブ除去
cat "${line}" | tr -d '\t' > "${line}".txt
# URLのみ取得
sed -n -i'.bak' 's/^.*href="\([^"]*\)".*$/\1/p' "${line}.txt"
# 重複削除
uniq "${line}.txt" > "${line}".csv
done
