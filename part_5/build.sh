#!/bin/bash

export DOCKER_CONTENT_TRUST=1
docker build -t hello:1.0 .
dockle -ak NGINX_GPGKEY -ak NGINX_GPGKEY_PATH hello:1.0
export DOCKER_CONTENT_TRUST=0
docker run -p 80:81 --name temp -v /mnt/c/Users/LinLin/Desktop/code/SimpleDocker/part_5/nginx.conf:/etc/nginx/nginx.conf -d hello:1.0
echo "****to clean up press any key******"
read symbol
. ./clean.sh