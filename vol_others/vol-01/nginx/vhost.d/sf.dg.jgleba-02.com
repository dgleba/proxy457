
#error..
# log_format seafileformat '$http_x_forwarded_for $remote_addr [$time_local] "$request" $status $body_bytes_sent "$http_referer" "$http_user_agent" $upstream_response_time';
# error for above line.
#  jproxy_1   | nginx.1    | 2020/04/03 19:29:29 [emerg] 32#32: "log_format" directive is not allowed here in /etc/nginx/vhost.d/sf.dg.jgleba.com:1
#  jproxy_1   | nginx.1    | nginx: [emerg] "log_format" directive is not allowed here in /etc/nginx/vhost.d/sf.dg.jgleba.com:1


# jproxy_1   | nginx.1    | 2020/04/03 19:31:30 [emerg] 27#27: "server" directive is not allowed here in /etc/nginx/vhost.d/sf.dg.jgleba.com:8
# jproxy_1   | nginx.1    | nginx: [emerg] "server" directive is not allowed here in /etc/nginx/vhost.d/sf.dg.jgleba.com:8
# server {

#    listen 80;
#    server_name seafile.example.com;
#    proxy_set_header X-Forwarded-For $remote_addr;


#    location / {
#         proxy_pass         http://127.0.0.1:8000;
#         proxy_set_header   Host $host;
#         proxy_set_header   X-Real-IP $remote_addr;
#         proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
#         proxy_set_header   X-Forwarded-Host $server_name;
#         proxy_read_timeout  1200s;
#
#         # used for view/edit office file via Office Online Server
#         client_max_body_size 0;
#
#         # access_log      /var/log/nginx/seahub.access.log seafileformat;
#         # error_log       /var/log/nginx/seahub.error.log;
#    }

    location /seafhttp {
        rewrite ^/seafhttp(.*)$ $1 break;
        proxy_pass http://127.0.0.1:8082;
        client_max_body_size 0;
        proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;

        proxy_connect_timeout  36000s;
        proxy_read_timeout  36000s;
        proxy_send_timeout  36000s;

        send_timeout  36000s;

        # access_log      /var/log/nginx/seafhttp.access.log seafileformat;
        # error_log       /var/log/nginx/seafhttp.error.log;
    }
    location /media {
        root /home/user/haiwen/seafile-server-latest/seahub;
    }


