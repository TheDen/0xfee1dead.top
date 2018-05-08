#!/bin/sh

if ! grep ^ /etc/apt/sources.list /etc/apt/sources.list.d/*  | grep -q certbot; then
  sudo add-apt-repository ppa:certbot/certbot
  sudo apt-get update
  sudo apt-get install python-certbot-nginx -y
fi

echo "y" | sudo ufw enable
sudo ufw allow 'Nginx Full'
sudo ufw delete allow 'Nginx HTTP'
sudo ufw allow 'OpenSSH'

sudo certbot --nginx -d 0xfee1dead.top -d www.0xfee1dead.top
