#!/bin/sh
#cd ..
git clone https://github.com/Cantara/Whydah-UserIdentityBackend.git uib
cd uib
ln -s src/main/resources/prodInitData/ prodInitData
cd ..
git clone https://github.com/Cantara/Whydah-SecurityTokenService.git sts
git clone https://github.com/Cantara/Whydah-SSOLoginWebApp.git ssolwa
git clone https://github.com/Cantara/Whydah-UserAdminService.git uas
git clone https://github.com/Cantara/Whydah-UserAdminWebApp.git uawa

