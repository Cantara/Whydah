#!/bin/sh
cd ../Whydah-SecurityTokenService
./start-service.sh VERSION=FROM_SOURCE IAM_MODE=TEST_LOCALHOST
cd ../Whydah-SSOLoginWebApp
./start-service.sh VERSION=FROM_SOURCE IAM_MODE=TEST_LOCALHOST
cd ../Whydah-UserAdminService
./start-service.sh VERSION=FROM_SOURCE IAM_MODE=TEST_LOCALHOST
cd ../Whydah-UserAdminWebApp
./start-service.sh VERSION=FROM_SOURCE IAM_MODE=TEST_LOCALHOST
cd ../Whydah-UserIdentityBackend
./start-service.sh VERSION=FROM_SOURCE IAM_MODE=TEST_LOCALHOST

