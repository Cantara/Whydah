#!/bin/sh
#cd ..
git clone https://github.com/Cantara/Whydah-UserIdentityBackend.git 
cd Whydah-UserIdentityBackend
ln -s src/main/resources/prodInitData/ prodInitData
ln -s src/test/resources/testdata/ testdata
cd ..
git clone https://github.com/Cantara/Whydah-TypeLib.git 
git clone https://github.com/Cantara/Whydah-Java-SDK.git 
git clone https://github.com/Cantara/Whydah-SecurityTokenService.git 
git clone https://github.com/Cantara/Whydah-SSOLoginWebApp.git 
git clone https://github.com/Cantara/Whydah-UserAdminService.git 
git clone https://github.com/Cantara/Whydah-UserAdminWebApp.git 
git clone https://github.com/Cantara/Whydah-CRMService.git 
git clone https://github.com/Cantara/Whydah-StatisticsService.git 
git clone https://github.com/Cantara/Whydah-SPAProxyService
git clone https://github.com/Cantara/Whydah-OAuth2Service
