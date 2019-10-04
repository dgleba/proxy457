# -*- coding: utf-8 -*-
SECRET_KEY = "9uiyv7rmnr^+fv=e41t0x&ih-qg$7a8=2+l+5@j&$r0p9h2_i0"

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'seahub_db',
        'USER': 'seafile',
        'PASSWORD': 'ba398b0a-9966-4602-9f72-b135ccfc667c',
        'HOST': '127.0.0.1',
        'PORT': '3306'
    }
}


FILE_SERVER_ROOT = "http://sf-108-168-7-24.nip.io/seafhttp"
