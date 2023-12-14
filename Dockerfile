FROM ubuntu:latest
RUN apt-get update && apt-get install -y -q nginx
WORKDIR /etc/nginx
COPY ./public/index.html /var/www/html/index.nginx-debian.html
EXPOSE 80
CMD ["nginx","-g", "daemon off;"]
