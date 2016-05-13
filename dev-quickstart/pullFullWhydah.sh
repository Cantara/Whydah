#!/bin/sh
#
# Pre-requisites:  JDK 7 or 8, maven 3 and wget installed
#
# Note for OSX:    We have had some reports of bulding modules fail, but works from within their IDEs
#                  We are investigating the issue to resolv it
#


cd Whydah-TypeLib
gitt pull
cd ../Whydah-Java-SDK
git pull
cd ../Whydah-UserAdminService
git pull
cd ../Whydah-UserAdminWebApp
git pull
cd ../Whydah-SecurityTokenService
git pull
cd ../Whydah-SSOLoginWebApp  
git pull
cd ../Whydah-UserIdentityBackend
git pull

cd ../Whydah-CRMService
git pull
cd ../Whydah-StatisticsService
git pull
