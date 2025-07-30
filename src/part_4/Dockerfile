FROM nginx
USER root
WORKDIR /home/
COPY ./nginx.conf /etc/nginx/nginx.conf

COPY ./hello.c .
COPY ./start_server.sh .

RUN apt-get update && apt-get install -y gcc spawn-fcgi libfcgi-dev 
ENTRYPOINT ["sh", "./start_server.sh"]