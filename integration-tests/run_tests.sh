#!/bin/bash

# Start Firefox and Chrome browser nodes
curl -XPUT -d @jobs/selenium-firefox.json --header "Content-Type: application/json" 192.168.10.10:4646/v1/job/selenium-firefox
curl -XPUT -d @jobs/selenium-chrome.json --header "Content-Type: application/json" 192.168.10.10:4646/v1/job/selenium-chrome

# Wait for nodes to come online (should be improved)
sleep 10

# Spin up environment
#

npm install chai

# Run tests
wdio wdio.conf.js

# Tear down nodes
curl -XDELETE --header "Content-Type: application/json" 192.168.10.10:4646/v1/job/selenium-firefox
curl -XDELETE --header "Content-Type: application/json" 192.168.10.10:4646/v1/job/selenium-chrome
