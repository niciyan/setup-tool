#!/bin/bash
set -ex

# :WARNING:
# you may need to delete previous golang files
# rm -rf /usr/local/go

GO_DIR=/usr/local/go
# rm -rf /usr/local/go && tar -C /usr/local -xzf go1.19.linux-amd64.tar.gz
wget https://go.dev/dl/go1.19.linux-amd64.tar.gz
sudo  tar -C /usr/local -xzf go1.19.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
echo 'run -> export PATH=$PATH:/usr/local/go/bin'
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
go version

