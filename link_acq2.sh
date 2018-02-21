#!/bin/bash

list=1

for list in *; do
# 詳細部分を抽出し上書き保存とバックアップ                                                                                                  2 16, 0:44:32
sed -n -i'.bak'  '/<div id="side_room_plan">/,/<\/div>/p' "${list}"
# タブ除去
cat "${list}" | tr -d '\t' > "${list}".txt
# URLのみ取得
sed -n -i'.bak' 's/^.*href="\([^"]*\)".*$/\1/p' "${list}.txt"
# 重複削除
uniq "${list}.txt" > "${list}".csv
done
