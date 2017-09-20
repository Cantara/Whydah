#!/bin/sh
echo ""
echo "SecurityTokenService"
wget -qO- http://localhost:9998/tokenservice/health
echo ""
echo "SSOLoginWebApp"
wget -qO- http://localhost:9997/sso/health
echo ""
echo "UserAdminService"
wget -qO- http://localhost:9992/useradminservice/health
echo ""
echo "UserAdminWebApp"
wget -qO- http://localhost:9996/useradmin/health
echo ""
echo "StatisticsService"
wget -qO- http://localhost:4901/reporter/health
echo ""
echo "CRMService"
wget -qO- http://localhost:12121/crmservice/health
echo ""
echo "OAuth2Service"
wget -qO- http://localhost:9898/oauth2/health
