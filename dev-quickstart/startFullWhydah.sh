#!/bin/sh
#
# Pre-requisites:  JDK 7 or 8, maven 3 and wget installed
#
# Note for OSX:    We have had some reports of bulding modules fail, but works from within their IDEs
#                  We are investigating the issue to resolv it
#

cd sts
Version=FROM_SOURCE IAM_MODE=TEST_LOCALHOST ./start-service.sh 
cd ../ssolwa
Version=FROM_SOURCE IAM_MODE=TEST_LOCALHOST ./start-service.sh 
cd ../uas
Version=FROM_SOURCE env_vars='-DCONSTRETTO_TAGS=DEV' ./start-service.sh 
cd ../uawa
Version=FROM_SOURCE IAM_MODE=TEST_LOCALHOST ./start-service.sh 
cd ../uib
Version=FROM_SOURCE env_vars='-DCONSTRETTO_TAGS=DEV' ./start-service.sh 

cd ../crmservice
Version=FROM_SOURCE env_vars='-DCONSTRETTO_TAGS=DEV' ./start-service.sh 
cd ../statisticsservice
Version=FROM_SOURCE env_vars='-DCONSTRETTO_TAGS=DEV' ./start-service.sh 

sleep 15

echo ""
echo ""
echo "To test point your browser to:  http://localhost:9997/sso/welcome   u:useradmin pw:useradmin567"


