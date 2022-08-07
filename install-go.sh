#!/bin/bash


# rm -rf /usr/local/go && tar -C /usr/local -xzf go1.19.linux-amd64.tar.gz
wget https://go.dev/dl/go1.19.linux-amd64.tar.gz
sudo  tar -C /usr/local -xzf go1.19.linux-amd64.tar.gz
ls /usr/local/go/
export PATH=$PATH:/usr/local/go/bin

