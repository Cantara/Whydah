#!/bin/bash
curl -sSL http://get.socketplane.io/ | sudo BOOTSTRAP=true sh
sudo socketplane cluster bind eth0
