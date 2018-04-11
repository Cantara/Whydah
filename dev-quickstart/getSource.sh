#!/bin/sh
#cd ..
git clone git@github.com:Cantara/Whydah-UserIdentityBackend.git
cd Whydah-UserIdentityBackend
ln -s src/main/resources/prodInitData/ prodInitData
ln -s src/test/resources/testdata/ testdata
cd ..
git clone git@github.com:Cantara/Whydah-TypeLib.git    
git clone git@github.com:Cantara/Whydah-Java-SDK.git     
git clone git@github.com:Cantara/Whydah-Admin-SDK.git
git clone git@github.com:Cantara/Whydah-SecurityTokenService.git    
git clone git@github.com:Cantara/Whydah-SSOLoginWebApp.git    
git clone git@github.com:Cantara/Whydah-UserAdminService.git    
git clone git@github.com:Cantara/Whydah-UserAdminWebApp.git    
git clone git@github.com:Cantara/Whydah-CRMService.git    
git clone git@github.com:Cantara/Whydah-StatisticsService.git    
git clone git@github.com:Cantara/Whydah-SPAProxyService.git
git clone git@github.com:Cantara/Whydah-OAuth2Service.git
