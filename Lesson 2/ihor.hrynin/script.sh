#!/bin/bash
if
dpkg --list | grep nginx
then
echo "nginx instled"
else
nginx -v;
echo "nginx is not installed";
fi



sudo apt install curl gnupg2 ca-certificates lsb-release
echo "deb http://nginx.org/packages/ubuntu `lsb_release -cs` nginx" \
    | sudo tee /etc/apt/sources.list.d/nginx.list
curl -fsSL https://nginx.org/keys/nginx_signing.key | sudo apt-key add -
sudo apt-key fingerprint ABF5BD827BD9BF62
sudo apt update
sudo apt install nginx 1.14.2*
cd etc/nginx
mkdir sites-available | sites-enabled
cp etc/nginx/conf.d/default.conf /etc/nginx/sites-avaible/
ln s /etc/nginx/sites-avaible/default.conf /etc/nginx/sites-enabled/
service nginx restart
curl 127.0.0.1 | grep -om 1 "Welcome to nginx";

