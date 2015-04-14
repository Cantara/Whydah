#!/bin/sh
cd ../Whydah-SecurityTokenService
Version=FROM_SOURCE IAM_MODE=TEST_LOCALHOST ./start-service.sh 
cd ../Whydah-SSOLoginWebApp
Version=FROM_SOURCE IAM_MODE=TEST_LOCALHOST ./start-service.sh 
cd ../Whydah-UserAdminService
Version=FROM_SOURCE IAM_MODE=TEST_LOCALHOST ./start-service.sh 
cd ../Whydah-UserAdminWebApp
Version=FROM_SOURCE IAM_MODE=TEST_LOCALHOST ./start-service.sh 
cd ../Whydah-UserIdentityBackend
Version=FROM_SOURCE IAM_MODE=TEST_LOCALHOST ./start-service.sh 


echo "To test point your browser to:  http://localhost:9997/sso/login"


