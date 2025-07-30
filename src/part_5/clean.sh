#!/bin/bash

docker stop temp
docker rm -f temp
docker rmi -f hello:1.0