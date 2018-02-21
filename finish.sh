#! bin/bash

# link.shで作成したurl.csvを削除
rm -f /var/lib/mysql-files/url.csv
cat /var/lib/mysql-files/*.csv > /var/lib/mysql-files/INPUT.csv

# 詳細ページのテキストをproperty_detailへ格納
mysql -u root -N -e 'LOAD DATA LOCAL INFILE "/var/lib/mysql-files/INPUT.csv" INTO TABLE scraping.property_detail FIELDS TERMINATED BY "," (url,rent,man_exp,room_arr,deposit,int_fee,build_age,address,access,prop_name,event,structure,renewal_fee,other_cost,insurance,contract,room_detail,trading_aspect,passing,parking,facility,remarks);'

# mysql-filesのcsv削除
rm -f /var/lib/v/*.csv
