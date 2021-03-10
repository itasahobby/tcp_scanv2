#!/bin/bash

# Check root privileges
USERID=$(id -u)
if [[ $USERID -gt 0 ]]; then
    echo "The installation script requires root privileges";
    exit 1;
fi

# Installing dependencies
apt install libpcap0.8-dev libcap-dev golang
go get -u github.com/liamg/furious 1>/dev/null