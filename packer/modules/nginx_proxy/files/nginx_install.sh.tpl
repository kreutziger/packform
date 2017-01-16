#!/bin/bash -ex
echo "**********************************************************************************"
echo "Installation of nginx"
yum install -y epel-release
yum install -y nginx-${nginx_version}
mkdir -p /usr/lib/cinteo/cloud/nginx
chown root:root /usr/lib/cinteo/cloud/nginx
chmod 0755 /usr/lib/cinteo/cloud/nginx
mv /tmp/nginx_config.sh /usr/lib/cinteo/cloud/nginx/nginx_config.sh
chown root:root /usr/lib/cinteo/cloud/nginx/nginx_config.sh
chmod 0755 /usr/lib/cinteo/cloud/nginx/nginx_config.sh
mv /tmp/nginx.service /lib/systemd/system/nginx.service
chown root:root /lib/systemd/system/nginx.service
chmod 0644 /lib/systemd/system/nginx.service
systemctl enable nginx
