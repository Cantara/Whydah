#!/bin/sh
# sudo pkill java
/home/ec2-user/upgrade-SecurityTokenService.sh
/home/ec2-user/upgrade-CRMService.sh
/home/ec2-user/upgrade-TestWebApp.sh
/home/ec2-user/upgrade-UserAdminWebApp.sh
/home/ec2-user/upgrade-OID-SSOLoginWebApp.sh
/home/ec2-user/upgrade-SSOLoginWebApp.sh
/home/ec2-user/upgrade-UserAdminService.sh
/home/ec2-user/upgrade-StatisticsService.sh
/home/ec2-user/upgrade-OAuth2Service.sh


# restart postgres for CRMservice
sudo /etc/init.d/postgresql restart


# and get the others services back on-line
/home/ec2-user/restart-ConfigService.sh
/home/ec2-user/restart-CS-Dashboard.sh
/home/ec2-user/restart-JAU2.sh
/home/ec2-user/restart-JAU.sh


# And check that things are starting
wget -qO- http://localhost:9998/tokenservice/health
wget -qO- http://localhost:9997/sso/health
