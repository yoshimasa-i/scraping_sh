#!/bin/bash

# バックスラッシュ削除
cat /var/lib/mysql-files/INPUT2.csv | tr -d '\\' > /var/lib/mysql-files/INPUT3.csv

# tableから値を削除
mysql -u root -N -e 'DELETE FROM scraping.kokusai_detail;'

# 詳細ページのテキストをproperty_detailへ格納
mysql -u root -N -e 'LOAD DATA LOCAL INFILE "/var/lib/mysql-files/INPUT3.csv" INTO TABLE scraping.kokusai_detail FIELDS TERMINATED BY "," (id,title,rent,service,room_arr,deposit,addressnumber,addressnumber2,route,age,floor_plan2,season,structure,locality_floor,locality_floor_rank,facility,remarks);'

# mysql-filesのcsv削除
rm -f /var/lib/mysql-files/*.csv
