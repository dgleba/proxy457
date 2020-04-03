
#
# for seafile.
#

  location /seafhttp {
    rewrite ^/seafhttp(.*)$ $1 break;
    proxy_pass http://seafile:8082;
    client_max_body_size 0;
    
    proxy_set_header Forwarded "for=$proxy_add_x_forwarded_for;proto=$http_x_forwarded_proto";
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $http_x_forwarded_proto;
    proxy_set_header X-Real-IP $proxy_add_x_forwarded_for;

    proxy_connect_timeout  36000s;
    proxy_read_timeout  36000s;
    proxy_send_timeout  36000s;

    send_timeout  36000s;
  }


# 2020-04-03
# https://github.com/haiwen/seafile-docker/issues/91
#
#-        proxy_set_header Forwarded "for=$remote_addr;proto=$scheme";
#-        proxy_set_header X-Forwarded-For $remote_addr;
#-        proxy_set_header X-Forwarded-Proto $scheme;
#-        proxy_set_header X-Real-IP $remote_addr;
#	+        proxy_set_header Forwarded "for=$proxy_add_x_forwarded_for;proto=$http_x_forwarded_proto";
#	+        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
#	+        proxy_set_header X-Forwarded-Proto $http_x_forwarded_proto;
#	+        proxy_set_header X-Real-IP $proxy_add_x_forwarded_for;

