#!/bin/sh
# Manual script to restart application.
#sudo pkill -u SecurityTokenService -f SecurityTokenService
sudo initctl stop SecurityTokenService
sudo initctl start SecurityTokenService
