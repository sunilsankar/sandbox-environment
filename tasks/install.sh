#!/bin/bash
dnf install epel-release -y
dnf clean all
dnf update -y
dnf install sshpass podman python python3-pip gcc git cmake make gcc vim curl libnsl -y

pip install --upgrade pip setuptools
pip install --ignore-installed PyYAML
pip install -r /vagrant/tasks/files/requirements.txt

cp /vagrant/tasks/files/motd.sh /etc/profile.d/
