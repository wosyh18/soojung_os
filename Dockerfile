FROM ubuntu:latest
RUN apt-get update && apt-get install -y -q nginx
WORKDIR /etc/nginx
COPY ./origin/public/index.html /etc/nginx/
EXPOSE 80
CMD ["nginx","-g", "daemon off;"]
