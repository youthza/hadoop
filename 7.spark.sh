#!/bin/sh
cp hadoopTar/spark-3.1.1-bin-hadoop2.7.tgz ../hadoopsh
tar -xzf spark-3.1.1-bin-hadoop2.7.tgz
mv spark-3.1.1-bin-hadoop2.7 ../
cp config/spark-env.sh ../spark-3.1.1-bin-hadoop2.7/conf/
rm ../spark-3.1.1-bin-hadoop2.7/conf/spark-env.sh.template
cp config/slaves ../spark-3.1.1-bin-hadoop2.7/conf/
(cd /home/hadoop/spark-3.1.1-bin-hadoop2.7/sbin/ && ./start-master.sh)
(cd /home/hadoop/spark-3.1.1-bin-hadoop2.7/sbin/ && ./start-workers.sh)