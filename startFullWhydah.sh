#!/bin/sh
cd ../Whydah-SecurityTokenService
./start-service.sh
cd ../Whydah-SSOLoginWebApp
./start-service.sh
cd ../Whydah-UserAdminService
./start-service.sh
cd ../Whydah-UserAdminWebApp
./start-service.sh
cd ../Whydah-UserIdentityBackend
./start-service.sh

