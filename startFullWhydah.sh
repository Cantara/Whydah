#!/bin/sh
#
# Pre-requisites:  JDK 7 or 8, maven 3 and wget installed
#
# Note for OSX:    We have had some reports of bulding modules fail, but works from within their IDEs
#                  We are investigating the issue to resolv it
#

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

sleep 15
echo ""
echo ""
echo "To test point your browser to:  http://localhost:9997/sso/welcome   u:admin pw:admin"


