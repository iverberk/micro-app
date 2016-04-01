FROM golang:1.6-alpine

ADD https://get.docker.com/builds/Linux/x86_64/docker-1.10.3 /usr/local/bin/docker

RUN apk add --no-cache nodejs make g++ python bash git openjdk8-jre-base && \
    npm install -g wdio-junit-reporter wdio-mocha-framework webdriverio && \
    chmod +x /usr/local/bin/docker && \
    apk del make g++ python
