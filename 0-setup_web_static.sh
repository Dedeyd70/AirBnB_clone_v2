#!/usr/bin/env bash
# Setting up my web servers for the deployment of web_static.

sudo apt update -y
sudo apt install -y nginx

sudo mkdir -p /data/web_static/releases/test/
sudo mkdir -p /data/web_static/shared/
echo "<!DOCTYPE html>
<html>
  <head>
  </head>
  <body>
    <p>I love Dedeyd70</p>
  </body>
</html>" | tee /data/web_static/releases/test/index.html

sudo ln -sf /data/web_static/releases/test/ /data/web_static/current

sudo chown -R ubuntu:ubuntu /data/

sudo sed -i '45 i\ \tlocation /hbnb_static {\n\t\talias /data/web_static/current;\n\t}\n' /etc/nginx/sites-enabled/default

sudo service nginx restart
