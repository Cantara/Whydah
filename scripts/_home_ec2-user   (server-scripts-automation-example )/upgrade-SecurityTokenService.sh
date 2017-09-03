#!/bin/sh
# Manual script to upgrade and restart application.
sudo su -c "/home/SecurityTokenService/update-service.sh" -s /bin/sh - SecurityT
okenService
sudo initctl stop SecurityTokenService
sudo initctl start SecurityTokenService
