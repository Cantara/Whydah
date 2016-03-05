#!/bin/sh
cd sts
git pull --rebase
cd ../ssologin
git pull --rebase
cd ../uas
git pull --rebase
cd ../uawa
git pull --rebase
cd ../uib
git pull --rebase

cd ../crmservice
git pull --rebase
