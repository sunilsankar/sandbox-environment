#!/bin/bash
dnf install epel-release -y
dnf clean all
dnf update -y
dnf install sshpass podman python python3-pip gcc git cmake make gcc vim curl libnsl -y
su - vagrant -c "podman --storage-opt overlay.ignore_chown_errors=true pull docker.io/sunilsankar/docker-almalinux"
su - vagrant -c "podman --storage-opt overlay.ignore_chown_errors=true pull docker.io/sunilsankar/docker-rocky8"
pip install --upgrade pip setuptools
pip install --ignore-installed PyYAML
pip install -r /vagrant/tasks/files/requirements.txt

cp /vagrant/tasks/files/motd.sh /etc/profile.d/
\cp /vagrant/tasks/files/login.py /usr/local/lib/python3.9/site-packages/molecule/command/login.py
