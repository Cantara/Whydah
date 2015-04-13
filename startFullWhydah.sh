#!/bin/sh
cd ../Whydah-SecurityTokenService
./start_service.sh
cd ../Whydah-SSOLoginWebApp
./start_service.sh
cd ../Whydah-UserAdminService
./start_service.sh
cd ../Whydah-UserAdminWebApp
./start_service.sh
cd ../Whydah-UserIdentityBackend
./start.service.sh

