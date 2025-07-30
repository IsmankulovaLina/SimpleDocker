#!/bin/bash
docker pull nginx
docker run -d -p 81:81 --name temp nginx
docker cp ./hello.c temp:/home
docker cp nginx.conf temp:/etc/nginx/nginx.conf
docker exec temp apt-get update
docker exec temp apt-get install -y gcc spawn-fcgi libfcgi-dev
docker exec temp gcc /home/hello.c -o /home/hello -l fcgi
docker exec temp spawn-fcgi -p 8080 ./home/hello
docker exec temp nginx -s reload
curl http://localhost:81/
echo "Enter any symbol to clean"
read symbol
. ./clean.sh