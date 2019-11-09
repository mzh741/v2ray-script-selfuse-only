#!/bin/bash
curl https://getcaddy.com | bash -s personal http.cors,http.webdav
wget https://github.com/mzh741/v2ray-script-selfuse-only/raw/master/config/caddy.service -O /etc/systemd/system/caddy.service
wget https://github.com/mzh741/v2ray-script-selfuse-only/raw/master/config/Caddyfile -O /etc/caddy/Caddyfile
systemctl enable caddy&&systemctl start caddy