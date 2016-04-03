#!/bin/bash

# Start Firefox and Chrome browser nodes
curl -XPUT -d @jobs/selenium-chrome.json --header "Content-Type: application/json" 192.168.10.10:4646/v1/job/selenium-chrome
curl -XPUT -d @jobs/selenium-firefox.json --header "Content-Type: application/json" 192.168.10.10:4646/v1/job/selenium-firefox

# Spin up integration environment
ENV=integration ../deploy/deploy.sh

# Install some additional npm libraries
npm install chai

# Wait for platform and nodes to come online (should be improved)
sleep 10

# Run tests
wdio wdio.conf.js

# Tear down selenium browser nodes
curl -XDELETE --header "Content-Type: application/json" 192.168.10.10:4646/v1/job/selenium-firefox
curl -XDELETE --header "Content-Type: application/json" 192.168.10.10:4646/v1/job/selenium-chrome

# Stop integration environent
ENV=integration ../deploy/stop.sh
