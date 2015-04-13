#!/bin/sh
cd ../Whydah-SecurityTokenService
mvn clean package
cd ../Whydah-SSOLoginWebApp
mvn clean package
cd ../Whydah-UserAdminService
mvn clean package
cd ../Whydah-UserAdminWebApp
mvn clean package
cd ../Whydah-UserIdentityBackend
mvn clean package

