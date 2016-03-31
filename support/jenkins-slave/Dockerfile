FROM golang:1.6-alpine

ADD https://get.docker.com/builds/Linux/x86_64/docker-1.10.3 /usr/local/bin/docker

RUN apk add --no-cache bash git openjdk8-jre-base && \
    chmod +x /usr/local/bin/docker
