# Project: proxy457

.

# Status

Seafile works. 2019-05-01_Wed_16.09-PM

.

# Notes

sudo chmod 777 /srv/dkr/proxy457/vol/
sudo chmod 777 /srv/dkr/proxy457/vol/vost.d
sudo chmod 777 -R /srv/dkr/proxy457/vol/nginx/vhost.d/
sudo chmod 777 -R /srv/dkr/proxy457/vol/nginx/vhost.d/\*

---

remove data and start over..

    sudo rm -rf /srv/dkr/datasys/seafiledata

---

docker-compose exec nginx-proxy cat /etc/nginx/conf.d/default.conf >generated.conf

---

# To copy files from the container.

I wanted to get a copy of some files from the running container so I had them locally.

```
To work around.. error... invalid symlink "/srv/dkr/x/proxy457_nginx-proxy_1__files/nginx/modules" -> "../../usr/lib/nginx/modules"
#
tmpdir=/srv/dkr/x
out=/srv/dkr/x/proxy457_nginx-proxy_1__files3
src=proxy457_nginx-proxy_1:/etc/nginx/
tmptar=32019-10-13tmp.tar
#
mkdir -p $tmpdir ; cd $tmpdir
mkdir -p $out
docker cp -L $src  - > $tmptar ; cd $out ; tar -xvf ../$tmptar

```

---

My nginx proxy with let's encrypt companion.

https://github.com/dgleba/proxy457

# From:

https://github.com/jwilder/nginx-proxy

https://github.com/JrCs/docker-letsencrypt-nginx-proxy-companion
