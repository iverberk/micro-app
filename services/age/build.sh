#!/bin/bash

set -e

cd ${0%/*}

go get
go test
go build -o age-service main.go

docker build -t registry.service.consul:5000/iverberk/age-service .
