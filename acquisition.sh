#!/bin/bash

# data/urlディレクトリ内のファイル削除
rm -rf /data/url/*

# dbから詳細ページurlをRESULTへ
RESULT=`mysql -u root -N -e "SELECT url FROM scraping.list_url;"`

# 対象URLからHTMLを取得する
for i in $RESULT
do
 curl -O http://www.example.net/$i
done