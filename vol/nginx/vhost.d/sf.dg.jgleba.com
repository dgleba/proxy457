
#
# for seafile.
#

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

