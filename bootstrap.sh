#!/usr/bin/env bash

yinstall="yum install -y"

sudo su 
yum clean all
$yinstall epel-release git vim bash-completion gcc net-tools
$yinstall python-devel python-pip
$yinstall mongodb mongodb-server libtidy openldap-devel

sudo tee /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/$releasever/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF

$yinstall docker-engine
sudo usermod -aG docker vagrant
sudo service docker start
sudo chkconfig docker on

sudo service mongod start
sudo chkconfig mongod on

sudo pip install --upgrade git+https://github.com/UCL-INGI/INGInious.git
docker pull centos:latest
