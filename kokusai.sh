#!/bin/bash

# dbバックアップ
mysqldump -u root db_name > /tmp/`date +%Y%m%d_kokusai_db.sql`

# dumpファイルからtable復旧1
mysql -u root kokusai_db < /tmp/file_name.dump

# dumpファイルからtable復旧2
mysql -u root kokusai_db < /tmp/file_name2.dump
