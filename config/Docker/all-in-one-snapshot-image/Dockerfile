# This is a comment
FROM azul/zulu-openjdk:latest
MAINTAINER Totto <totto@totto.org>
RUN apt-get -y update
RUN apt-get install -y wget curl

RUN adduser --force-badname SSOLoginWebApp
RUN adduser --force-badname SecurityTokenService
RUN adduser --force-badname TestWebApp
RUN adduser --force-badname UserAdminService
RUN adduser --force-badname UserAdminWebApp
RUN adduser --force-badname UserIdentityBackend
RUN adduser --force-badname CRMService
RUN adduser --force-badname StatisticsSeervice

## Install SSOLoginWebApp
RUN su -  SSOLoginWebApp -c "/usr/bin/wget -O update-service.sh -q -N  https://raw.githubusercontent.com/altran/Whydah-SSOLoginWebApp/master/update-service.sh"
RUN su -  SSOLoginWebApp -c "/usr/bin/wget -O start-service.sh -q -N  https://raw.githubusercontent.com/altran/Whydah-SSOLoginWebApp/master/start-service.sh"
RUN chmod 755 /home/SSOLoginWebApp/*.sh 
RUN su -  SSOLoginWebApp -c "/usr/bin/wget -O ssologinservice.PROD.properties -q -N  https://raw.githubusercontent.com/altran/Whydah-SSOLoginWebApp/master/src/main/resources/ssologinwebapp.TEST_LOCALHOST.properties"
RUN su - SSOLoginWebApp -c "/home/SSOLoginWebApp/update-service.sh"
RUN su - SSOLoginWebApp -c "/home/SSOLoginWebApp/start-service.sh &"


## Install SecurityTokenService
RUN su -  SecurityTokenService -c "/usr/bin/wget -O update-service.sh -q -N  https://raw.githubusercontent.com/cantara/Whydah-SecurityTokenService/master/update-service.sh"
RUN su -  SecurityTokenService -c "/usr/bin/wget -O start-service.sh -q -N  https://raw.githubusercontent.com/cantara/Whydah-SecurityTokenService/master/start-service.sh"
RUN chmod 755 /home/SecurityTokenService/*.sh
RUN su -  SecurityTokenService -c "/usr/bin/wget -O securitytokenservice.PROD.properties -q -N  https://raw.githubusercontent.com/cantara/Whydah-SecurityTokenService/master/src/main/resources/securitytokenservice.TEST_LOCALHOST.properties"
RUN su - SecurityTokenService -c "/home/SecurityTokenService/update-service.sh"
RUN su - SecurityTokenService -c "/home/SecurityTokenService/start-service.sh &"

## Install TestWebApp
RUN su -  TestWebApp -c "/usr/bin/wget -O update-service.sh -q -N https://raw.githubusercontent.com/cantara/Whydah-TestWebApp/master/update-service.sh"
RUN su -  TestWebApp -c "/usr/bin/wget -O start-service.sh -q -N  https://raw.githubusercontent.com/cantara/Whydah-TestWebApp/master/start-service.sh"
RUN chmod 755 /home/TestWebApp/*.sh
RUN su -  TestWebApp -c "/usr/bin/wget -O testwebapp.TEST.properties -q -N https://raw.githubusercontent.com/cantara/Whydah-TestWebApp/master/testwebapp.TEST.properties"
RUN su - TestWebApp -c "/home/TestWebApp/update-service.sh"
RUN su - TestWebApp -c "/home/TestWebApp/start-service.sh &"

## Install UserAdminService
RUN su -  UserAdminService -c "/usr/bin/wget -O update-service.sh -q -N https://raw.githubusercontent.com/cantara/Whydah-UserAdminService/master/update-service.sh"
RUN su -  UserAdminService -c "/usr/bin/wget -O start-service.sh -q -N  https://raw.githubusercontent.com/cantara/Whydah-UserAdminService/master/start-service.sh"
RUN chmod 755 /home/UserAdminService/*.sh
RUN su -  UserAdminService -c "/usr/bin/wget -O useradminservice_override.properties -q -N https://raw.githubusercontent.com/cantara/Whydah-UserAdminService/master/useradminservice_override.properties.example"
RUN su - UserAdminService -c "/home/UserAdminService/update-service.sh"
RUN su - UserAdminService -c "/home/UserAdminService/start-service.sh &"

## Install UserAdminWebApp
RUN su -  UserAdminWebApp -c "/usr/bin/wget -O update-service.sh -q -N https://raw.githubusercontent.com/cantara/Whydah-UserAdminWebApp/master/update-service.sh"
RUN su -  UserAdminWebApp -c "/usr/bin/wget -O start-service.sh -q -N  https://raw.githubusercontent.com/cantara/Whydah-UserAdminWebApp/master/start-service.sh"
RUN chmod 755 /home/UserAdminWebApp/*.sh
RUN su -  UserAdminWebApp -c "/usr/bin/wget -O useradminwebapp.PROD.properties -q -N https://raw.githubusercontent.com/cantara/Whydah-UserAdminWebApp/master/src/main/resources/useradminwebapp.TEST_LOCALHOST.properties"
RUN su - UserAdminWebApp -c "/home/UserAdminWebApp/update-service.sh"
RUN su - UserAdminWebApp -c "/home/UserAdminWebApp/start-service.sh &"

## Install UserIdentityBackend
RUN su -  UserIdentityBackend -c "/usr/bin/wget -O update-service.sh -q -N https://raw.githubusercontent.com/cantara/Whydah-UserIdentityBackend/master/update-service.sh"
RUN su -  UserIdentityBackend -c "/usr/bin/wget -O start-service.sh -q -N  https://raw.githubusercontent.com/cantara/Whydah-UserIdentityBackend/master/start-service.sh"
RUN chmod 755 /home/UserIdentityBackend/*.sh
RUN su -  UserIdentityBackend -c "/usr/bin/wget -O useridentitybackend.override.properties -q -N https://raw.githubusercontent.com/cantara/Whydah-UserIdentityBackend/master/useridentitybackend.override.properties"
RUN su - UserIdentityBackend -c "/home/UserIdentityBackend/update-service.sh"
RUN su - UserIdentityBackend -c "/home/UserIdentityBackend/start-service.sh &"

## Install CRMService
## Install TestWebApp
RUN su -  CRMService -c "/usr/bin/wget -O update-service.sh -q -N https://raw.githubusercontent.com/cantara/Whydah-CRMService/master/update-service.sh"
RUN su -  CRMService -c "/usr/bin/wget -O start-service.sh -q -N  https://raw.githubusercontent.com/cantara/Whydah-CRMService/master/start-service.sh"
RUN chmod 755 /home/CRMService/*.sh
RUN su -  CRMService -c "/usr/bin/wget -O crmservice.properties -q -N https://raw.githubusercontent.com/cantara/Whydah-CRMService/master/src/main/resources/appconfig/crmservice.properties"
RUN su - CRMService -c "/home/CRMService/update-service.sh"
RUN su - CRMService -c "/home/CRMService/start-service.sh &"


## Install Apache and set up proxypasses
RUN apt-get install -y apache2
RUN cd /etc/httpd/conf.d;/usr/bin/wget -O whydah.conf  https://raw.githubusercontent.com/cantara/Whydah/master/config/apache/whydah.conf
RUN /etc/init.d/apache2 restart
