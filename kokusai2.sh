#!/bin/bash

# data/urlディレクトリ内のファイル削除
rm -f /var/lib/mysql-files/*

# 公開中のidを取得してRESULTへ
RESULT=`mysql -u root -N -e "SELECT DISTINCT a.ID from kokusai_db.kokusai_posts as a join kokusai_db.kokusai_postmeta as b on a.ID = b.post_id where a.post_type = 'property' and a.post_status = 'publish';"`

# 公開中のデータ取得
for i in $RESULT
do
  mysql -u root -N -e "select * from kokusai_db.kokusai_postmeta where post_id = $i into outfile '/var/lib/mysql-files/$i' ;"
done
