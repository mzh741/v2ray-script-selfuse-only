#!/bin/bash

bash <(curl -s -L https://raw.githubusercontent.com/mzh741/v2ray-script-selfuse-only/master/install.sh)
rm -f /etc/v2ray/config.json
wget -O /etc/v2ray/config.json https://raw.githubusercontent.com/mzh741/v2ray-script-selfuse-only/master/config/config.json
systemctl restart v2ray
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables-save

wget -N --no-check-certificate https://raw.githubusercontent.com/mzh741/YankeeBBR/master/gcc_4.9.2-2_amd64.deb && dpkg -i gcc_4.9.2-2_amd64.deb

wget -N --no-check-certificate https://raw.githubusercontent.com/mzh741/YankeeBBR/master/libssl1.0.0_1.0.1t-1+deb8u11_amd64.deb && dpkg -i libssl1.0.0_1.0.1t-1+deb8u11_amd64.deb

apt -f install -y

wget -N --no-check-certificate https://raw.githubusercontent.com/mzh741/YankeeBBR/master/bbr.sh && bash bbr.sh install

wget -qO- https://get.docker.com/ | sh

cd ~ && git clone -b master https://github.com/mzh741/ocserv-docker.git

cd ~/ocserv-docker && docker build --no-cache -t ocserv-docker .

docker run -d --privileged --name ocserv-docker -v ~/ocserv-docker/ocserv:/etc/ocserv -p 999:999/tcp ocserv-docker
