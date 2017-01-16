#!/bin/bash
setenforce 0
user_data_params=$(curl http://169.254.169.254/latest/user-data)
eval $${user_data_params}
tee /etc/nginx/nginx.conf <<EOF
events {
        worker_connections 768;
}
http {
    proxy_send_timeout 120;
    proxy_read_timeout 300;
    proxy_buffering    off;
    keepalive_timeout  5 5;
    tcp_nodelay        on;
    server {
        listen   *:80;
        server_name  $${server_name};
        client_max_body_size 1G;
        location / {
            proxy_pass http://localhost:${port}/;
            proxy_set_header Host \$host;
            proxy_set_header X-Real-IP \$remote_addr;
            proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        }
    }
}
EOF
