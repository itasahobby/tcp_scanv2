#!/bin/bash

# Installing dependencies
apt install libpcap0.8-dev libcap-dev golang
go get -u github.com/liamg/furious 1>/dev/null