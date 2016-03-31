#!/bin/bash

cd ${0%/*}

go get
go test
go build -o name-service main.go

docker build -t registry.service.consul:5000/iverberk/name-service .
