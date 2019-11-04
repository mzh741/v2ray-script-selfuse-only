#!/bin/bash
wget -O /etc/v2ray/config.json https://raw.githubusercontent.com/mzh741/v2ray-script-selfuse-only/master/config/config.json
systemctl restart v2ray
