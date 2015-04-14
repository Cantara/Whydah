#!/bin/sh
cd ../Whydah-SecurityTokenService
./start-service.sh FROM_SOURCE TEST_LOCALHOST
cd ../Whydah-SSOLoginWebApp
./start-service.sh FROM_SOURCE TEST_LOCALHOST
cd ../Whydah-UserAdminService
./start-service.sh FROM_SOURCE TEST_LOCALHOST
cd ../Whydah-UserAdminWebApp
./start-service.sh FROM_SOURCE TEST_LOCALHOST
cd ../Whydah-UserIdentityBackend
./start-service.sh FROM_SOURCE TEST_LOCALHOST

