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


RUN adduser  UserIdentityBackend

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
EXPOSE 22 80 9995
CMD ["/usr/bin/supervisord"]
