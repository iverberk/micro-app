#!/bin/bash

# Retrieve dependencies
go get -d -v

# Run tests
go test -v

# Build binaries
go build -o micro-app main.go

# Package in Docker container
docker build -t registry.service.consul:5000/iverberk/micro-app .
