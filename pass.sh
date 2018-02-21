#!/bin/sh

# パスワードをセット
PASSWORD="パスワード"

# csvデータをテーブルへ格納
PROCESS_COUNT=`MYSQL_PWD=${PASSWORD} /usr/bin/mysql -u root -N -e 'LOAD DATA LOCAL INFILE "/var/lib/mysql-files/url.csv" REPLACE INTO TABLE scraping.list_url FIELDS TERMINATED BY "," (url);'`

echo ${PROCESS_COUNT}
