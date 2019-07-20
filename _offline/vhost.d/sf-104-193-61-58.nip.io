
#
# for seafile.
#
    listen 80;
    server_name sf-104-193-61-58.nip.io;

    proxy_set_header X-Forwarded-For $remote_addr;

    location / {
         proxy_pass         http://seafile:8000;
         proxy_set_header   Host $host;
         proxy_set_header   X-Real-IP $remote_addr;
         proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
         proxy_set_header   X-Forwarded-Host $server_name;
         proxy_read_timeout  1200s;

         # used for view/edit office file via Office Online Server
         client_max_body_size 0;
    }

    location /seafhttp {
        rewrite ^/seafhttp(.*)$ $1 break;
        proxy_pass http://seafile:8082;
        client_max_body_size 0;
        proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;

        proxy_connect_timeout  36000s;
        proxy_read_timeout  36000s;
        proxy_send_timeout  36000s;

        send_timeout  36000s;
    }
    location /media {
        root /home/user/haiwen/seafile-server-latest/seahub;
    }
