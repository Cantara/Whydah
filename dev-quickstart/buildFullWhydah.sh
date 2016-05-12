#!/bin/sh
#
# Pre-requisites:  JDK 7 or 8, maven 3 and wget installed
#
# Note for OSX:    We have had some reports of bulding modules fail, but works from within their IDEs
#                  We are investigating the issue to resolv it
#


cd Whydah-TypeLib
mvn clean package
cd ../Whydah-Java-SDK
mvn clean package
cd ../Whydah-UserAdminService
mvn clean package
cd ../Whydah-UserAdminWebApp
mvn clean package
cd ../Whydah-SecurityTokenService
mvn clean package
cd ../Whydah-SSOLoginWebApp  
mvn clean package
cd ../Whydah-UserIdentityBackend
mvn  clean package

cd ../Whydah-CRMService
mvn clean package
cd ../Whydah-StatisticsService
mvn clean package
