#!/bin/bash
dnf install epel-release -y
dnf clean all
dnf update -y
dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo

dnf install  docker-ce --nobest python3 python3-virtualenv gcc git cmake make gcc vim curl libnsl -y

pip3 install --upgrade pip setuptools
pip3 install --ignore-installed PyYAML
pip3 install -r /vagrant/tasks/files/requirements.txt
systemctl start docker
systemctl enable docker
usermod -G docker vagrant
cp /vagrant/tasks/files/motd.sh /etc/profile.d/
###Configure Motd####
# echo '
# USER=`whoami`
# HOSTNAME=`uname -n`
# MEMORY1=`free -t -m | grep "Mem" | awk "{print $3" MB";}"`
# MEMORY2=`free -t -m | grep "Mem" | awk "{print $2" MB";}"`
# LOAD1=`cat /proc/loadavg | awk "{print $1'}"`
# LOAD5=`cat /proc/loadavg | awk "{print $2}"`
# LOAD15=`cat /proc/loadavg | awk "{print $3}"`
# echo "
# ===========================================================================
#  - Hostname............: $HOSTNAME
#  - Release.............: `cat /etc/redhat-release`
#  - Users...............: Currently `users | wc -w` user(s) logged on
# ===========================================================================
#  - Current user........: $USER
#  - CPU usage...........: $LOAD1, $LOAD5, $LOAD15 (1, 5, 15 min)
#  - Memory used.........: $MEMORY1 / $MEMORY2
#  - Swap in use.........: `free -m | tail -n 1 | awk '{print $3}'` MB
# ===========================================================================
# "' > /etc/profile.d/motd.sh