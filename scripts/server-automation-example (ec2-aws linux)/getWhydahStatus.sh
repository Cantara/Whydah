#!/bin/sh
# And check that things are starting
echo "TokenService"
wget -qO- http://localhost:9998/tokenservice/health
echo "SSOLWA"
wget -qO- http://localhost:9997/sso/health
echo "UAS"
wget -qO- http://localhost:9992/useradminservice/health
echo "UAWA"
wget -qO- http://localhost:9996/useradmin/health
echo "StatisticsService"
wget -qO- http://localhost:4901/reporter/health
echo "CRMService"
wget -qO- http://localhost:12121/crmservice/health
echo "OAuth2"
wget -qO- http://localhost:9898/oauth2/health
