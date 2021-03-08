#!/bin/sh
MYPASS=`cat pass.txt`
echo "MYPASS: $MYPASS"

ssh hadoop@datanode1 -t 'echo '${MYPASS}' | sudo -S apt update'
ssh hadoop@datanode2 -t 'echo '${MYPASS}' | sudo -S apt update'
scp config/hosts hadoop@datanode1:/home/hadoop/hosts
scp config/hosts hadoop@datanode2:/home/hadoop/hosts
ssh hadoop@datanode1 -t 'echo '${MYPASS}' | sudo -S cp /home/hadoop/hosts /etc/hosts'
ssh hadoop@datanode2 -t 'echo '${MYPASS}' | sudo -S cp /home/hadoop/hosts /etc/hosts'
ssh hadoop@datanode1 -t 'echo '${MYPASS}' | sudo -S apt install openjdk-8-jdk openjdk-8-jre -y'
ssh hadoop@datanode2 -t 'echo '${MYPASS}' | sudo -S apt install openjdk-8-jdk openjdk-8-jre -y'
ssh hadoop@datanode1 -t 'echo '${MYPASS}' | sudo -S apt install openssh-server openssh-client -y'
ssh hadoop@datanode2 -t 'echo '${MYPASS}' | sudo -S apt install openssh-server openssh-client -y'
ssh hadoop@datanode1 -t 'wget http://mirror1.ku.ac.th/apache/hadoop/common/hadoop-2.10.1/hadoop-2.10.1.tar.gz'
ssh hadoop@datanode2 -t 'wget http://mirror1.ku.ac.th/apache/hadoop/common/hadoop-2.10.1/hadoop-2.10.1.tar.gz'
ssh hadoop@datanode1 -t 'tar -xzf hadoop-2.10.1.tar.gz '
ssh hadoop@datanode2 -t 'tar -xzf hadoop-2.10.1.tar.gz '
scp config/.bashrc hadoop@datanode1:/home/hadoop/.bashrc
scp config/.bashrc hadoop@datanode2:/home/hadoop/.bashrc
ssh hadoop@datanode1 -t 'source ~/.bashrc'
ssh hadoop@datanode2 -t 'source ~/.bashrc'
scp config/namenode/* hadoop@datanode1:/home/hadoop/hadoop-2.10.1/etc/hadoop
scp config/namenode/* hadoop@datanode2:/home/hadoop/hadoop-2.10.1/etc/hadoop
hdfs namenode -format
start-dfs.sh
start-yarn.sh
