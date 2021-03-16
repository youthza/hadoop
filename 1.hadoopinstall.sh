!/bin/bash
sudo apt update
sudo cp config/hosts /etc/hosts
#sudo cp config/hostname /etc/hostname
sudo apt install openjdk-8-jdk openjdk-8-jre -y
sudo apt install openssh-server openssh-client -y
# wget http://mirror1.ku.ac.th/apache/hadoop/common/hadoop-2.10.1/hadoop-2.10.1.tar.gz
cp hadoopTar/hadoop-2.10.1.tar.gz ../hadoopsh
tar -xzf hadoop-2.10.1.tar.gz 
mv hadoop-2.10.1 ../
cp config/.bashrc ../.bashrc
source ~/.bashrc
cp config/core-site.xml ../hadoop-2.10.1/etc/hadoop/core-site.xml
mkdir -p ~/hdfs/namenode ~/hdfs/datanode
cp config/hdfs-site.xml ../hadoop-2.10.1/etc/hadoop/hdfs-site.xml
cp config/mapred-site.xml ../hadoop-2.10.1/etc/hadoop/
cp config/yarn-site.xml ../hadoop-2.10.1/etc/hadoop/yarn-site.xml
# hdfs namenode -format
cp config/hadoop-env.sh ../hadoop-2.10.1/etc/hadoop/hadoop-env.sh 
# start-dfs.sh
# start-yarn.sh