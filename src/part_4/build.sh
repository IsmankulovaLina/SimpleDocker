#!/bin/bash

docker build -t hello:latest .
docker images
docker run -p 80:81 --name temp -v /mnt/c/Users/LinLin/Desktop/code/SimpleDocker/part_4/nginx.conf:/etc/nginx/nginx.conf -d hello
echo "****to clean up press any key******"
read symbol
. ./clean.sh