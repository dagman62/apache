#!/bin/bash

PREFIX=/usr/local/apache

./configure --enable-static \
            --with-apxs2=${PREFIX}/bin/apxs \
            --with-mysqli \
            --enable-embedded-mysqli \
            --enable-dba \
            --enable-bcmath \
            --with-bz2 \
            --with-curl \
            --with-gd \
            --enable-zip \
            --with-ldap