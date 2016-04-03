#!/bin/bash

# Start Firefox and Chrome browser nodes
echo "Starting Selenium browser nodes"
curl --silent -XPUT -d @jobs/selenium-chrome.json --header "Content-Type: application/json" 192.168.10.10:4646/v1/job/selenium-chrome
curl --silent -XPUT -d @jobs/selenium-firefox.json --header "Content-Type: application/json" 192.168.10.10:4646/v1/job/selenium-firefox

# Spin up integration environment
echo "Starting integration environment"
ENV=integration ../deploy/deploy.sh

# Install some additional npm libraries
npm install chai

# Wait for platform and nodes to come online (should be improved)
echo "Waiting for platform to come online"
sleep 20

# Set the base url for our micro-app from Consul
BASE_URL=$(curl --silent -XGET 192.168.10.10:8500/v1/catalog/service/micro-app-integration | jq -r '.[0] | .Address + ":" + (.ServicePort | tostring) ')
sed -i "s/###BASE_URL###/$BASE_URL/g" wdio.conf.js

# Run tests
echo "Running integration tests"
wdio wdio.conf.js

# Tear down selenium browser nodes
echo "Stopping integration environment and browser nodes"
curl --silent -XDELETE --header "Content-Type: application/json" 192.168.10.10:4646/v1/job/selenium-firefox
curl --silent -XDELETE --header "Content-Type: application/json" 192.168.10.10:4646/v1/job/selenium-chrome

# Stop integration environent
ENV=integration ../deploy/stop.sh
