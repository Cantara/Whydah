# This is a comment
FROM azul/zulu-openjdk-centos:latest
MAINTAINER Totto <totto@totto.org>
RUN yum install -y yum-cron
RUN yum -y update
RUN yum install -y wget

# Install sshd - should probably be fortified
RUN yum install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:kjempehemmelig' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
RUN echo "export VISIBLE=now" >> /etc/profile
RUN /usr/sbin/sshd-keygen


RUN adduser  SSOLoginWebApp
RUN adduser  SecurityTokenService
RUN adduser  TestWebApp
RUN adduser  UserAdminService
RUN adduser  UserAdminWebApp
RUN adduser  UserIdentityBackend

## Install SSOLoginWebApp
RUN su -  SSOLoginWebApp -c "/usr/bin/wget -O update-service.sh -q -N  https://raw.githubusercontent.com/altran/Whydah-SSOLoginWebApp/master/update-service.sh"
RUN su -  SSOLoginWebApp -c "/usr/bin/wget -O start-service.sh -q -N  https://raw.githubusercontent.com/altran/Whydah-SSOLoginWebApp/master/start-service.sh"
RUN chmod 755 /home/SSOLoginWebApp/*.sh 
RUN su -  SSOLoginWebApp -c "/usr/bin/wget -O ssologinservice.PROD.properties -q -N  https://raw.githubusercontent.com/altran/Whydah-SSOLoginWebApp/master/src/main/resources/ssologinwebapp.TEST_LOCALHOST.properties"
RUN su - SSOLoginWebApp -c "/home/SSOLoginWebApp/update-service.sh"
#RUN su - SSOLoginWebApp -c "/home/SSOLoginWebApp/start-service.sh &"


## Install SecurityTokenService
RUN su -  SecurityTokenService -c "/usr/bin/wget -O update-service.sh -q -N  https://raw.githubusercontent.com/altran/Whydah-SecurityTokenService/master/update-service.sh"
RUN su -  SecurityTokenService -c "/usr/bin/wget -O start-service.sh -q -N  https://raw.githubusercontent.com/altran/Whydah-SecurityTokenService/master/start-service.sh"
RUN chmod 755 /home/SecurityTokenService/*.sh
RUN su -  SecurityTokenService -c "/usr/bin/wget -O securitytokenservice.PROD.properties -q -N  https://raw.githubusercontent.com/altran/Whydah-SecurityTokenService/master/src/main/resources/securitytokenservice.TEST_LOCALHOST.properties"
RUN su - SecurityTokenService -c "/home/SecurityTokenService/update-service.sh"
#RUN su - SecurityTokenService -c "/home/SecurityTokenService/start-service.sh &"

## Install TestWebApp
RUN su -  TestWebApp -c "/usr/bin/wget -O update-service.sh -q -N https://raw.githubusercontent.com/altran/Whydah-TestWebApp/master/update-service.sh"
RUN su -  TestWebApp -c "/usr/bin/wget -O start-service.sh -q -N  https://raw.githubusercontent.com/altran/Whydah-TestWebApp/master/start-service.sh"
RUN chmod 755 /home/TestWebApp/*.sh
RUN su -  TestWebApp -c "/usr/bin/wget -O testwebapp.TEST.properties -q -N https://raw.githubusercontent.com/altran/Whydah-TestWebApp/master/testwebapp.TEST.properties"
RUN su - TestWebApp -c "/home/TestWebApp/update-service.sh"
#RUN su - TestWebApp -c "/home/TestWebApp/start-service.sh &"

## Install UserAdminService
RUN su -  UserAdminService -c "/usr/bin/wget -O update-service.sh -q -N https://raw.githubusercontent.com/altran/Whydah-UserAdminService/master/update-service.sh"
RUN su -  UserAdminService -c "/usr/bin/wget -O start-service.sh -q -N  https://raw.githubusercontent.com/altran/Whydah-UserAdminService/master/start-service.sh"
RUN chmod 755 /home/UserAdminService/*.sh
RUN su -  UserAdminService -c "/usr/bin/wget -O useradminservice.PROD.properties -q -N https://raw.githubusercontent.com/altran/Whydah-UserAdminService/master/src/main/resources/useradminservice.TEST_LOCALHOST.properties"
RUN su - UserAdminService -c "/home/UserAdminService/update-service.sh"
#RUN su - UserAdminService -c "/home/UserAdminService/start-service.sh &"

## Install UserAdminWebApp
RUN su -  UserAdminWebApp -c "/usr/bin/wget -O update-service.sh -q -N https://raw.githubusercontent.com/altran/Whydah-UserAdminWebApp/master/update-service.sh"
RUN su -  UserAdminWebApp -c "/usr/bin/wget -O start-service.sh -q -N  https://raw.githubusercontent.com/altran/Whydah-UserAdminWebApp/master/start-service.sh"
RUN chmod 755 /home/UserAdminWebApp/*.sh
RUN su -  UserAdminWebApp -c "/usr/bin/wget -O useradminwebapp.PROD.properties -q -N https://raw.githubusercontent.com/altran/Whydah-UserAdminWebApp/master/src/main/resources/useradminwebapp.TEST_LOCALHOST.properties"
RUN su - UserAdminWebApp -c "/home/UserAdminWebApp/update-service.sh"
#RUN su - UserAdminWebApp -c "/home/UserAdminWebApp/start-service.sh &"

## Install UserIdentityBackend
RUN su -  UserIdentityBackend -c "/usr/bin/wget -O update-service.sh -q -N https://raw.githubusercontent.com/altran/Whydah-UserIdentityBackend/master/update-service.sh"
RUN su -  UserIdentityBackend -c "/usr/bin/wget -O start-service.sh -q -N  https://raw.githubusercontent.com/altran/Whydah-UserIdentityBackend/master/start-service.sh"
RUN chmod 755 /home/UserIdentityBackend/*.sh
RUN su -  UserIdentityBackend -c "/usr/bin/wget -O useridentitybackend.PROD.properties -q -N https://raw.githubusercontent.com/altran/Whydah-UserIdentityBackend/master/src/main/resources/useridentitybackend.TEST_LOCALHOST.properties"
RUN su - UserIdentityBackend -c "/home/UserIdentityBackend/update-service.sh"
RUN su -  UserIdentityBackend -c "mkdir /home/UserIdentityBackend/bootstrapdata"
RUN su -  UserIdentityBackend -c "mkdir /home/UserIdentityBackend/bootstrapdata/ldap"
RUN su -  UserIdentityBackend -c "mkdir /home/UserIdentityBackend/bootstrapdata/hsqldb"
RUN su -  UserIdentityBackend -c "mkdir /home/UserIdentityBackend/bootstrapdata/lucene"
RUN su -  UserIdentityBackend -c "mkdir /home/UserIdentityBackend/testdata"
COPY testdata /home/UserIdentityBackend/testdata
RUN su - UserIdentityBackend -c "/home/UserIdentityBackend/start-service.sh &"

## Install Apache and set up proxypasses
RUN yum install -y httpd
RUN /usr/bin/wget -O /etc/httpd/conf.d/whydah.conf -q -N https://raw.githubusercontent.com/altran/Whydah/master/config/apache/whydah.conf


## Set up start of services

RUN yum -y install python-setuptools
RUN easy_install supervisor
RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN ln-s etc/supervisor/conf.d/supervisord.conf /etc/supervisord.conf
#EXPOSE 22 80 
CMD ["/usr/bin/supervisord"]
# RUN httpd
