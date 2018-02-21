#! bin/bash

# ディレクトリのファイルを一ファイル毎にテキスト整形
ls -1 | while read line
do
a[0]=`cat ../url/$line | sed -n  '/<title>/,/<\/title>/p' | sed -e 's/<[^>]*>//g' | tr -d ',' | tr -d '\t' | sed -e '1d'`
a[1]=`cat ../url/$line | grep '<td class="price">' | sed -e 's/<[^>]*>//g' | tr -d ',' | tr -d '\t'`
a[2]=`cat ../url/$line | grep '<td class="price_management">' | sed -e 's/<[^>]*>//g' | tr -d ',' | tr -d '\t'`
a[3]=`cat ../url/$line | grep '<td class="roomplan">' | sed -e 's/<[^>]*>//g' | tr -d ',' | tr -d '\t'`
a[4]=`cat ../url/$line | grep '<td class="price_deposit">' | sed -e 's/<[^>]*>//g' | tr -d ',' | tr -d '\t'`
a[5]=`cat ../url/$line | grep '<td class="charge_mediate">' | sed -e 's/<[^>]*>//g' | tr -d ',' | tr -d '\t'`
a[6]=`cat ../url/$line | sed -n  '/<th>仲介手数料/,/<\/td>/p' | grep '</td>' | sed -e 's/<[^>]*>//g' | tr -d ',' | tr -d '\t'`
a[7]=`cat ../url/$line | sed -n  '/<th>築年月/,/<\/td>/p' | grep '</td>' | sed -e 's/<[^>]*>//g' | tr -d ',' | tr -d '\t'`
a[8]=`cat ../url/$line | sed -n  '/<th colspan="2" class="tal">住所/,/<\/td>/p' | grep '<td colspan="2" class="cols">' | sed -e 's/<[^>]*>//g' | tr -d ',' | tr -d '\t'`
a[9]=`cat ../url/$line | sed -n  '/<th colspan="2" class="tal">アクセス/,/<\/td>/p' | grep '<td colspan="2" class="cols">' | sed -e 's/<[^>]*>//g' | tr -d ',' | tr -d '\t'`
a[10]=`cat ../url/$line | sed -n  '/<th width="20%">物件名/,/<\/tr>/p' | grep '</td>' | sed -e 's/<[^>]*>//g' | tr -d ',' | tr -d '\t'`
a[11]=`cat ../url/$line | sed -n  '/<th>種目/,/<\/td>/p' | grep '</td>' | sed -e 's/<[^>]*>//g' | tr -d ',' | tr -d '\t'`
a[12]=`cat ../url/$line | sed -n  '/<th>構造/,/<\/td>/p' | grep '</td>' | sed -e 's/<[^>]*>//g' | tr -d ',' | tr -d '\t'`
a[13]=`cat ../url/$line | sed -n  '/<th>更新料/,/<\/td>/p' | grep '</td>' | sed -e 's/<[^>]*>//g' | tr -d ',' | tr -d '\t'`
a[14]=`cat ../url/$line | sed -n  '/<th>その他費用/,/<\/td>/p' | grep '</td>' | sed -e 's/<[^>]*>//g' | tr -d ',' | tr -d ',' | tr -d '\t'`
a[15]=`cat ../url/$line | sed -n  '/<th>保険料/,/<\/td>/p' | grep '</td>' | sed -e 's/<[^>]*>//g' | tr -d ',' | tr -d '\t'`
a[16]=`cat ../url/$line | sed -n  '/<th>契約形態/,/<\/td>/p' | grep '</td>' | sed -e 's/<[^>]*>//g' | tr -d ',' | tr -d '\t'`
a[17]=`cat ../url/$line | sed -n  '/<th>間取内訳/,/<\/td>/p' | grep '</td>' | sed -e 's/<[^>]*>//g' | tr -d ',' | tr -d '\t'`
a[18]=`cat ../url/$line | sed -n  '/<th>取引態様/,/<\/td>/p' | grep '</td>' | sed -e 's/<[^>]*>//g' | tr -d ',' | tr -d '\t'`
a[19]=`cat ../url/$line | sed -n  '/<th>引渡/,/<\/td>/p' | grep '</td>' | sed -e 's/<[^>]*>//g' | tr -d ',' | tr -d '\t'`
a[20]=`cat ../url/$line | sed -n  '/<th>駐車場/,/<\/td>/p' | grep '</td>' | sed -e 's/<[^>]*>//g' | sed "s/$/,/g" | tr -d ',' | tr -d '\t'`
a[21]=`cat ../url/$line | sed -n  '/<th colspan="2" class="tal">設備/,/<\/td>/p' | grep '<td colspan="2" class="cols">' | sed -e 's/<[^>]*>//g' | sed "s/$/,/g" | tr -d ',' | tr -d '\t'`
a[22]=`cat ../url/$line | sed -n  '/<th colspan="2" class="tal">備考/,/<\/td>/p' | sed -e 's/<[^>]*>//g' | sed -e '1,3d' | tr -d ',' | tr -d '\t' | tr '\n' ' '`
echo "${a[0]}, ${a[1]}, ${a[2]}, ${a[3]}, ${a[4],a[5]}, ${a[6]}, ${a[7]}, ${a[8]}, ${a[9]}, ${a[10]}, ${a[11]}, ${a[12]}, ${a[13]}, ${a[14]}, ${a[15]}, ${a[16]}, ${a[17]}, ${a[18]}, ${a[19]}, ${a[20]}, ${a[21]}, ${a[22]}" > $line.txt
# ^M削除
cat /data/url/$line.txt | sed -e s/^M// > $line.csv
# UTF8に変換
nkf -w --overwrite $line.csv
# mysql-filesへ移動
mv /data/url/$line.csv /var/lib/mysql-files/$line.csv
done
