#!/bin/sh
# sudo apt update
# sudo apt install maven
# wget http://archive.apache.org/dist/oozie/5.2.0/oozie-5.2.0.tar.gz
# tar -zxf oozie-5.2.0.tar.gz
# mv oozie-5.2.0 ../
# /home/hadoop/oozie-5.2.0/bin/mkdistro.sh -DskipTests -Dhadoop.version=2.10.1 -Puber
# (cd /home/hadoop/oozie-5.2.0/distro/target && tar -zxf oozie-5.2.0-distro.tar.gz)
# mkdir ../oozie
# cp -r ../oozie-5.2.0/distro/target/oozie-5.2.0-distro /home/hadoop/oozie
# mkdir ../oozie/libext
# cp ../hadoop-2.10.1/share/hadoop/common/*.jar ../oozie/libext/gC
# cp ../hadoop-2.10.1/share/hadoop/common/lib/*.jar ../oozie/libext/
# cp ../hadoop-2.10.1/share/hadoop/mapreduce/*.jar ../oozie/libext/
# cp ../hadoop-2.10.1/share/hadoop/mapreduce/lib/*.jar ../oozie/libext/
# cp ../hadoop-2.10.1/share/hadoop/hdfs/*.jar ../oozie/libext/
# cp ../hadoop-2.10.1/share/hadoop/hdfs/lib/*.jar ../oozie/libext/
# cp ../hadoop-2.10.1/share/hadoop/yarn/*.jar ../oozie/libext/
# cp ../hadoop-2.10.1/share/hadoop/yarn/lib/*.jar ../oozie/libext/
# cp ../apache-hive-2.3.8-bin/lib/mysql-connector-java.jar ../oozie/libext/
(cd /home/hadoop/oozie/libext/ && wget http://archive.cloudera.com/gplextras/misc/ext-2.2.zip)
