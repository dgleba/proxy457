## Start of configuration add by letsencrypt container
location ^~ /.well-known/acme-challenge/ {
    auth_basic off;
    auth_request off;
    allow all;
    root /usr/share/nginx/html;
    try_files $uri =404;
    break;
}
## End of configuration add by letsencrypt container

#
# for seafile.
#

  location /seafhttp {
      rewrite ^/seafhttp(.*)$ $1 break;
      proxy_pass http://seafile2:8082;
      # client_max_body_size 0;
      client_max_body_size 10000m;
      proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;

      proxy_connect_timeout  36000s;
      proxy_read_timeout  36000s;
      proxy_send_timeout  36000s;

      send_timeout  36000s;
  }

