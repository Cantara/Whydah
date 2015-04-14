#!/bin/sh
cd ../Whydah-SecurityTokenService
VERSION=FROM_SOURCE IAM_MODE=TEST_LOCALHOST ./start-service.sh 
cd ../Whydah-SSOLoginWebApp
VERSION=FROM_SOURCE IAM_MODE=TEST_LOCALHOST ./start-service.sh 
cd ../Whydah-UserAdminService
VERSION=FROM_SOURCE IAM_MODE=TEST_LOCALHOST ./start-service.sh 
cd ../Whydah-UserAdminWebApp
VERSION=FROM_SOURCE IAM_MODE=TEST_LOCALHOST ./start-service.sh 
cd ../Whydah-UserIdentityBackend
VERSION=FROM_SOURCE IAM_MODE=TEST_LOCALHOST ./start-service.sh 

