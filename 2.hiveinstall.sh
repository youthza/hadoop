#!/bin/sh
wget http://mirror1.ku.ac.th/apache/hive/hive-2.3.8/apache-hive-2.3.8-bin.tar.gz
tar -xzf apache-hive-2.3.8-bin.tar.gz
mv apache-hive-2.3.8-bin ../
#cp config/.bashrc ../.bashrc
#source .bashrc
#start-dfs.sh
hdfs dfs -mkdir /bigdata
hdfs dfs -mkdir /bigdata/tmp
hdfs dfs -mkdir -p /bigdata/hive/warehouse
hdfs dfs -chmod g+w /bigdata/tmp
hdfs dfs -chmod g+w /bigdata/hive/warehouse
cp config/hive-env.sh ../apache-hive-2.3.8-bin/conf/
cp config/mysql-connector-java.jar $HIVE_HOME/lib/
mysql -uroot -p'!Sys@dmin1' -e "CREATE DATABASE metastore;"  
#----mysql -uroot -p'!Sys@dmin1' "metastore" -e  "SOURCE /home/hadoop/apache-hive-2.3.8-bin/scripts/metastore/upgrade/mysql/hive-schema-2.3.0.mysql.sql"
mysql -uroot -p'!Sys@dmin1' "metastore" -e "CREATE USER 'hiveuser'@'%' IDENTIFIED BY '!Sys@dmin1';"
mysql -uroot -p'!Sys@dmin1' "metastore" -e "GRANT all on *.* to 'hiveuser'@'%';"
mysql -uroot -p'!Sys@dmin1' "metastore" -e "GRANT ALL PRIVILEGES ON *.* TO 'hiveuser'@'%' WITH GRANT OPTION;"
mysql -uroot -p'!Sys@dmin1' "metastore" -e "FLUSH PRIVILEGES;"
cp config/hive-site.xml $HIVE_HOME/conf/
cp config/guava-11.0.2.jar $HIVE_HOME/lib/
rm ../apache-hive-2.3.8-bin/lib/guava-14.0.1.jar