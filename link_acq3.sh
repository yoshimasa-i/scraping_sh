#!/bin/bash

# 取得URL結合
cat data/url/*.csv > /data/url/url.csv
mv /data/url/url.csv /var/lib/mysql-files/url.csv
