#!/bin/bash -xe

sudo su
yum install -y nginx

ls /usr/share/nginx/html/
echo 'Hello from nginx!' > /usr/share/nginx/html/index.html

systemctl start nginx
