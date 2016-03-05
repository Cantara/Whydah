#!/bin/sh
#
# Pre-requisites:  JDK 7 or 8, maven 3 and wget installed
#
# Note for OSX:    We have had some reports of bulding modules fail, but works from within their IDEs
#                  We are investigating the issue to resolv it
#

cd sts
mvn clean package
cd ../ssolwa
mvn clean package
cd ../uas
mvn clean package
cd ../uawa
mvn clean package
cd ../uib
mvn -DskipTests=true clean package

cd ../crmservice
mvn clean package
