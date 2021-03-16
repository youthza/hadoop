#!/bin/sh
sudo apt-get update
sudo apt-get install gcc g++ make libxml2-dev libxslt1-dev libsasl2-dev libsasl2-modules-gssapi-mit libmysqlclient-dev python-dev-is-python2 python-setuptools libsqlite3-dev ant libkrb5-dev libtidy-dev libtidy-dev libldap2-dev libssl-dev libgmp3-dev build-essential libssl-dev libffi-dev npm -y
wget https://cdn.gethue.com/downloads/hue-4.8.0.tgz
cp hadoopTar/hue-4.8.0.tgz ../hadoopsh
tar -xzf hue-4.8.0.tgz
mv hue-4.8.0 ../
# /home/hadoop/hue-4.8.0/make
# sudo make -C /home/hadoop/hue-4.8.0/
# ----------(cd /home/hadoop/hue-4.8.0 && PREFIX=/home/hadoop/ make install)
mysql -uroot -p'!Sys@dmin1' -e "CREATE DATABASE hue;"
mysql -uroot -p'!Sys@dmin1' "hue" -e "CREATE USER 'hueuser'@'%' IDENTIFIED BY '!Sys@dmin1';"
mysql -uroot -p'!Sys@dmin1' "hue" -e "GRANT all on *.* to 'hueuser'@'%';"
mysql -uroot -p'!Sys@dmin1' "hue" -e "GRANT ALL PRIVILEGES ON hue.* TO 'hueuser'@'%' WITH GRANT OPTION;"
mysql -uroot -p'!Sys@dmin1' "hue" -e "FLUSH PRIVILEGES;"
# ----------cp config/hue.ini ../hue/desktop/conf/