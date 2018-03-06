#!/bin/bash

# 取得した詳細ページからテキストを抽出
ls -1 /var/lib/mysql-files | while read line
do
a[0]=$line
a[1]=`cat /var/lib/mysql-files/$line | grep 'title' | awk ' NR == 1 { print $4 } ' | tr -d ','`
a[2]=`cat /var/lib/mysql-files/$line | grep 'rent' | awk ' NR == 1 { print $4 } ' | tr -d ','`
a[3]=`cat /var/lib/mysql-files/$line | grep 'service' | awk ' NR == 1 { print $4 } ' | tr -d ','`
a[4]=`cat /var/lib/mysql-files/$line | grep 'deposit' | awk ' NR == 1  {print $4,"ヶ月"}' | tr -d ','`
a[5]=`cat /var/lib/mysql-files/$line | grep 'gratuity-fee' | awk ' NR == 1  { print $4,"ヶ月" }' | tr -d ','`
a[6]=`cat /var/lib/mysql-files/$line | grep 'address' | awk ' NR == 3 { print $4 } ' | tr -d ','`
a[7]=`cat /var/lib/mysql-files/$line | grep 'address-number' | awk ' NR == 1 { print $4 } ' | tr -d ','`
a[8]=`cat /var/lib/mysql-files/$line | grep 'route' | awk ' NR == 1 { print $4 } ' | tr -d ','`
a[9]=`cat /var/lib/mysql-files/$line | grep 'age' | awk ' NR == 7 { print $4 } ' | tr -d ','`
a[10]=`cat /var/lib/mysql-files/$line | grep 'floor_plan2' | awk ' NR == 1 { print $4 } ' | tr -d ','`
a[11]=`cat /var/lib/mysql-files/$line | grep 'season' | awk ' NR == 1 { print $4 } ' | tr -d ','`
a[12]=`cat /var/lib/mysql-files/$line | grep 'structure' | awk ' NR == 1 { print $4 } ' | tr -d ','`
a[13]=`cat /var/lib/mysql-files/$line | grep 'locality-floor' | awk ' NR == 1 { print $4 } ' | tr -d ','`
a[14]=`cat /var/lib/mysql-files/$line | grep 'locality-floor-rank' | awk ' NR == 1 { print $4 } ' | tr -d ','`
a[15]=`cat /var/lib/mysql-files/$line | grep 'facility' | awk ' NR == 1 { print $4 } ' | tr -d ','`
a[16]=`cat /var/lib/mysql-files/$line | grep 'remarks' | tr -d ' ' | awk ' NR == 1 { print $4 } '`

echo "${a[0]}, ${a[1]}, ${a[2]}, ${a[3]}, ${a[4]}, ${a[5]}, ${a[6]}, ${a[7]}, ${a[8]}, ${a[9]}, ${a[10]}, ${a[11]}, ${a[12]}, ${a[13]}, ${a[14]}, ${a[15]}, ${a[16]}" > /var/lib/mysql-files/$line.csv

nkf -w --overwrite /var/lib/mysql-files/$line.csv

done

cat /var/lib/mysql-files/*.csv > /var/lib/mysql-files/INPUT2.csv
