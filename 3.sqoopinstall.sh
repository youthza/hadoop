#!/bin/sh
wget http://mirrors.hust.edu.cn/apache/sqoop/1.4.7/sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz
tar -zxf sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz
mv sqoop-1.4.7.bin__hadoop-2.6.0 ../sqoop-1.4.7
#cp config/.bashrc ../.bashrc
#source .bashrc
cp config/sqoop-env.sh ../sqoop-1.4.7/conf/
cp config/mysql-connector-java.jar ../sqoop-1.4.7/lib/
cp config/postgresql-42.2.5.jar ../sqoop-1.4.7/lib/
hadoop fs -mkdir -p /user/sqoop
hadoop fs -chmod 777 /user/sqoop
cp $HIVE_HOME/lib/hive-common-2.3.8.jar $SQOOP_HOME/lib/