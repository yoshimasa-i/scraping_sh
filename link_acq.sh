#!/usr/bin/bash

# 作業前に/data/url/内を削除
rm -rf /data/url/*

list=1
# 対象URLからHTMLを取得
while true
do
  curl -O http://www.example.net/$list > $list
  list=`expr $list + 1`
  if [ $list -eq 100 ]; then
    exit 0
  fi
done
