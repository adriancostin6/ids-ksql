#!/bin/sh

apt-get update -qq
apt-get install -qy avahi-daemon
apt-get install -qy apt-transport-https \
        ca-certificates\
        curl \
        gnupg-agent \
        software-properties-common \
        git

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt-get install -qy docker-ce docker-ce-cli containerd.io

groupadd docker

usermod -aG docker vagrant

# get my fork of ids-ksql
git clone https://github.com/adriancostin6/ids-ksql.git

# got to my protocol analyzer project
cd ids-ksql/CapJSON

docker build -t capjson .

# move the created service for running my application to systemd
cp /vagrant/capjson.service /etc/systemd/system
systemctl daemon-reload

# start my custom protocol analyzer service 
systemctl enable capjson.service
systemctl start capjson.service
