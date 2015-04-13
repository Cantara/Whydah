#!/bin/sh
cd ../Whydah-SecurityTokenService
git pull --rebase
cd ../Whydah-SSOLoginWebApp
git pull --rebase
cd ../Whydah-UserAdminService
git pull --rebase
cd ../Whydah-UserAdminWebApp
git pull --rebase
cd ../Whydah-UserIdentityBackend
git pull --rebase

