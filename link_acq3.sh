#!/bin/bash

# 取得URL結合
cat *.csv > url.csv
mv url.csv /var/lib/mysql-files/url.csv
