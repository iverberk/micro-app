FROM golang:1.6

ADD https://get.docker.com/builds/Linux/x86_64/docker-1.10.3 /usr/local/bin/docker

RUN apt-get update && \
    apt-get install -y openjdk-7-jre-headless && \
    chmod +x /usr/local/bin/docker
