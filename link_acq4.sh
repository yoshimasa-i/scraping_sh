#!/bin/sh

# list_urlテーブルへ値を格納
mysql -u root -N -e 'LOAD DATA LOCAL INFILE "/var/lib/mysql-files/url.csv" REPLACE INTO TABLE scraping.list_url FIELDS TERMINATED BY "," (url);'`
